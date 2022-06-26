USE [master]
GO
/****** Object:  Database [ShopManagement3]    Script Date: 26/6/2022 10:09:23 PM ******/
CREATE DATABASE [ShopManagement3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopManagement3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopManagement3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopManagement3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopManagement3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopManagement3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopManagement3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopManagement3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopManagement3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopManagement3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopManagement3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopManagement3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopManagement3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopManagement3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopManagement3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopManagement3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopManagement3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopManagement3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopManagement3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopManagement3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopManagement3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopManagement3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopManagement3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopManagement3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopManagement3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopManagement3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopManagement3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopManagement3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopManagement3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopManagement3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopManagement3] SET  MULTI_USER 
GO
ALTER DATABASE [ShopManagement3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopManagement3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopManagement3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopManagement3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopManagement3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopManagement3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopManagement3] SET QUERY_STORE = OFF
GO
USE [ShopManagement3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](150) NOT NULL,
	[address] [varchar](150) NULL,
	[phone] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[employeeName] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](150) NOT NULL,
	[dob] [date] NOT NULL,
	[img] [varchar](350) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [nvarchar](250) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[createdDate] [date] NOT NULL,
	[employeeID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](150) NOT NULL,
	[productQuantity] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[price] [float] NOT NULL,
	[img] [varchar](350) NOT NULL,
	[description] [varchar](150) NULL,
	[supplierID] [int] NOT NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Invoice]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Invoice](
	[quantity] [int] NOT NULL,
	[invoiceID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 26/6/2022 10:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [varchar](150) NOT NULL,
	[address] [varchar](150) NOT NULL,
	[phone] [varchar](150) NOT NULL,
	[img] [varchar](350) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'admin', N'1', 1)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'anhquan', N'1', 1)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'cuongbt', N'1', 1)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'longdt', N'123456Tr', 0)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'lunguyen', N'12345Asa', 1)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'vinhtrinh', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'pen')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Pencil case')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'case')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (2, N'Nguyen Van AN', N'71 Tran Hung Dao, Q5, TpHCM', N'0374746755')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (3, N'Nguyen Van Vinh', N'731 Tran Hung Dao, Q9, TpHCM', N'0374143784')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (4, N'Bui Tien Cuong', N'Ha Phuong, Thang Thuy, Vinh Bao, Hai Phong', N'0382011918')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (5, N'Nguyen Minh Quang', N'Hoan Kiem, Ha Noi', N'0374745875')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (6, N'Tran Ngoc Han', N'My Dinh, Ha Noi', N'0372547755')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (7, N'Duong Van Minh', N'41 Tran Hung Dao, Q5, TpHCM', N'0358964755')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (8, N'Dao Thanh Long', N'731 Tran Hung Dao, Q5, TpHCM', N'0374746754')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (9, N'Nguyen Duc Chuong', N'Nam Dinh', N'0374746755')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone]) VALUES (10, N'Cao Van Lam', N'227 Nguyen Van Cu, Q5, TpHCM', N'0374787492')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (1, N'long', 1, N'123456777', CAST(N'2000-03-22' AS Date), N'asdas', N'longdt', N'cuongbuitien2000@gmail.com')
INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (2, N'lunguyen', 1, N'546565986', CAST(N'2000-05-31' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsQ3JwG6r9KonRuRXLwCtTn23R2m8KDYKgbQ&usqp=CAU', N'lunguyen', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (3, N'Bui Tien Cuong', 1, N'8541255488', CAST(N'2000-10-01' AS Date), N'https://1.bp.blogspot.com/-5n_rEz8D0b8/Xk556_wb4KI/AAAAAAAAVVM/Z-v6YSPT3swBVpUWfd7NOForHs-OYRHGACLcBGAsYHQ/s1600/Anh-Trai-Dep-20023456-Wap102%2B%25281%2529.jpg', N'cuongbt', N'cuongbuitien2000@gmail.com')
INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (4, N'Tran Anh Quan', 1, N'8955124242', CAST(N'2000-12-02' AS Date), N'https://phunugioi.com/wp-content/uploads/2020/11/hinh-anh-trai-dep-soai-ca.jpg', N'anhquan', N'anhquan@gmail.com')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (36, CAST(N'2022-06-22' AS Date), 3, 1)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (37, CAST(N'2022-05-05' AS Date), 3, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (38, CAST(N'2022-06-20' AS Date), 1, 4)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (50, CAST(N'2022-06-26' AS Date), 5, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (51, CAST(N'2022-06-26' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (52, CAST(N'2022-06-26' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (53, CAST(N'2022-06-26' AS Date), 1, 5)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (1, N'But chi go Thien Long ', 5001, 3000, 5000, N'http://img.websosanh.vn/v2/users/root_product/images/but-chi-go-2b-thien-long-gp02/2jgr174h4dbhl.jpg', N' Nh? g?n d? dÃ¹ng.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (2, N'Bút bi Thiên Long ', 500, 1000, 3500, N'https://cf.shopee.vn/file/7512b7bdefdf95f914c3fb93d26a36d1', N'20 chi?c 1 h?p.', 1, 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (3, N'Vo viet', 500, 2500, 5000, N'https://dodungvanphong.com.vn/image/Tap-100tr-Thuan-Tien-1.jpg', N'gi?y láng m?n, vi?t êm tay', 1, 2)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (4, N'Phan Viet Bang', 300, 2000, 6000, N'https://thinhdaiphat.com/wp-content/uploads/2017/04/phan-viet-bang-mic-trang-10-vien.jpg', N'Lo?i ph?n tr?ng không b?i, ch?t lu?ng uy tín d?m b?o ', 1, 2)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (5, N'So Tay', 100, 7000, 12000, N'http://kalapress.vn/upload/hinhanh/so-tay-bia-giay-cung.jpg', N'S? d?ng các lo?i gi?y c?ng, dày, ch?c ch?n d? làm bìa s?.', 1, 3)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [supplierID], [categoryID]) VALUES (6, N'Bút lông ', 100, 4000, 9000, N'https://product.hstatic.net/1000230347/product/but_long_dau_thien_long_pm-09__1_.jpg', N'Vi?t giúp d? m?i tay', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (10, 36, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (5, 36, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (4, 37, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (6, 37, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (8, 37, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (8, 38, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (9, 38, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 4, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (15, 4, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (14, 5, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (5, 5, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (6, 5, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (8, 5, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (9, 6, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (10, 7, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 35, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 50, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 51, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 52, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 53, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 53, 5, 12000.0000)
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierID], [supplierName], [address], [phone], [img]) VALUES (1, N'Thiên Long', N'Hai Bà Trung - Hà N?i', N'0354874568', N'https://upload.wikimedia.org/wikipedia/vi/3/3b/Logo_thienlong.png')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [address], [phone], [img]) VALUES (2, N'Parker', N'Ha Noi', N'0354874538', N'https://agiare.vn/wp-content/uploads/2020/01/but-bi-parker.jpg')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
USE [master]
GO
ALTER DATABASE [ShopManagement3] SET  READ_WRITE 
GO
