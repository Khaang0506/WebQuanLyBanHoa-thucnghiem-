using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQuanLyBanHoa.Models;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;
using System.Web.Security;

namespace WebQuanLyBanHoa.Controllers
{
    
    public class HomeController : Controller
    {
        // GET: Home
        QuanLyBanHoaDataContext db = new QuanLyBanHoaDataContext();
        public ActionResult Index()
        {
            //tạo viewbag lấy list sản phẩm mới
            var lstMoi = db.SanPhams.Where(x => x.Moi == 1 && x.DaXoa == false);
            ViewBag.lsMoi = lstMoi;
            //tạo viewbag list sản phẩm bán chạy
            var lstBanChay = db.SanPhams.Where(x => x.Moi == 2 && x.DaXoa == false);
            ViewBag.lsBC = lstBanChay;
            return View();
        }
        public ActionResult MenuPartial()
        {
            var lstSP = db.SanPhams;
            return PartialView(lstSP);
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(ThanhVien tv)
        {
            //Kiểm tra captcha hợp lệ
            if(this.IsCaptchaValid("Captcha is not valid"))
            {
                if (ModelState.IsValid) { 
                ViewBag.ThongBao = "Đăng kí thành công";
                //thêm khách hàng vào csdl
                db.ThanhViens.InsertOnSubmit(tv);
                db.SubmitChanges();
                }
                else
                {
                    ViewBag.ThongBao = "Đăng kí thất bại";
                }
                return View();
            }
            ViewBag.ThongBao = "Sai mã Captcha";

            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //string sTaiKhoan = f["txtTenDangNhap"].ToString();
            //string sMatKhau = f["txtMatKhau"].ToString();

            //ThanhVien tv = db.ThanhViens.SingleOrDefault(x => x.TaiKhoan == sTaiKhoan && x.MatKhau == sMatKhau);
            //if(tv != null)
            //{
            //    Session["TaiKhoan"] = tv;
            //    return Content("<script>window.location.reload();</script>");
            //}

            //return Content("Tài khoản hoặc mật khẩu không đúng!");
            string taikhoan = f["txtTenDangNhap"].ToString();
            string matkhau = f["txtMatKhau"].ToString();
            //Truy vấn kiểm tra đăng nhập lấy thông tin thành viên
            ThanhVien tv = db.ThanhViens.SingleOrDefault(x => x.TaiKhoan == taikhoan && x.MatKhau == matkhau);
            if (tv != null)
            {
                Session["TaiKhoan"] = tv;
                //lấy ra list quyền thành viên tương ứng với loại
                var lstQuyen = db.LoaiThanhVien_Quyens.Where(x=>x.MaLoaiTV==tv.MaLoaiTV);
                //Duyệt list quyền
                string Quyen = "";
                if (lstQuyen.Count() != 0)
                {
                    foreach (var item in lstQuyen)
                    {
                        Quyen += item.Quyen.MaQuyen + ",";
                    }
                    Quyen = Quyen.Substring(0, Quyen.Length - 1);//Cắt đi dấu phẩy
                    PhanQuyen(tv.TaiKhoan.ToString(), Quyen);
                }
                return Content("<script>window.location.reload();</script>");
            }
            return Content("Tài khoản hoặc mật khẩu không đúng!");
        }
        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1,
                                TaiKhoan,//user
                                DateTime.Now,//begin
                                DateTime.Now.AddHours(3),//time out
                                false,//remember?
                                Quyen,
                                FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName,
                                FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

            Response.Cookies.Add(cookie);
        }
        //Tạo trang ngăn chặn quyền truy cập
        public ActionResult LoiPhanQuyen()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }

        //Giải phóng biến cho vùng nhớ
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}