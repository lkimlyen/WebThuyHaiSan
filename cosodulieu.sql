USE [master]
GO
/****** Object:  Database [database]    Script Date: 20/10/2016 22:17:47 ******/
CREATE DATABASE [database]
GO
ALTER DATABASE [database] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [database] SET ARITHABORT OFF 
GO
ALTER DATABASE [database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [database] SET  MULTI_USER 
GO
ALTER DATABASE [database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [database] SET DB_CHAINING OFF 
GO
USE [database]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idshop] [varchar](10) NULL,
	[name] [nvarchar](255) NULL,
	[birthday] [datetime] NULL,
	[sex] [bit] NULL,
	[idcard] [varchar](9) NULL,
	[image] [varchar](255) NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[moblie] [varchar](20) NULL,
	[date_added] [datetime] NULL,
	[last_modified] [datetime] NULL,
	[status] [bit] NULL,
	[note] [nvarchar](255) NULL,
	[randomkey] [varchar](20) NULL,
	[state] [nvarchar](255) NULL,
	[billingname] [nvarchar](255) NULL,
	[billingaddress] [nvarchar](255) NULL,
	[billingphone] [varchar](20) NULL,
	[billingstate] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iddh] [int] NULL,
	[idsp] [int] NULL,
	[soluong] [int] NULL,
	[dongia] [decimal](18, 0) NULL,
	[thanhtien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idshop] [varchar](10) NULL,
	[price] [decimal](18, 0) NULL,
	[idkh] [int] NULL,
	[phonenumber] [varchar](20) NULL,
	[thoidiemdathang] [datetime] NULL,
	[tennguoinhan] [nvarchar](255) NULL,
	[diachi] [nvarchar](255) NULL,
	[gmail] [varchar](255) NULL,
	[status] [bit] NULL,
	[state] [nvarchar](255) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_admin]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idkh] [int] NULL,
	[TenNguoiGui] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGui] [datetime] NULL,
	[LuotGui] [bit] NULL,
	[DaDocKH] [bit] NULL,
	[DaDocAD] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tbl_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_header]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_header](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](255) NULL,
	[phone1] [varchar](50) NULL,
	[tittle] [nvarchar](255) NULL,
	[phone2] [varchar](50) NULL,
	[shortcuticon] [varchar](255) NULL,
 CONSTRAINT [PK_tbl_header] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_information]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_information](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tbl_information] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_menu]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](255) NULL,
	[url] [nvarchar](255) NULL,
	[ThuTu] [int] NULL,
 CONSTRAINT [PK_tbl_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_news]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](255) NOT NULL,
	[TomTat] [nvarchar](255) NOT NULL,
	[UrlHinh] [nvarchar](255) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[LuotXem] [int] NULL CONSTRAINT [DF_tbl_news_LuotXem]  DEFAULT ((0)),
	[NgayCapNhat] [datetime] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NOT NULL,
	[UrlHinh] [nvarchar](255) NULL,
	[GiaHienTai] [decimal](18, 0) NOT NULL CONSTRAINT [DF_tbl_Product_GiaHienTai1]  DEFAULT ((0)),
	[MoTa] [nvarchar](max) NULL,
	[MoTaCT] [nvarchar](max) NULL,
	[SoLuongTon] [int] NOT NULL CONSTRAINT [DF_tbl_Product_SoLuongTon1]  DEFAULT ((1)),
	[SLDaBan] [int] NOT NULL CONSTRAINT [DF_tbl_Product_SLDaBan1]  DEFAULT ((0)),
	[LuotXem] [int] NULL CONSTRAINT [DF_tbl_Product_LuotXem1]  DEFAULT ((0)),
	[NgayCapNhat] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[IDLoaiSP] [int] NULL,
	[GiaCu] [decimal](18, 0) NULL,
	[KhuyenMai] [int] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_product_types]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_product_types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_seo]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_seo](
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_seo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_shoppingcart]    Script Date: 20/10/2016 22:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shoppingcart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idGH] [nvarchar](max) NOT NULL,
	[idSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Thanhtien] [decimal](18, 0) NULL,
	[NgayMua] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_shoppingcart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [idshop], [name], [birthday], [sex], [idcard], [image], [email], [password], [address], [moblie], [date_added], [last_modified], [status], [note], [randomkey], [state], [billingname], [billingaddress], [billingphone], [billingstate]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, N'lkimlyen2912@gmail.com', N'hoahongtim', NULL, NULL, CAST(N'2016-10-12 13:29:13.183' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([id], [idshop], [name], [birthday], [sex], [idcard], [image], [email], [password], [address], [moblie], [date_added], [last_modified], [status], [note], [randomkey], [state], [billingname], [billingaddress], [billingphone], [billingstate]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, N'luongthiyen1060@hotmail.com', N'hoahongtim', NULL, NULL, CAST(N'2016-10-12 14:30:27.897' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [iddh], [idsp], [soluong], [dongia], [thanhtien]) VALUES (1, 1, 2, 1, CAST(750000 AS Decimal(18, 0)), CAST(750000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [idshop], [price], [idkh], [phonenumber], [thoidiemdathang], [tennguoinhan], [diachi], [gmail], [status], [state]) VALUES (1, NULL, CAST(750000 AS Decimal(18, 0)), 3, NULL, CAST(N'2016-10-20 16:27:46.967' AS DateTime), NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[tbl_header] ON 

INSERT [dbo].[tbl_header] ([id], [image], [phone1], [tittle], [phone2], [shortcuticon]) VALUES (1, N'logo.png', N' 091 3456 991', N'Hasasa.vn: Cung cấp sỉ &amp; lẻ hải sản sạch, tươi sống, đông lạnh, ngon, giá rẻ', N' 091 3456 993', N'icon.png')
SET IDENTITY_INSERT [dbo].[tbl_header] OFF
SET IDENTITY_INSERT [dbo].[tbl_menu] ON 

INSERT [dbo].[tbl_menu] ([id], [TenMenu], [url], [ThuTu]) VALUES (1, N'Trang chủ', N'/Home/Index', 1)
INSERT [dbo].[tbl_menu] ([id], [TenMenu], [url], [ThuTu]) VALUES (2, N'Tươi sống', N'/Home/ProductType/1', 2)
INSERT [dbo].[tbl_menu] ([id], [TenMenu], [url], [ThuTu]) VALUES (3, N'Khô', N'/Home/ProductType/2', 3)
INSERT [dbo].[tbl_menu] ([id], [TenMenu], [url], [ThuTu]) VALUES (4, N'Đông lạnh', N'/Home/ProductType/3', 4)
INSERT [dbo].[tbl_menu] ([id], [TenMenu], [url], [ThuTu]) VALUES (5, N'Cá tươi mỗi ngày', N'/Home/Laycatuoi', 5)
SET IDENTITY_INSERT [dbo].[tbl_menu] OFF
SET IDENTITY_INSERT [dbo].[tbl_news] ON 

INSERT [dbo].[tbl_news] ([id], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [status]) VALUES (4, N'HẢI SẢN NÀO PHÙ HỢP BỔ SUNG DINH DƯỠNG CHO MẸ BẦU', N'Mẹ Bầu nên ăn những loại hải sản nào luôn là câu hỏi được nhiều người quan tâm nhất??? Vậy nên ăn hải sản nào để cả Mẹ và Bé đều khỏe mạnh? Em bé hấp thụ đầy đủ chất dinh dưỡng nhất và thông minh ngay từ khi còn nằm trong bụng Mẹ?
', N'hai-san7-500x515.jpg', N' Mẹ Bầu n&ecirc;n ăn những loại hải sản n&agrave;o lu&ocirc;n l&agrave; c&acirc;u hỏi được nhiều người quan t&acirc;m nhất??? Vậy n&ecirc;n ăn hải sản n&agrave;o để cả Mẹ v&agrave; B&eacute; đều khỏe mạnh? Em b&eacute;&nbsp;hấp thụ đầy đủ chất dinh dưỡng nhất v&agrave; th&ocirc;ng minh&nbsp;ngay từ khi c&ograve;n nằm trong bụng Mẹ?<br /><br /><span><span><strong>Hải sản</strong> l&agrave; nguồn dưỡng chất cực tốt cho b&agrave; bầu. Hải sản bao gồm c&aacute;, t&ocirc;m, cua, s&ograve;, ốc&hellip; cung cấp rất nhiều dưỡng chất c&oacute; lợi như protein, &iacute;t chất b&eacute;o b&atilde;o h&ograve;a v&agrave; rất gi&agrave;u axit omega-3 tốt cho sức khỏe, bổ sung sắt v&agrave; canxi cho cơ thể gi&uacute;p cả Mẹ v&agrave; B&eacute; đều khỏe mạnh. Bạn n&ecirc;n ăn hải sản điều độ v&agrave; thay đổi lu&acirc;n phi&ecirc;n để tr&aacute;nh bị ng&aacute;n<br /><br /><strong>✤ NHỮNG ĐIỀU MẸ BẦU CẦN LƯU &Yacute; N&Ecirc;N TR&Aacute;NH</strong><br /><br /></span></span>
<p>B&agrave; bầu n&ecirc;n tr&aacute;nh những loại c&aacute; biển (chứa nhiều thủy ng&acirc;n) như c&aacute; mập, c&aacute; kiếm, c&aacute; ngừ&hellip; C&aacute; hồi c&oacute; lượng thủy ng&acirc;n thấp n&ecirc;n bạn vẫn c&oacute; thể sử dụng (khoảng 1 bữa/tuần).</p>
<p>Kh&ocirc;ng ăn c&aacute; sống, gỏi c&aacute;, m&oacute;n sushi&hellip; C&aacute;c loại c&aacute; chưa được nấu ch&iacute;n dễ bị nhiễm khuẩn E.coli v&agrave; s&aacute;n n&ecirc;n c&oacute; thể g&acirc;y ngộ độc. Chỉ n&ecirc;n sử dụng những loại c&aacute; tươi v&agrave; nấu ch&iacute;n kỹ trước khi sử dụng. Kh&ocirc;ng n&ecirc;n ăn qu&aacute; 350g c&aacute;/tuần (chia đều khoảng 3 bữa c&aacute;, mỗi bữa khoảng 100g).</p>
<p>B&agrave; bầu kh&ocirc;ng n&ecirc;n ăn nội tạng c&aacute; hay c&aacute;c loại dầu gan c&aacute; v&igrave; ch&uacute;ng chứa rất nhiều vitamin A. Một lượng lớn vitamin A từ cơ thể người mẹ c&oacute; thể g&acirc;y hại cho em b&eacute;.</p>
<p>V&igrave; c&aacute; (t&ocirc;m, cua&hellip;) cũng rất gi&agrave;u chất đạm, bạn n&ecirc;n c&acirc;n bằng hợp l&yacute; nguồn dinh dưỡng n&agrave;y với c&aacute;c loại thực phẩm kh&aacute;c như thịt gia s&uacute;c, gia cầm. Nếu bữa cơm đ&atilde; c&oacute; m&oacute;n c&aacute; (t&ocirc;m, cua&hellip;) th&igrave; bạn n&ecirc;n cắt giảm c&aacute;c m&oacute;n chứa thịt.<br /><br /><strong>✤ HẢI SẢN GI&Agrave;U DINH DƯỠNG MẸ BẦU N&Ecirc;N ĂN</strong><br /><br />Theo lời khuy&ecirc;n của c&aacute;c chuy&ecirc;n gia, b&agrave; bầu n&ecirc;n bổ sung đủ 350-400 gram hải sản mỗi tuần, n&ecirc;n bổ sung đều đặn v&agrave; c&acirc;n bằng trong chế độ ăn uống hằng ng&agrave;y để cơ thể người Mẹ khỏe mạnh, khi đ&oacute; B&eacute; mới hấp thu đủ chất dinh dưỡng từ cơ thể của Mẹ&nbsp;<br /><br /><span>Những b&agrave; mẹ ăn c&aacute; (t&ocirc;m, cua&hellip;) trong thời gian mang thai c&oacute; khả năng giảm 72% hội chứng hen suyễn ở b&eacute; sau n&agrave;y. B&ecirc;n cạnh đ&oacute;, nh&oacute;m b&agrave; mẹ ăn 1-2 bữa c&aacute; (t&ocirc;m, cua&hellip;) một tuần cũng c&oacute; t&aacute;c dụng ph&ograve;ng tr&aacute;nh được chứng ch&agrave;m bội nhiễm ở b&eacute; &ndash; Đ&acirc;y l&agrave; kết quả nghi&ecirc;n cứu của c&aacute;c nh&agrave; khoa học Anh quốc.<br /><br /><span>Khi c&oacute; thai, đặc biệt l&agrave; từ th&aacute;ng thứ 3 trở đi cho đến l&uacute;c sinh nở, nhu cầu về năng lượng v&agrave; c&aacute;c chất dinh dưỡng của thai phụ tăng l&ecirc;n rất nhiều. Theo nhu cầu khuyến nghị về dinh dưỡng cho người VIệt Nam của Bộ Y tế, phụ nữ mang thai cần ăn th&ecirc;m mức năng lượng khoảng 300 &ndash; 500kcal v&agrave; cần tăng cường ăn th&ecirc;m kho&aacute;ng chất như canxi, sắt&hellip; mỗi ng&agrave;y để đảm bảo cung cấp dinh dưỡng gi&uacute;p thai nhi ph&aacute;t triển tốt nhất.</span></span></p>
<br />
<p><span><span><strong>1. C&aacute; ngừ</strong></span></span></p>
<p><span><span>Đ&acirc;y l&agrave; loại&nbsp;<strong><a href="http://www.dinhduongbabau.vn/">hải sản cần thiết bổ sung dinh dưỡng cho b&agrave; bầu</a>.&nbsp;</strong>C&oacute; nhiều người khi mang bầu lại kh&ocirc;ng d&aacute;m ăn c&aacute; ngừ v&igrave; sợ bị phong, nghĩ rằng kh&ocirc;ng tốt cho sức khỏe. Đ&oacute; l&agrave; quan niệm sai lầm. C&aacute; ngừ l&agrave; nguồn thực phẩm dồi d&agrave;o vitamin B6 c&oacute; t&aacute;c dụng rất tốt cho sức khỏe cơ bắp, da v&agrave; m&aacute;u của b&agrave; bầu<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/N%E1%BA%A1c%20c%C3%A1%20ng%E1%BB%AB.jpg" alt="" width="600" /><br /><br /></span></span></p>
<p><span><span><strong>2. Con trai&nbsp;</strong></span></span></p>
<p><span><span>C&aacute;c m&oacute;n ăn từ trai gi&uacute;p bổ sung canxi v&agrave; đặc biệt c&ograve;n gi&uacute;p b&agrave; bầu giảm chứng hoa mắt ch&oacute;ng mặt v&agrave; thiếu m&aacute;u. Ngo&agrave;i ra, c&aacute;c m&oacute;n ăn từ trai như canh trai nấu rau mồng tơi, ch&aacute;o trai...cũng l&agrave; m&oacute;n ăn bổ dưỡng tốt cho người bị đ&aacute;i th&aacute;o đường, tăng huyết &aacute;p&hellip;<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/Canh%20trai.jpg" alt="" width="600" /><br /></span></span></p>
<div><br />
<p><span><span><strong>3. H&agrave;u</strong></span></span></p>
<p><span><span>H&agrave;u l&agrave; loại<em>&nbsp;hải sản cần thiết bổ sung dinh dưỡng cho b&agrave; bầu</a>&nbsp;</em>v&igrave; n&oacute; l&agrave; nguồn thực phẩm dồi d&agrave;o chất sắt v&agrave; vitamin B12. Tuy nhi&ecirc;n b&agrave; bầu cần ch&uacute; &yacute; phải ăn h&agrave;u đ&atilde; được chế biến sạch v&agrave; ch&iacute;n để tr&aacute;nh đau bụng v&agrave; mắc c&aacute;c bệnh kh&aacute;c li&ecirc;n quan đến ti&ecirc;u h&oacute;a<br /></span></span></p>
<p><span><span><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/12369232_942521769174809_3359792190065496277_n.jpg" alt="" width="600" /><br /><br /></span></span></p>
<p><span><span><strong>4. C&aacute; m&ograve;i</strong></span></span></p>
<p><span><span>C&aacute; m&ograve;i rất gi&agrave;u canxi &ndash; l&agrave; nguồn dưỡng chất cần thiết cho&nbsp;thai phụ. Bạn c&oacute; thể ăn m&oacute;n c&aacute; n&agrave;y với salad khoai t&acirc;y v&agrave; nước sốt sẽ rất ngon miệng đấy<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/C%C3%A1%20M%C3%B2i.jpg" alt="" width="600" /><br /><br /></span></span></p>
<p><span><span><strong>5. T&ocirc;m</strong></span></span></p>
<p><span><span>T&ocirc;m rất gi&agrave;u chất dinh dưỡng đặc biệt l&agrave; canxi. V&igrave; vậy, chị em đừng bỏ qua loại&nbsp;<span style="text-decoration: underline;">hải sản cần thiết bổ sung dinh dưỡng cho b&agrave; bầu</span>&nbsp;n&agrave;y trong chế độ ăn h&agrave;ng tuần.</span></span></p>
<p style="text-align: left;"><span><span>T&ocirc;m c&oacute; thể chế biến được rất nhiều m&oacute;n ngon như t&ocirc;m chi&ecirc;n, t&ocirc;m hấp&hellip;&nbsp;<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/%5EB33B370CFA4D2D04CE246E7CC280EB2A598A252A2729E4E65A%5Epimgpsh_fullsize_distr.jpg" alt="" width="600" /></span></span><strong><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; T&ocirc;m H&ugrave;m BaBy </strong>thịt săn chắc, dai ngọt, gi&agrave;u dinh dưỡng n&ecirc;n c&aacute;c Mẹ thường bổ sung hằng tuần<br /><br /><br /><strong>6. C&aacute; hồi</strong></p>
<p><span><span>C&aacute; hồi l&agrave; nguồn thực phẩm rất gi&agrave;u vitamin B12, canxi. Bạn h&atilde;y thử chế biến m&oacute;n n&agrave;y với củ cải đường, nước sốt sữa chua v&agrave; c&aacute;c loại gia vị kh&aacute;c&hellip; sẽ rất hấp dẫn đấy<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/C%C3%A1%20H%E1%BB%93i%20N%C6%B0%E1%BB%9Bng.jpg" alt="" width="600" /><br /><br /><strong>7. Ngao - S&ograve; - Ốc&nbsp;</strong></span></span></p>
<p>Về mặt dinh dưỡng, Ngao - S&ograve; - Ốc l&agrave; thực phẩm cung cấp năng lượng, đặc biệt l&agrave; bổ sung chất đạm, kho&aacute;ng chất (canxi, sắt&hellip;), mỡ, cacbon hydrate&hellip; cho cơ thể. Ốc c&oacute; vị ngọt, t&iacute;nh h&agrave;n rất dễ ăn v&agrave; kh&ocirc;ng g&acirc;y ng&aacute;n như c&aacute;c m&oacute;n ăn kh&aacute;c n&ecirc;n đ&acirc;y cũng l&agrave; loại thực phẩm rất tốt cho thai phụ<br /><br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/%5EC769B4974D6C563056E70C6498A5094FD03712A337C8669A9F%5Epimgpsh_fullsize_distr.jpg?1471412403406" alt="" width="600" /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong> Ngao 2 Cồi</strong> thịt dai, ngọt lịm n&ecirc;n lu&ocirc;n l&agrave; sự lựa chọn h&agrave;ng đầu cho c&aacute;c Mẹ Bầu<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/%5EF684C13B446DBC341D91D6E99C9264C3D35F5E9A59F78FFCF4%5Epimgpsh_fullsize_distr.jpg?1471412438280" alt="" width="600" /><br /><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ốc Hương</strong> thit dai gi&ograve;n, ngọt hậu, b&eacute;o b&eacute;o n&ecirc;n c&aacute;c Mẹ hay mua về hấp sả, hấp gừng<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/%5EB6D96C5D1A465E73E5E5024629BCA5303E5949B4BFED6EE396%5Epimgpsh_fullsize_distr.jpg?1471412470785" alt="" width="600" /><br /><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Vẹm Xanh</strong> thịt mềm ngọt, dễ ăn n&ecirc;n c&aacute;c Mẹ Bầu thường mua về nấu ch&aacute;o</p>
<p><span><span>&nbsp;</span></span></p>
', 1, CAST(N'2016-10-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_news] ([id], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [status]) VALUES (14, N'7 LỢI ÍCH VÀNG TỪ HẢI SẢN MANG LẠI CHO SỨC KHỎE', N'Tại Sao Bạn Nên Bổ Sung Hải Sản Thường Xuyên??? ', N'Hải_sản.jpg', N'  <strong>Tại Sao Bạn N&ecirc;n Bổ Sung Hải Sản Thường Xuy&ecirc;n???&nbsp;</strong><br />✤Cho d&ugrave; bạn l&agrave; ai, cho d&ugrave; bạn l&agrave;m nghề g&igrave; th&igrave; sức khỏe l&agrave; đều quan trọng nhất n&ecirc;n ăn uống phải đầy đủ chất, đủ dinh dưỡng th&igrave; cơ thể mới khỏe mạnh, năng lượng mới dồi d&agrave;o, &yacute; tưởng mới phong ph&uacute;, l&agrave;m việc mới hiệu quả đ&uacute;ng kh&ocirc;ng ạ?<br />✤Ăn hải sản thật sự rất tốt cho sức khỏe v&igrave; hải sản gi&agrave;u vitamin v&agrave; kho&aacute;ng chất tự nhi&ecirc;n..... Vậy lợi &iacute;ch thật sự m&agrave; hải sản mang lại cho sức khỏe l&agrave; g&igrave;?<br /><br /><strong>1. Hải Sản Gi&uacute;p Ngăn Ngừa Bệnh Trầm Cảm</strong><br /><br />Hầu hết mọi người đều c&oacute; khả năng bị bệnh trầm cảm do stress k&eacute;o d&agrave;i. Trầm cảm c&oacute; li&ecirc;n quan đến h&agrave;m lượng axit b&eacute;o omega 3 trong cơ thể thấp. Trong khi đ&oacute;, hải sản chứa c&aacute;c hợp chất gi&uacute;p giảm nguy cơ bị mất tr&iacute; nhớ,<a href="http://afamily.vn/suc-khoe/vitamin-b-kim-ham-tien-trien-cua-benh-alzheimer-20100912075853805.chn" target="_blank">Alzheimer</a>&nbsp;v&agrave; trầm cảm ở mức độ n&agrave;o đ&oacute;.&nbsp;<strong>Hải sản&nbsp;</strong>l&agrave;m tăng lượng axit b&eacute;o omega3 (đặc biệt l&agrave; DHA) cho cơ thể. Ch&iacute;nh v&igrave; thế n&oacute; c&oacute; thể l&agrave;m giảm c&aacute;c dấu hiệu trầm cảm v&agrave; chống lại chứng trầm cảm kinh ni&ecirc;n.<br /><strong><br />2. Hải Sản Gi&uacute;p Cải Thiện Thị Gi&aacute;c</strong><br /><br />Trong c&aacute;c loại<strong>&nbsp;hải sản</strong>, đặc biệt l&agrave; c&aacute;c loại c&aacute; b&eacute;o rất gi&agrave;u axit b&eacute;o omega 3. Ch&iacute;nh v&igrave; vậy, nếu bạn thường xuy&ecirc;n ăn thủy hải sản sản sẽ rất tốt cho thị lực của mắt. Trong c&aacute;c loại t&ocirc;m, cua, rất gi&agrave;u vitamin A, c&oacute; t&aacute;c dụng cải thiện tầm nh&igrave;n. Một người ăn hải sản thường xuy&ecirc;n cũng c&oacute; thể cải thiện được t&igrave;nh trạng tho&aacute;i h&oacute;a điểm v&agrave;ng của mắt khi về gi&agrave;.<br /><br /><strong>3. Hải Sản Rất Tốt Cho Phổi, Cải Thiện Bệnh Hen Suyễn</strong><br /><br />
<p>Trong nhiều c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu, c&aacute; được chứng minh l&agrave; một loại thực phẩm gi&uacute;p bảo vệ phổi. Trong c&aacute; c&oacute; nhiều vitamin D. Khi thiếu hụt loại vitamin n&agrave;y sẽ l&agrave;m giảm chức năng phổi một c&aacute;ch trầm trọng. C&aacute; b&eacute;o v&agrave; dầu c&aacute; l&agrave; hai nguồn cung cấp dồi d&agrave;o loại vitamin n&agrave;y. V&igrave; vậy n&oacute; rất tốt cho những người c&oacute; tiền sử bị bệnh về phổi, đặc biệt l&agrave; hen suyễn.</p>
<div>Ngo&agrave;i ra, c&aacute; c&ograve;n gi&agrave;u axit b&eacute;o omega-3, rất tốt cho sức khỏe của to&agrave;n bộ cơ thể, trong đ&oacute; c&oacute; cả phổi<br /><br /><strong>4. Hải Sản Gi&uacute;p l&agrave;n Da S&aacute;ng V&agrave; Khỏe Mạnh</strong><br /><br />Dầu c&aacute; hoặc c&aacute; tươi rất gi&agrave;u omega 3 axit b&eacute;o v&agrave; protein. Protein tự nhi&ecirc;n gi&uacute;p l&agrave;m chậm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a ở phụ nữ. N&oacute; cũng th&uacute;c đẩy qu&aacute; tr&igrave;nh sản sinh ra collagen trong cơ thể. Như vậy axit b&eacute;o Omega 3 trong&nbsp;<strong>hải sản&nbsp;</strong>gi&uacute;p bạn duy tr&igrave; một l&agrave;n da tươi trẻ. Bổ sung thường xuy&ecirc;n c&aacute;c loại hải sản kh&aacute;c nhau v&agrave;o chế độ ăn uống của m&igrave;nh, bạn sẽ duy tr&igrave; được một l&agrave;n da s&aacute;ng v&agrave; khỏe mạnh<br /><br /><strong>5. Hải Sản Tốt Cho Tim Mạch</strong><br /><br />Lượng axit b&eacute;o omega 3 c&oacute; trong<strong>&nbsp;hải sản&nbsp;</strong>gi&uacute;p ngăn ngừa nguy cơ mắc bệnh tim mạch. l&agrave;m giảm h&agrave;m lượng chất b&eacute;o triglyceride trong m&aacute;u, giảm mức độ cholesterol xấu trong cơ thể. V&igrave; vậy, để đảm bảo sức khỏe tim mạch, bạn h&atilde;y ăn c&aacute;c loại hải sản &iacute;t nhất 2 lần/tuần<br /><br /><strong>6. Hải Sản Tốt Cho Bệnh Thiếu M&aacute;u</strong><br /><br />Hải sản rất gi&agrave;u sắt v&agrave; kẽm, đ&oacute; l&agrave; những dưỡng chất rất tốt để cải thiện c&aacute;c vấn đề xấu của bệnh thiếu m&aacute;u. Việc bạn thường xuy&ecirc;n ăn hải sản sẽ gi&uacute;p tăng mức độ hemoglobin của cơ thể. B&ecirc;n cạnh đ&oacute;, trong hải sản gi&agrave;u kẽm, cũng gi&uacute;p cho m&aacute;i t&oacute;c của bạn th&ecirc;m khỏe, đẹp<br /><br />
<p><strong>7. Hải Sản Gi&uacute;p Duy Tr&igrave; Độ Chắc Khỏe Cho Xương</strong><br /><br />Trong&nbsp;<strong>hải sản</strong>&nbsp;gi&agrave;u h&agrave;m lượng canxi, rất tốt việc đảm bảo sức khỏe của hệ xương. Trong thực tế, nếu bạn coi hải sản l&agrave; nguồn thực phẩm thường xuy&ecirc;n trong chế độ ăn uống của m&igrave;nh, n&oacute; sẽ gi&uacute;p cơ thể bạn giảm nhẹ c&aacute;c vấn đề li&ecirc;n quan đến đau khớp,&nbsp;<a href="http://afamily.vn/suc-khoe/dung-de-benh-khop-la-noi-lo-cua-ban-20100723052650400.chn">vi&ecirc;m khớp.</a></p>
<div>B&ecirc;n cạnh đ&oacute;, protein trong c&aacute; c&ograve;n c&oacute; t&aacute;c dụng gi&uacute;p bạn củng cố cơ bắp sau những giờ luyện tập thể thao<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/H%E1%BA%A3i%20s%E1%BA%A3n.jpg?1471409661893" alt="" width="600" /></div>
</div>', 0, CAST(N'2016-10-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_news] ([id], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [status]) VALUES (19, N'BÀO NGƯ XÀO NẤM ĐÔNG CÔ - NGỌT THƠM KHÓ CƯỠNG', N'Bào Ngư là loại hải sản quý hiếm, giàu dinh dưỡng, thịt giòn dai hấp dẫn. Bào Ngư có khả năng bổ âm, tăng khí, hạ nhiệt, tăng cường sinh lực cho nam giới, giúp sáng mắt, trị ho, khó tiêu', N'1936182_499482076843249_1667447404869295854_n.jpg', N'<span><strong>B&agrave;o Ngư</strong>&nbsp;l&agrave; loại hải sản qu&yacute; hiếm, gi&agrave;u dinh dưỡng, thịt gi&ograve;n dai hấp dẫn.&nbsp;<strong>B&agrave;o Ngư</strong>&nbsp;c&oacute; khả năng bổ &acirc;m, tăng kh&iacute;, hạ nhiệt, tăng cường sinh lực cho nam giới, gi&uacute;p s&aacute;ng mắt, trị ho, kh&oacute; ti&ecirc;u. Một trong c&aacute;c m&oacute;n ăn ngon từ B&agrave;o Ngư phải kể đến đ&oacute; l&agrave;&nbsp;<strong>B&agrave;o Ngư X&agrave;o Nấm Đ&ocirc;ng C&ocirc;</strong>. Vị ngọt thơm từ nấm đ&ocirc;ng c&ocirc; v&agrave; cải th&igrave;a h&ograve;a quyện c&ugrave;ng vị gi&ograve;n sật của&nbsp;<strong>B&agrave;o Ngư</strong>&nbsp;sẽ l&agrave;m bạn cứ muốn thưởng thức th&ecirc;m<br /><br /><br /><strong>NGUY&Ecirc;N LIỆU</strong><br /><br />-&nbsp;200 gram b&agrave;o ngư tươi<br />- 150g cải th&igrave;a</span><br /><span>- 10 nấm đ&ocirc;ng c&ocirc;</span><br /><span>- 1 củ h&agrave;nh t&iacute;m</span><br /><span>- 1 củ gừng vắt lấy nước cốt&nbsp;</span><br /><span>- Gia vị: dầu ăn, dầu m&egrave;, nước tương, đường, muối<br /><span><br /><strong>THỰC HIỆN</strong><br /><br />- Cải th&igrave;a rửa sạch, xẻ l&agrave;m hai, trụng qua nước s&ocirc;i, vớt ra cho v&agrave;o chậu nước lạnh để rau được xanh<br /></span><br /><span>- Nấm đ&ocirc;ng c&ocirc; ng&acirc;m nước cho mềm,&nbsp; cắt bỏ phần cuống<br /></span><br /><span>- B&agrave;o Ngư mua từ Hasasa.vn về, r&atilde; đ&ocirc;ng ở nhiệt độ thường khoảng 20 - 30 ph&uacute;t. Sau đ&oacute; d&ugrave;ng b&agrave;n chải đ&aacute;nh răng sạch ch&agrave; 2 m&eacute;p viền đen v&agrave; bề mặt của b&agrave;o ngư. Tiếp đến, c&aacute;c bạn d&ugrave;ng mũi dao nhọn nạy phần thịt b&agrave;o ngư l&ecirc;n, cắt bỏ phần nội tạng m&agrave;u đen ph&iacute;a b&ecirc;n dưới của n&oacute; v&agrave; ch&agrave; sạch lu&ocirc;n bề mặt b&agrave;o ngư, rửa sạch, để nguy&ecirc;n con hoặc th&aacute;i mỏng t&ugrave;y th&iacute;ch<br /></span><br /><span>- Phi thơm h&agrave;nh t&iacute;m, cho b&agrave;o ngư v&agrave;o x&agrave;o,&nbsp; n&ecirc;m dầu ăn, nước tương, đường, muối cho vừa miệng. Tr&uacute;t nấm đ&ocirc;ng c&ocirc; v&agrave;o x&agrave;o tiếp, khi nấm mềm th&igrave; cho cải th&igrave;a v&agrave;o đảo nhanh tay. Sau c&ugrave;ng cho dầu m&egrave;, nước cốt gừng, b&agrave;y ra đĩa tr&ograve;n, dọn d&ugrave;ng n&oacute;ng<br /><br /></span><strong>Hasasa.vn ch&uacute;c bạn thực hiện th&agrave;nh c&ocirc;ng m&oacute;n ăn n&agrave;y!<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/1936182_499482076843249_1667447404869295854_n.jpg?1471337830241" alt="" width="600" /></strong></span>
            </div>', 0, CAST(N'2016-10-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_news] ([id], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [status]) VALUES (22, N'CƠM CHIÊN CUA VÀ BẮP - ĐẬM ĐÀ NGON MIỆNG', N'Cơm Chiên là một món ngon dễ ăn, dễ chế biến nên rất phù hợp đưa vào thực đơn bữa cơm gia đình', N'Cơm chiên cua.jpg', N'<p>Cơm Chi&ecirc;n l&agrave; một m&oacute;n ngon dễ ăn, dễ chế biến n&ecirc;n rất ph&ugrave; hợp đưa v&agrave;o thực đơn bữa cơm gia đ&igrave;nh. Tận dụng cơm nguội bạn c&oacute; thể l&agrave;m ngay m&oacute;n <strong>CƠM&nbsp;CHI&Ecirc;N CUA V&Agrave; BẮP</strong>&nbsp;hấp dẫn, hạt cơm rang săn lại, kết hợp c&ugrave;ng vị ngọt đậm đ&agrave; từ thịt cua v&agrave; vị ngọt lịm từ ng&ocirc; ăn rất ghiền.<br /><br /><br /><strong>NGUY&Ecirc;N LIỆU</strong><br /><br /><span>- 1 con cua lớn</span><br /><span>- 1 quả ng&ocirc; nếp hay ng&ocirc; hạt v&agrave;ng, bạn c&oacute; thể th&ecirc;m đậu H&agrave; Lan t&ugrave;y theo sở th&iacute;ch của bạn</span><br /><span>- 1 l&ograve;ng đỏ trứng vịt muối</span><br /><span>- 1-2 quả trứng g&agrave;</span><br /><span>- 1 b&aacute;t cơm nguội lớn</span><br /><span>- Muối, hạt n&ecirc;m, h&agrave;nh kh&ocirc;, h&agrave;nh l&aacute;, hạt ti&ecirc;u, nước mắm v&agrave; dầu điều<br /><br /></span><strong>THỰC HIỆN</strong><br /><br /></p>
<p><span>- Cua rửa sạch dưới v&ograve;i nước lạnh, cho cua v&agrave;o nồi, đậy k&iacute;n nắp nồi, đun lửa nhỏ đến khi cua ch&iacute;n. Vớt cua ra để v&agrave;o đĩa để cua nguội, t&aacute;ch bỏ lấy thịt cua ra ri&ecirc;ng v&agrave; gạch cua để ra ri&ecirc;ng<br /></span><br /><span>- Đun n&oacute;ng dầu điều, phi h&agrave;nh kh&ocirc; thơm, đổ gạch cua v&agrave;o x&agrave;o sơ, th&ecirc;m thịt cua v&agrave;o đảo đều, n&ecirc;m v&agrave;o một th&igrave;a nhỏ nước mắm, một th&igrave;a nhỏ muối, một &iacute;t hạt ti&ecirc;u, đảo đều<br /></span><br /><span>- Tiếp theo cho ng&ocirc; v&agrave; l&ograve;ng đỏ trứng vịt muối v&agrave;o đảo c&ugrave;ng đến khi ăn thử hạt ng&ocirc; ch&iacute;n mềm<br /><br /></span>- Sau đ&oacute; cho cơm v&agrave;o d&ugrave;ng mu&ocirc;i lớn trộn đều để thịt cua, trứng vịt muối trộn đều với cơm<br /><br />- Đ&aacute;nh tan trứng g&agrave;, rưới từ từ v&agrave;o chảo cơm rang, đảo đều, n&ecirc;m th&ecirc;m gia vị cho vừa ăn<br /><br /><span>- Bạn n&ecirc;n rang lửa nhỏ để hạt cơm săn lại v&agrave; kh&ocirc;, n&ecirc;m nếm khẩu vị vừa ăn, tắt bếp th&ecirc;m h&agrave;nh l&aacute; th&aacute;i nhỏ v&agrave;o, m&uacute;c ra đĩa rắc một &iacute;t hạt ti&ecirc;u l&ecirc;n bề mặt.</span></p>
<p class="Normal"><br /><strong>Hasasa.vn ch&uacute;c bạn thực hiện th&agrave;nh c&ocirc;ng m&oacute;n ăn n&agrave;y!<br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/C%C6%A1m%20chi%C3%AAn%20cua.jpg?1471335970011" alt="" width="600" /><br /></strong></p>
<p class="Normal">&nbsp;</p>
<div>&nbsp;</div>
<br />
<table class="showborder" style="margin: 0px auto 10px; padding: 0px; max-width: 100%; min-width: 1px; font-family: arial;" cellspacing="0" cellpadding="3">
<tbody style="margin: 0px; padding: 0px;">
<tr style="margin: 0px; padding: 0px;">
<td style="margin: 0px; padding: 0px; vertical-align: middle;">
<p class="Folder" style="margin-bottom: 1em; padding-top: 0px; padding-bottom: 0px; font-stretch: normal; line-height: 18px; font-family: arial;">Bước 3:</p>
- Tiếp theo cho ng&ocirc; v&agrave; l&ograve;ng đỏ trứng vịt muối v&agrave;o đảo c&ugrave;ng đến khi ăn thử hạt ng&ocirc; ch&iacute;n mềm.</td>
</tr>
</tbody>
</table>
            </div>
        </div>
        ', 1, CAST(N'2016-10-20 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tbl_news] ([id], [TieuDe], [TomTat], [UrlHinh], [NoiDung], [LuotXem], [NgayCapNhat], [status]) VALUES (25, N'MỰC XÀO CÀ RI - GIÒN CAY THƠM NỨC MŨI', N'NULLMực Xào Cà Ri là một món ăn khá hấp dẫn, bạn có thể bổ sung vào thực đơn cơm trưa hoặc cơm chiều cho gia đình.', N'Mực_ống_xào_ca_ri.jpg', N' <p><strong>Mực X&agrave;o C&agrave; Ri</strong>&nbsp;l&agrave; một m&oacute;n ăn kh&aacute; hấp dẫn, bạn c&oacute; thể bổ sung v&agrave;o thực đơn cơm trưa hoặc cơm chiều cho gia đ&igrave;nh. M&oacute;n n&agrave;y sẽ l&agrave;m h&agrave;i l&ograve;ng bạn bởi mực x&agrave;o gi&ograve;n m&agrave; kh&ocirc;ng bị dai, quyện với m&ugrave;i sả v&agrave; c&agrave; ri thơm nức, d&ugrave;ng l&agrave;m m&oacute;n nh&acirc;m nhi cuối ng&agrave;y hoặc ăn c&ugrave;ng cơm thật ngon miệng.<br /><br /></p>
<p><br /><strong>NGUY&Ecirc;N LIỆU</strong><br /><br /><span>- 5 con mực ống</span><br /><span>- 2 th&igrave;a canh c&agrave; ri dầu Ấn Độ</span><br /><span>- 2 t&eacute;p sả bằm</span><br /><span>- 1 củ h&agrave;nh t&iacute;m</span><br /><span>- 3 t&eacute;p tỏi</span><br /><span>- 3 quả ớt (t&ugrave;y bạn ăn cay hay kh&ocirc;ng)</span><br /><span>- Hạt n&ecirc;m, nước mắm, đường, dầu ăn.<br /><br /></span><strong>THỰC HIỆN</strong><br /><br /></p>
<p class="Normal">- Mực l&agrave;m sạch lột bỏ da, khứa vảy rồng cắt miếng vừa ăn hoặc cắt khoanh tr&ograve;n tuỳ th&iacute;ch.</p>
<p class="Normal">- Ướp mực với 2 th&igrave;a canh c&agrave; ri, h&agrave;nh t&iacute;m băm nhỏ c&ugrave;ng với ch&uacute;t hạt n&ecirc;m v&agrave; đường, để khoảng 15 ph&uacute;t cho mực thấm gia vị.</p>
<p class="Normal">- L&agrave;m n&oacute;ng chảo với 2 th&igrave;a canh dầu ăn, cho tỏi băm nhỏ v&agrave;o phi thơm. Cho tiếp sả v&agrave; ớt băm v&agrave;o đảo c&ugrave;ng. Khi thấy sả đ&atilde; v&agrave;ng v&agrave; dậy m&ugrave;i th&igrave; cho mực đ&atilde; ướp v&agrave;o x&agrave;o chung v&agrave; đảo li&ecirc;n tục cho đến khi mực ch&iacute;n. N&ecirc;m lại mực với &iacute;t nước mắm cho vừa miệng. M&uacute;c ra đĩa d&ugrave;ng n&oacute;ng.<br /><br /><strong>Hasasa.vn ch&uacute;c bạn thực hiện th&agrave;nh c&ocirc;ng m&oacute;n ăn n&agrave;y!</strong><br /><br /><br /><br /><img style="display: block; margin-left: auto; margin-right: auto;" src="http://hasasa.vn/images/companies/2/Ngao/M%E1%BB%B1c%20%E1%BB%91ng%20x%C3%A0o%20ca%20ri.jpg?1471245585782" alt="" width="600" /></p>
<p class="Normal">&nbsp;</p>', 0, CAST(N'2016-10-20 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_news] OFF
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (1, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(652500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 24, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 13)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (2, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(750000 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 31, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (3, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(690000 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 18, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 8)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (4, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(652500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 7, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 2, CAST(750000 AS Decimal(18, 0)), 13)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (5, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(750000 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 1, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 2, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (6, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(675000 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 0, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 2, CAST(750000 AS Decimal(18, 0)), 10)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (7, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(712500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 10, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 2, CAST(750000 AS Decimal(18, 0)), 5)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (8, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(750000 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 2, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (9, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(652500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 0, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 13)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (10, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (11, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (12, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 4, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (13, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (14, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (15, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (16, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(652500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 0, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 13)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (17, N'Tôm Mũ Ni Sống (size 5 - 6 con)', N'images/^308B24528787CA23E0B18E5B52CA2421A54944158785DA02F3^pimgpsh_fullsize_distr(1).jpg', CAST(652500 AS Decimal(18, 0)), N'	<ul>
<li>Size 3 - 4 con/kg : 690,000 vnđ/kg</li>
<li>Size 5 - 6 con/kg : 650,000 vnđ/kg</li>
<li>Xuất xứ: Cam Ranh - Khánh Hòa, Phan Thiết</li>
<li>Thịt tôm ngon, ngọt dai như thịt tôm hùm,&nbsp;gạch cực thơm và béo</li>
<li>Hàng sống giao tận tay Khách</li>
<li>Hàng về tùy thời điểm, liên hệ HOTLINE&nbsp;để biết thông tin chi tiết</li>
</ul>', N'<div>Tôm Mũ Ni hay còn gọi là Tôm Vỗ. Hình dạng khá ngộ nghĩnh, trông giống như cái "mũ che tai". Chúng sống ở vùng nước ấm, nơi có nhiều san hô<br><br>Là đặc sản khá nổi tiếng của vùng biển Nha Trang, Phan Thiết, Vũng Tàu. Thịt tôm trắng tinh, mềm, ngọt, thơm, rất bổ dưỡng, dù có ăn nhiều bạn cũng không cảm thấy bị ngấy. Do vậy, tôm mũ ni được đánh giá là đẳng cấp hải vị trên bàn tiệc, được các đầu bếp danh tiếng trổ tài để thể hiện tài năng<br><br><span>Không chỉ ngon Tôm Mũ Ni còn rất giàu dinh dưỡng. Mỗi 100 gram thịt tôm mũ ni có 95 calories, 121mg cholesterol, 185g sodium, 0,8g tổng chất béo (36% chất béo bão hòa), 39mg omega-3, 49mg EPA, 45mg omega-6, AA. Do đó Tôm Mũ Ni có tác dụng tăng cường hoạt động của tế bào miễn dịch, phòng chống tế bào ung thư và bảo vệ gan hiệu quả<br><br></span>Tôm Mũ Ni được chế biến thành nhiều món ăn ngon và hấp dẫn như :&nbsp;<span>hấp tuyết nhỉ, hấp bia, hấp nước dừa, nướng sả ớt, nướng mọi, nướng bơ tỏi, nướng phô mai......<br></span><br><br><strong>MỘT SỐ HÌNH ẢNH VỀ TÔM MŨ NI<br></strong><br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh1.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Hấp Bia<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh2.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Phô Mai<br></strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh3.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Phô Mai</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13266121_503227119880579_4198280592556394225_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Rang Me</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/13165861_1810565965847137_6977335565569175486_n.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Cháy Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh4.jpg" alt="" width="600"></div>
<div style="text-align: center;"><strong><br>Tôm Mũ Ni Nướng Bơ Tỏi</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Đúc Lò</strong></div>
<br>
<div><img style="display: block; margin-left: auto; margin-right: auto;" src="/images/hinh5.jpg" alt="" width="600"></div>
<br>
<div style="text-align: center;"><strong>Tôm Mũ Ni Nướng Mọi</strong></div></div>', 10, 0, 2, CAST(N'1894-06-26 00:00:00.000' AS DateTime), 1, 1, CAST(750000 AS Decimal(18, 0)), 13)
INSERT [dbo].[tbl_Product] ([ID], [TenSP], [UrlHinh], [GiaHienTai], [MoTa], [MoTaCT], [SoLuongTon], [SLDaBan], [LuotXem], [NgayCapNhat], [Status], [IDLoaiSP], [GiaCu], [KhuyenMai]) VALUES (18, N'Cua Huỳnh Đế (Hoàng Đế)', N'images/1484176_993872464039739_7061766636485875711_n(1).jpg', CAST(750000 AS Decimal(18, 0)), N'<div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div>
<ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul>
<ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul>', N'<div><div>CUA HUỲNH ĐẾ SỐNG<br>-&nbsp;Size 400 gram trở lên : 700,000 vnđ/kg<br>-&nbsp;Size 3 - 4&nbsp;con/kg&nbsp;: 640,000 vnđ/kg<br>CUA HUỲNH ĐẾ TƯƠI<br>- Size 400 gram trở lên : 650,000 vnđ/kg<br>- Size 3 - 4 con/kg : 590,000 vnđ/kg</div><ul> <li>Xuất xứ: Quy Nhơn (Bình Định), Phú Yên, Tuy Phong (Bình Thuận), Cam Ranh (Khánh Hòa)</li><li>Sống ở vùng nước sâu nơi có cát vàng cách mặt nước biển 20m-  40m khó đánh bắt và trữ sống.</li></ul><ul><li>Được đánh giá là Vua của các loài cua và dùng để ngự dâng cho các vua chúa ngày xưa</li><li>Thịt cua chắc, gạch thơm và béo ngậy hơn hẳn các loại cua ghẹ khác</li><li>Độ đạm cao, giàu chất dinh dưỡng, giúp tăng sinh lực ở nam giới</li></ul></div>', 10, 0, 0, CAST(N'1905-06-23 00:00:00.000' AS DateTime), 1, 3, CAST(750000 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
SET IDENTITY_INSERT [dbo].[tbl_product_types] ON 

INSERT [dbo].[tbl_product_types] ([ID], [TenLoaiSP], [Status]) VALUES (1, N'Tươi sống', 1)
INSERT [dbo].[tbl_product_types] ([ID], [TenLoaiSP], [Status]) VALUES (2, N'Khô', 1)
INSERT [dbo].[tbl_product_types] ([ID], [TenLoaiSP], [Status]) VALUES (3, N'Đông lạnh', 1)
SET IDENTITY_INSERT [dbo].[tbl_product_types] OFF
USE [master]
GO
ALTER DATABASE [database] SET  READ_WRITE 
GO
