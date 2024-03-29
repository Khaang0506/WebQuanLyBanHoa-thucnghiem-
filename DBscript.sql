USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 10/31/2021 10:50:58 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'L:\system\SQL\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'L:\system\SQL\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDDH] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[MaSP] [int] NOT NULL,
	[MaDDH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPN] [int] IDENTITY(1,1) NOT NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
	[MaPN] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangDonHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[UuDai] [int] NULL,
	[MaKH] [int] NULL,
	[MaNV] [int] NULL,
	[DaHuy] [bit] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [char](100) NULL,
	[SoDienThoai] [char](12) NULL,
	[MaThanhVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
	[UuDai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThanhVien_Quyen]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien_Quyen](
	[MaLoaiTV] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [char](100) NULL,
	[SoDienThoai] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[TenNV] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [char](12) NULL,
	[Email] [char](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
	[MaNCC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Moi] [int] NULL,
	[DaXoa] [bit] NULL,
	[MaNCC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 10/31/2021 10:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SoDienThoai] [char](12) NULL,
	[Email] [char](100) NULL,
	[MaLoaiTV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (38, N'Bó Hoa Hồng Xanh', 6, CAST(350000 AS Decimal(18, 0)), 22, 31)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (39, N'Những nhành Lavender', 5, CAST(300000 AS Decimal(18, 0)), 7, 31)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (40, N'Bó Hồng Đỏ', 1, CAST(450000 AS Decimal(18, 0)), 2, 31)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (41, N'Bình Sen', 1, CAST(400000 AS Decimal(18, 0)), 5, 31)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (42, N'Bó Tulip', 3, CAST(350000 AS Decimal(18, 0)), 6, 32)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (43, N'Bó Hoa Phi Yến', 12, CAST(300000 AS Decimal(18, 0)), 13, 33)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (44, N'Bó Hồng Đỏ', 2, CAST(450000 AS Decimal(18, 0)), 2, 34)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [TenSP], [SoLuong], [DonGia], [MaSP], [MaDDH]) VALUES (45, N'Đoá Cẩm Tú Cầu', 1, CAST(50000 AS Decimal(18, 0)), 1, 34)
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] ON 

INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (1, NULL, NULL, 1, 1)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (2, NULL, NULL, 1, 2)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (3, NULL, NULL, 2, 3)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (4, NULL, NULL, 5, 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (5, NULL, NULL, 9, 6)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (6, NULL, NULL, 9, 7)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (7, NULL, NULL, 6, 2)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (8, CAST(200000 AS Decimal(18, 0)), 5, 10, 7)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (9, CAST(100000 AS Decimal(18, 0)), 6, 10, 5)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (10, CAST(90000000 AS Decimal(18, 0)), 10, 12, 14)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (11, CAST(400000 AS Decimal(18, 0)), 10, 13, 1)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (12, CAST(200000 AS Decimal(18, 0)), 1, 14, 18)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (14, CAST(2000000 AS Decimal(18, 0)), 10, 16, 18)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (15, CAST(3000000 AS Decimal(18, 0)), 10, 17, 22)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (16, CAST(500000 AS Decimal(18, 0)), 2, 18, 13)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [DonGiaNhap], [SoLuongNhap], [MaPN], [MaSP]) VALUES (17, CAST(1000000 AS Decimal(18, 0)), 5, 19, 17)
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangDonHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [MaNV], [DaHuy], [DaXoa]) VALUES (31, CAST(N'2021-10-29 20:45:26.517' AS DateTime), 0, NULL, 0, 0, 28, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangDonHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [MaNV], [DaHuy], [DaXoa]) VALUES (32, CAST(N'2021-10-29 20:46:16.360' AS DateTime), 0, NULL, 0, 0, 29, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangDonHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [MaNV], [DaHuy], [DaXoa]) VALUES (33, CAST(N'2021-10-29 20:46:48.953' AS DateTime), 0, NULL, 0, 0, 30, NULL, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangDonHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [MaNV], [DaHuy], [DaXoa]) VALUES (34, CAST(N'2021-10-29 22:39:10.783' AS DateTime), 0, NULL, 0, 0, 31, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1, N'Sơn Tùng M-TP', N'Hà Nội', N'mtp@gmail.com                                                                                       ', N'0369369369  ', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (2, N'Mộ Dung Phục', N'Quận 3', N'modungphuc@gmail.com                                                                                ', N'0303030303  ', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (3, N'Hư Trúc', N'Quận 10', N'hutruc@gmail.com                                                                                    ', N'0100010001  ', 2)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (4, N'Quang Trung', N'Bình Định', N'quangtrung@gmail.com                                                                                ', N'0987987987  ', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (5, N'Tôn Ngộ Không', N'Quận 2', N'tonngokhong@gmail.com                                                                               ', N'0202020202  ', 3)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (6, N'Enimem', N'USA', N'enimem@gmail.com                                                                                    ', N'1231231230  ', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (7, N'Sa Ngộ Tĩnh', N'Quận Bình Thạnh', N'sangotinh@gmail.com                                                                                 ', N'0565656560  ', 4)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (8, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (13, N'Tester 1', N'100 Lê Đại Hành', N'thanhvien1@gmail.com                                                                                ', N'0321321321  ', 9)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (18, N'hàha', N'100 Lê Đại Hành', N'nhk06052001@gmail.com                                                                               ', N'0321321321  ', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (19, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (20, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (21, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (22, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (23, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (24, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (25, N'Doãn Chí Bình', N'Quận 5', N'doanchibinh@gmail.com                                                                               ', N'0505050505  ', 5)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (26, N'Mộ Dung Phục', N'Quận 3', N'modungphuc@gmail.com                                                                                ', N'0303030303  ', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (27, N'Sơn Tùng', N'100 Lê Đại Hành, Quận 1', N'tungson@gmail.com                                                                                   ', N'0258258258  ', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (28, N'Mộ Dung Phục', N'Quận 3', N'modungphuc@gmail.com                                                                                ', N'0303030303  ', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (29, N'Sa Ngộ Tĩnh', N'Quận Bình Thạnh', N'sangotinh@gmail.com                                                                                 ', N'0565656560  ', 4)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (30, N'Sa Ngộ Tĩnh', N'Quận Bình Thạnh', N'sangotinh@gmail.com                                                                                 ', N'0565656560  ', 4)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (31, N'Mộ Dung Phục', N'Quận 3', N'modungphuc@gmail.com                                                                                ', N'0303030303  ', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'Admin', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'Member', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (3, N'VIP', 20)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (4, N'Thường', 10)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'DangKy', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLyDonHang', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLyQuyen', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLySanPham', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'QuanLySanPham', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTri', NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (1, N'Hoa Tươi Đà Lạt', N'Đà Lạt', N'hoatuoidalat@gmail.com                                                                              ', N'0147147147  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (2, N'Cô ba Sài Gòn', N'TP HCM', N'cobasaigon@gmail.com                                                                                ', N'0159159159  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (3, N'Miền Tây hữu tình', N'Đồng Tháp', N'mientayhuutinh@gmail.com                                                                            ', N'0121212120  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (4, N'Bốn mùa', N'Hà Nội', N'bonmua@gmail.com                                                                                    ', N'0456456456  ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai]) VALUES (5, N'Orange', N'Hà Lan', N'orange@gmail.com                                                                                    ', N'1224564561  ')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TaiKhoan], [MatKhau], [TenNV], [DiaChi], [SoDienThoai], [Email]) VALUES (1, N'admin1', N'12345', N'Lính Thuỷ Đánh Bạc', N'Quận 3', N'0330330330  ', N'linhthuydanhbac@gmail.com                                                                           ')
INSERT [dbo].[NhanVien] ([MaNV], [TaiKhoan], [MatKhau], [TenNV], [DiaChi], [SoDienThoai], [Email]) VALUES (2, N'admin2', N'12345', N'Lộc Fuho', N'Quận 7', N'0770770770  ', N'locfuho@gmail.com                                                                                   ')
INSERT [dbo].[NhanVien] ([MaNV], [TaiKhoan], [MatKhau], [TenNV], [DiaChi], [SoDienThoai], [Email]) VALUES (3, N'admin3', N'12345', N'Odin Allfather', N'Quận 9', N'0990990990  ', N'odin@gmail.com                                                                                      ')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (1, CAST(N'2021-09-15 00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (2, CAST(N'2021-09-15 12:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (3, CAST(N'2021-09-16 12:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (4, CAST(N'2021-09-20 12:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (5, CAST(N'2021-09-21 12:00:00.000' AS DateTime), 0, 3)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (6, CAST(N'2021-09-21 12:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (7, CAST(N'2021-09-21 12:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (8, CAST(N'2021-09-21 12:00:00.000' AS DateTime), 0, 4)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (9, CAST(N'2021-09-21 12:00:00.000' AS DateTime), 0, 5)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (10, CAST(N'2021-10-30 00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (11, CAST(N'2021-10-27 22:18:08.807' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (12, CAST(N'2021-10-27 22:26:54.570' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (13, CAST(N'2021-10-28 14:24:22.240' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (14, CAST(N'2021-10-28 14:33:45.537' AS DateTime), 0, 4)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (16, CAST(N'2021-10-29 22:43:52.213' AS DateTime), 0, 3)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (17, CAST(N'2021-10-29 22:46:33.077' AS DateTime), 0, 1)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (18, CAST(N'2021-10-29 22:48:50.910' AS DateTime), 0, 4)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap], [DaXoa], [MaNCC]) VALUES (19, CAST(N'2021-10-31 00:00:00.000' AS DateTime), 0, 4)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangKy', N'Đăng ký')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyDonHang', N'Quản lý đơn hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyQuyen', N'Quản lý phân quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLySanPham', N'Quản lý sản phẩm')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quản trị')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (1, N'Đoá Cẩm Tú Cầu', CAST(50000 AS Decimal(18, 0)), CAST(N'2021-09-15 00:00:00.000' AS DateTime), 10, N'CamTuCau.png', N'Cẩm tú cầu là tượng trưng cho sự lạnh lùng, vô cảm. ... Nên từ đó về sau, cẩm tú cầu cũng là loài hoa gửi gắm những lời xin lỗi. Và, từ vẻ bề ngoài với những cánh hoa mỏng manh, chen chúc nhau tạo thành một quả cầu hoa, nên cẩm tú cầu còn tượng trưng cho sự biết ơn và chân thành.', 2, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (2, N'Bó Hồng Đỏ', CAST(450000 AS Decimal(18, 0)), CAST(N'2021-09-15 00:00:00.000' AS DateTime), 37, N'HoaHongDo.png', N'Hoa hồng đỏ truyền tải những cảm xúc sâu sắc – có thể là tình yêu, sự mong đợi hoặc khát khao. Hoa hồng đỏ cũng có thể được sử dụng để truyền đạt sự trân trọng, ngưỡng mộ hoặc sự chân thành. Một bông hồng đỏ thẫm còn được sử dụng để truyền tải sự hối tiếc và nỗi buồn chân thành.
', 1, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (3, N'Bó Hồng Tím', CAST(650000 AS Decimal(18, 0)), CAST(N'2021-09-15 12:00:00.000' AS DateTime), 22, N'HoaHongTim.png', N'Đóa hồng tím là lời nhắn nhủ tới người đó rằng, lần đầu tiên gặp gỡ đầu tiên đã chiếm trọn linh hồn của người tặng hoa, mà sức cuốn hút không thể nào giải thích được. Vì thế, nếu nhận được hoa hồng tím từ một ai đó có nghĩa là bạn đã khiến người họ say như “điếu đổ” đó.
', 1, 0, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (5, N'Bình Sen', CAST(400000 AS Decimal(18, 0)), CAST(N'2021-09-21 12:00:00.000' AS DateTime), 19, N'HoaSen.png', N'Hoa sen là tái hiện cho sự bừng tỉnh, tinh khôi, vươn lên từ bùn nhơ, vượt lên trên sự khó khăn trên đường đời. Ngoài ra, ý nghĩa hoa sen còn tượng trưng cho tấm lòng hướng thiện, theo đạo Phật, trái tim từ bi bác ái, độ chúng sinh. Hoa sen còn đi vào trong những câu chuyện Phật học, gắn liền với hình ảnh Đức Phật đản sinh và câu chuyện đi bảy bước nở hoa lưu truyền trong dân gian. 
', 1, 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (6, N'Bó Tulip', CAST(350000 AS Decimal(18, 0)), CAST(N'2021-09-21 12:00:00.000' AS DateTime), 7, N'HoaTulip.png', N'Hoa Tulip tượng trưng cho sự nổi tiếng, giàu có và tình yêu hoàn hảo. Có lẽ vì nó nở vào mùa xuân, khi bóng tối của những ngày đông đã bị xóa nhòa, Tulip còn trở thành biểu tượng cho cuộc sống vĩnh hằng.
', 1, 0, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (7, N'Những nhành Lavender', CAST(300000 AS Decimal(18, 0)), CAST(N'2021-09-21 12:00:00.000' AS DateTime), 20, N'Lavender.png', N'Người Việt thường có câu “màu tím thuỷ chung”, do vậy oải hương với màu tím đặc trưng đã trở thành biểu tượng của sự chung thuỷ trong tình yêu. Lavender còn được biết với cái tên “Thảo dược tình yêu” (Herb of love). Nó tượng trưng cho tình yêu bền bỉ, sắc son, bên nhau đến khi “đầu bạc răng long”, mãi không chia lìa.
', 2, 0, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (8, N'Bó Mẫu Đơn', CAST(150000 AS Decimal(18, 0)), CAST(N'2021-09-21 12:00:00.000' AS DateTime), 35, N'MauDon.png', N'Trung Quốc : Quê hương của hoa Mẫu Đơn, đây là “quốc sắc thiên hương”, loài hoa của sự vương giả, thanh cao và sắc đẹp. Đây là loài hoa của sự giàu sang, phú quý nên được làm quà tặng nhân dịp khai trương, chúc mừng với mong muốn cuộc sống của người nhận sẽ hạnh phúc đong đầy và sung túc.
', 2, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (11, N'Bó Hồng Vàng Kim', CAST(500000 AS Decimal(18, 0)), CAST(N'2021-09-21 12:00:00.000' AS DateTime), 10, N'HoaHongVang.png', N'Màu vàng của sự tươi sáng, hạnh phúc, ấm áp, là loài hoa biểu tượng cho tình bạn chân thành, không vụ lợi. Đây còn là lời chúc may mắn, tốt lành tới những người thương yêu nhất của bạn. Ngoài ra, hoa hồng màu vàng còn đặc biệt dành cho người mẹ kính yêu thể hiện lòng biết ơn, tôn kính của phận làm con
', 2, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (12, N'Bó Cúc Hoạ Mi', CAST(350000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 25, N'CucHoaMi.png', N'Cúc họa mi là loài hoa nhỏ thuộc họ Cúc (Asteraceae), thường mọc hoang, có những cánh trắng ngần, từ giữa tỏa ra như hình nan hoa quanh một nhụy vàng tươi.  Hoa cúc họa mi được coi là hoa báo đông vì loài hoa này nở vào thời điểm cuối thu, đầu đông.
', 0, 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (13, N'Bó Hoa Phi Yến', CAST(300000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 10, N'PhiYen.png', N'Vẻ đẹp của hoa phi yến thực rất nổi bật. Từng bông hoa nhỏ kết thành đoàn dài với nhau, tạo ra những cành hoa mềm mại, nhỏ bé. ... Hoa phi yến trắng tượng trưng cho sự thanh khiết và trang nhã, đồng thời nó thể hiện cho một tình yêu trong sáng không toan tính và sự vui vẻ. Bạn có thể bắt gặp hoa phi yến trong lễ cưới hoặc có thể dành tặng loài hoa phi yến trắng cho mọi người trong những dịp đặc biệt.', 2, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (14, N'Bình Lan Hồ Điệp', CAST(900000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 15, N'LanHoDiep.png', N'Hoa lan hồ điệp sở hữu các tôn màu tươi sáng như: trắng ; hồng ; tím; xanh… kèm theo đó là hương thơm dịu mát luôn hứa hẹn sẽ mang đến cho phòng khách sự thỏa mái dễ chịu nhưng vô cùng đẳng cấp. Đồng thời tạo được sự sự gần gũi giữa con người với thiên thiên.​
', 0, 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (15, N'Bó Hoa Hướng Dương', CAST(350000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 15, N'HuongDuong.png', N'Hoa hướng dương vàng: mang màu vàng tươi mới, ấm áp nên mang nhiều ý nghĩa nhưng ý nghĩa biểu tượng niềm tin, trường thọ, hạnh phúc được biết đến nhiều nhất.
', 0, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (16, N'Chậu Hoa Huệ', CAST(400000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 12, N'HoaHue.png', N'Hoa huệ là loài hoa đẹp gắn liền với mỗi con người Việt Nam vào mỗi dịp lễ, Tết. Hoa huệ là loài hoa nở vào ban đêm, có hương thơm nồng dàn đặc trưng. Hoa huệ có tên khoa học là Polianthes tuberosa, thuộc họ Agavaceae, là loài cây thân thảo, sống lâu năm. Hoa có kích thước nhỏ, cánh hoa có hình thìa, boa hoa hình phễu, có màu trắng.
', 0, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (17, N'Bó Hoa Cẩm Chướng', CAST(500000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 25, N'CamChuong.png', N'Hoa cẩm chướng là loài hoa mang ý nghĩa tượng trưng cho tình yêu. Tuy nhiên, ý nghĩa tình yêu của hoa cẩm chướng không đơn thuần chỉ là tình yêu đôi lứa, mà còn là tình cảm, sự yêu thương giữa những người thân trong gia đình, giữa những người bạn. Ngoài ra, hoa cẩm chướng cũng được dùng với ý nghĩa để thể hiện sự đam mê.
', 1, 0, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (18, N'Bình Hoa Lay Ơn', CAST(250000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 15, N'LayOn.png', N'Hoa lay ơn (Gladiolus) có nguồn gốc từ châu Phi, là loài hoa lưỡng tính, mọc thành chuỗi dọc. Hoa có hình phễu, mỗi cành hoa có từ 5 – 7 bông với các cánh mỏng xếp chồng lên nhau. Lay ơn là hình ảnh hoa đẹp mang ý nghĩa biểu tượng cho một tình yêu thầm kín mà sâu sắc và thể hiện sự say mê, nhiệt huyết trong cuộc sống.
', 0, 0, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (19, N'Bó Cát Tường', CAST(350000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 29, N'CatTuong.png', N'Cát tường là giống hoa được người Nhật Bản nói riêng và Á Đông nói chung rất ưa chuộng, vì cát tường có ý nghĩa là “may mắn”. Mỗi khi ai đó tặng bạn một bó hoa cát tường thì người đó thầm mong bạn luôn luôn có những giây phút thoải mái, thanh bình và may mắn trong cuộc sống.
', 0, 0, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (20, N'Bó Hoa Đồng Tiền', CAST(200000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 31, N'DongTien.png', N'Hoa đồng tiền (cúc đồng tiền) có tên khoa học là Gerbera Jamesonii, nguồn gốc đầu tiên tại Nam Phi, Châu Á. Đây là loại hoa thân thảo, cao từ 20 – 55cm, cuống dài, hoa thường mọc trên ngọn, cánh xếp chồng lên nhau, cánh hoa mỏng. Hoa cũng được tặng vào những dịp như khai trương. Chúng sẽ giúp bạn truyền tải thông điệp người nhận sẽ có nhiều tài lộc và thuận lợi trong việc làm ăn.
', 1, 0, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (21, N'Bó Hoa Thạch Thảo', CAST(250000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 62, N'ThachThao.png', N'Hoa Thạch Thảo tím tượng trưng cho sự thủy chung, son sắt. Nếu tặng hoa cho người thương yêu sẽ mang hàm ý muốn gắn bó với họ cả đời, luôn đồng hành cùng nhau những lúc khó khăn.
', 2, 0, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [SoLuongTon], [HinhAnh], [MoTa], [Moi], [DaXoa], [MaNCC]) VALUES (22, N'Bó Hoa Hồng Xanh', CAST(350000 AS Decimal(18, 0)), CAST(N'2021-09-22 12:00:00.000' AS DateTime), 16, N'HoaHongXanh.png', N'Hoa hồng xanh là màu sắc của sự hy vọng và trường tồn vĩnh cửu, trong tình yêu hoa hồng xanh là biểu trưng cho một tình yêu mãnh liệt, sự chung thuỷ. Hoa hồng xanh còn là biểu tượng cho những điều bí ẩn huyền bí, khó giải đáp. Màu xanh luôn được lựa chọn để thể hiện những ước mơ, hoài bão tận cùng của con người.
', 2, 0, 3)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (1, N'user1', N'123456', N'Mộ Dung Phục', N'Quận 3', N'0303030303  ', N'modungphuc@gmail.com                                                                                ', 1)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (2, N'user2', N'123456', N'Hư Trúc', N'Quận 10', N'0100010001  ', N'hutruc@gmail.com                                                                                    ', 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (3, N'user3', N'123456', N'Tôn Ngộ Không', N'Quận 2', N'0202020202  ', N'tonngokhong@gmail.com                                                                               ', 3)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (4, N'user4', N'123456', N'Sa Ngộ Tĩnh', N'Quận Bình Thạnh', N'0565656560  ', N'sangotinh@gmail.com                                                                                 ', 4)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (5, N'user5', N'123456', N'Doãn Chí Bình', N'Quận 5', N'0505050505  ', N'doanchibinh@gmail.com                                                                               ', 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [SoDienThoai], [Email], [MaLoaiTV]) VALUES (9, N'thanhvien1', N'123456', N'Tester 1', N'100 Lê Đại Hành', N'0321321321  ', N'thanhvien1@gmail.com                                                                                ', 4)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
