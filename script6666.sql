USE [master]
GO
/****** Object:  Database [ShopManagement3]    Script Date: 25/7/2022 8:27:41 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](150) NOT NULL,
	[address] [varchar](150) NULL,
	[phone] [varchar](150) NOT NULL,
	[img] [nvarchar](150) NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[deleveryId] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[shippid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25/7/2022 8:27:41 AM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 25/7/2022 8:27:41 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 25/7/2022 8:27:41 AM ******/
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
	[categoryID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Invoice]    Script Date: 25/7/2022 8:27:41 AM ******/
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
/****** Object:  Table [dbo].[Salary]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[employeeID] [int] NOT NULL,
	[state] [bit] NOT NULL,
	[salarytoday] [money] NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[Totalworking] [int] NOT NULL,
	[salaryTotal] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryDetail]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryDetail](
	[employeeID] [int] NOT NULL,
	[day] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 25/7/2022 8:27:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Address] [nvarchar](70) NOT NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25/7/2022 8:27:41 AM ******/
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
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'lunguyen', N'123456As', 1)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'longdt', N'123456Tr', 0)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'cus1', N'123456Aa', 3)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'lunguyen22', N'123456As', 3)
INSERT [dbo].[Account] ([username], [password], [role]) VALUES (N'cus16665', N'123456As', 3)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'GongCha')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'HighLand')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Starbucks')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (4, N'TocoToCo')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactID], [Name], [Email], [Phone], [Message], [status]) VALUES (1, N'lunguyen2', N'admin@gmail.com', N'0974280518', N'ok', 0)
INSERT [dbo].[ContactUs] ([ContactID], [Name], [Email], [Phone], [Message], [status]) VALUES (2, N'lunguyen2', N'lunguyen2k18@gmail.com', N'974280518', N'ok', 1)
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (2, N'Nguyen Van AN', N'71 Tran Hung Dao, Q5, TpHCM', N'0374746755', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'cus1', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (3, N'Nguyen Van Vinh', N'731 Tran Hung Dao, Q9, TpHCM', N'0374143784', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user12', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (4, N'Bui Tien Cuong', N'Ha Phuong, Thang Thuy, Vinh Bao, Hai Phong', N'0382011918', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user11', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (5, N'Nguyen Minh Quang', N'Hoan Kiem, Ha Noi', N'0374745875', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user123', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (6, N'Tran Ngoc Han', N'My Dinh, Ha Noi', N'0372547755', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user111', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (7, N'Duong Van Minh', N'41 Tran Hung Dao, Q5, TpHCM', N'0358964755', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user121', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (8, N'Dao Thanh Long', N'731 Tran Hung Dao, Q5, TpHCM', N'0374746754', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user112', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (9, N'Nguyen Duc Chuong', N'Nam Dinh', N'0374746755', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user1212', N'lunguyen2k18@gmail.com')
INSERT [dbo].[Customer] ([customerID], [customerName], [address], [phone], [img], [username], [email]) VALUES (10, N'Cao Van Lam', N'227 Nguyen Van Cu, Q5, TpHCM', N'0374787492', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqGsPuHzwLsvY8D2EByvtTD5Tjsf6I6YpdPA&usqp=CAU', N'user1211', N'lunguyen2k18@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([deleveryId], [invoiceId], [name], [phone], [address], [shippid], [status]) VALUES (1, 103, N'Nguyen Van AN', N'0988888888', N'ok', 1, N'Not Shipped')
INSERT [dbo].[Delivery] ([deleveryId], [invoiceId], [name], [phone], [address], [shippid], [status]) VALUES (2, 104, N'Nguyen Van AN', N'0988888888', N'Ha Noi', 4, N'Shipped')
INSERT [dbo].[Delivery] ([deleveryId], [invoiceId], [name], [phone], [address], [shippid], [status]) VALUES (3, 105, N'Nguyen Van AN', N'0988888888', N'ok', 4, N'Shipped')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (1, N'long', 1, N'123456777', CAST(N'2000-03-03' AS Date), N'https://image-us.24h.com.vn/upload/1-2022/images/2022-03-13/anh-1-1647162766-197-width650height741.jpg', N'longdt', N'cuongbuitien2000@gmail.com')
INSERT [dbo].[Employees] ([employeeID], [employeeName], [gender], [phone], [dob], [img], [username], [email]) VALUES (2, N'lunguyen2', 1, N'546565986', CAST(N'2000-05-31' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsQ3JwG6r9KonRuRXLwCtTn23R2m8KDYKgbQ&usqp=CAU', N'lunguyen', N'lunguyen2k18@gmail.com')
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
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (54, CAST(N'2022-06-27' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (55, CAST(N'2022-06-27' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (56, CAST(N'2022-06-28' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (57, CAST(N'2022-06-28' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (58, CAST(N'2022-06-28' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (59, CAST(N'2022-06-28' AS Date), 1, 4)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (60, CAST(N'2022-06-28' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (61, CAST(N'2022-06-30' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (62, CAST(N'2022-06-30' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (63, CAST(N'2022-06-30' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (64, CAST(N'2022-06-30' AS Date), 1, 1)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (65, CAST(N'2022-06-30' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (66, CAST(N'2022-06-30' AS Date), 1, 0)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (67, CAST(N'2022-06-30' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (68, CAST(N'2022-06-30' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (79, CAST(N'2022-07-12' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (80, CAST(N'2022-07-14' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (81, CAST(N'2022-07-14' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (82, CAST(N'2022-07-14' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (83, CAST(N'2022-07-19' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (84, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (85, CAST(N'2022-07-19' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (86, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (87, CAST(N'2022-07-19' AS Date), 1, 3)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (88, CAST(N'2022-07-19' AS Date), 1, 9)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (89, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (90, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (91, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (92, CAST(N'2022-07-19' AS Date), 1, 9)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (93, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (94, CAST(N'2022-07-19' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (95, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (96, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (97, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (98, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (99, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (100, CAST(N'2022-07-19' AS Date), 1, 5)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (101, CAST(N'2022-07-20' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (102, CAST(N'2022-07-20' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (103, CAST(N'2022-07-21' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (104, CAST(N'2022-07-24' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (105, CAST(N'2022-07-24' AS Date), 1, 2)
INSERT [dbo].[Invoice] ([invoiceID], [createdDate], [employeeID], [customerID]) VALUES (106, CAST(N'2022-07-25' AS Date), 1, 5)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (1, N'Peach Berry Green Tea', 4994, 15000, 25000, N'http://gongcha.com.vn/wp-content/uploads/2022/02/Strawberry-Chocolate-Milk-Tea.png', N' Nh? g?n d? dÃ¹ng.', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (2, N'Strawberry Smoothie', 484, 25000, 37000, N'http://gongcha.com.vn/wp-content/uploads/2022/01/strawberry-cookie-smoothie.png', N'20 chi?c 1 h?p.', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (3, N'Cream Top Matcha', 481, 45000, 55000, N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Matcha-%C4%91%E1%BA%ADu-%C4%91%E1%BB%8F-2.png', N'gi?y láng m?n, vi?t êm tay', 2)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (4, N'Oreo Milk Tea', 293, 35000, 50000, N'https://gongcha.com.vn/wp-content/uploads/2019/11/Okinawa-Milk-Foam-Smoothie.png', N'Lo?i ph?n tr?ng không b?i, ch?t lu?ng uy tín d?m b?o ', 2)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (5, N'Papaya Green Milk Tea', 97, 25000, 30000, N'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/5-CY4ZCXJJVU31AA-CY4ZCXJXRXDKLA/detail/b91db28ab9a64bb588a65c3382b79afd_1575615114785692815.webp', N'S? d?ng các lo?i gi?y c?ng, dày, ch?c ch?n d? làm bìa s?.', 3)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (10, N'Strawberry Cheese Smoothie', 18, 30000, 40000, N'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2021092715022176975/detail/menueditor_item_a2a530a6a6f740b190e37e2f405d4c3e_1632754896665706103.webp', N'ngon', 3)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (11, N'Tiramisu Smoothie', 198, 32000, 42000, N'https://d1sag4ddilekf6.azureedge.net/compressed/items/VNITE20220403063436018891/photo/befc3fdda1924321a8720dda36bb856c_1648967676103594798.jpg', N'ngon', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (12, N'Mango Smoothie', 199, 33000, 45000, N'https://gongcha.com.vn/wp-content/uploads/2018/02/Xo%C3%A0i-%C4%91%C3%A1-xay-2.png', N'ngon', 4)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (13, N'Aloe Grass Jelly Honey Juice', 401, 40000, 50000, N'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE20200103070423038725/detail/74e541675052405fb04b2770c802b1fa_1589536312082503940.webp', N'ngon', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (14, N'Hokkaido Milk Tea', 232, 65000, 70000, N'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE2020061710291786127/detail/menueditor_item_76c6557960e3450b990582cfa533975f_1642340221529104032.webp', N'ngon', 4)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (15, N'Panna Cotta Milk Tea', 324, 32000, 55000, N'http://www.richs.com.vn/images/cong-thuc/Th%E1%BB%A9c%20u%E1%BB%91ng/Panna%20Cotta%20Milk%20Tea/panna_cotta_milktea_3.jpg', N'ngon', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (16, N'Carramei Milk Tea', 38, 60000, 68000, N'https://www.kindpng.com/picc/m/53-533312_brown-sugar-ginger-milk-tea-brown-sugar-milk.png', N'ngon', 4)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (17, N'S.P.A Smoothie', 12, 45000, 50000, N'http://gongcha.com.vn/wp-content/uploads/2022/03/CHOCOLATE-TOFFEE-1.png', N'ngon', 1)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (18, N'Pineberry Green Tea', 43, 48000, 66000, N'http://gongcha.com.vn/wp-content/uploads/2022/01/Strawberry-milk-tea.png', N'2', 3)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (19, N'Fresh Milk Ice Blend', 131, 36000, 56000, N'https://d1sag4ddilekf6.azureedge.net/compressed_webp/items/VNITE20220623191549037903/detail/e7e224a2_edfab5bbdd5c.webp', N'2', 2)
INSERT [dbo].[Product] ([productID], [productName], [productQuantity], [cost], [price], [img], [description], [categoryID]) VALUES (22, N'
Strawberry Choco Smoothie', 554, 37000, 65000, N'http://gongcha.com.vn/wp-content/uploads/2022/02/Strawberry-Chocolate-Smoothie.png', N'NGON', 1)
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
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 54, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 54, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 54, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 54, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 54, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 55, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 55, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 55, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 56, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 56, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 56, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 57, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 58, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 58, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 60, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 60, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 61, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 61, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 61, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 61, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 62, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 62, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 64, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (11, 67, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (3, 68, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 68, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 1, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 1, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 1, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 1, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 80, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (3, 82, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 86, 1, 4.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 86, 2, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 92, 6, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 97, 3, 3.1000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 97, 2, 3.2000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 99, 3, 3.1000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 99, 6, 3.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 101, 2, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 102, 1, 4.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 102, 2, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 103, 1, 4.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 103, 2, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 104, 1, 4.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 104, 2, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 104, 6, 5.0500)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 106, 12, 33000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 106, 10, 30000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 106, 22, 37000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 59, 4, 6000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (2, 59, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (5, 59, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 105, 21, 2000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (3, 63, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 63, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 65, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (4, 66, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 66, 5, 12000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 100, 10, 3.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 100, 11, 3.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 100, 19, 2.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 78, 2, 3500.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 78, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 79, 1, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 79, 6, 9000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 79, 3, 5000.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 98, 11, 3.0000)
INSERT [dbo].[Product_Invoice] ([quantity], [invoiceID], [productID], [price]) VALUES (1, 98, 4, 3.0000)
GO
INSERT [dbo].[Salary] ([employeeID], [state], [salarytoday], [from], [to], [Totalworking], [salaryTotal]) VALUES (1, 0, 20.8400, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-31' AS Date), 7, 145.8800)
INSERT [dbo].[Salary] ([employeeID], [state], [salarytoday], [from], [to], [Totalworking], [salaryTotal]) VALUES (2, 1, 10.0000, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-31' AS Date), 9, 90.0000)
INSERT [dbo].[Salary] ([employeeID], [state], [salarytoday], [from], [to], [Totalworking], [salaryTotal]) VALUES (3, 0, 5.0000, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-31' AS Date), 6, 30.0000)
INSERT [dbo].[Salary] ([employeeID], [state], [salarytoday], [from], [to], [Totalworking], [salaryTotal]) VALUES (4, 0, 7.0000, CAST(N'2022-07-01' AS Date), CAST(N'2022-07-31' AS Date), 4, 28.0000)
GO
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-02' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-02' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-03' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-04' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-01' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-02' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-05' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-09' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (4, CAST(N'2022-07-09' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-10' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-10' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (4, CAST(N'2022-07-10' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-12' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-12' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (4, CAST(N'2022-07-12' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (1, CAST(N'2022-07-14' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-14' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-14' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (2, CAST(N'2022-07-19' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-19' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-10' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (3, CAST(N'2022-07-12' AS Date))
INSERT [dbo].[SalaryDetail] ([employeeID], [day]) VALUES (4, CAST(N'2022-07-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Shippers] ON 

INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Address], [Phone]) VALUES (1, N'GiaoHangTietKiem', N'267 Quan Hoa Ward, Quan Hoa, Cau Giay District, Hanoi', N'1900 6092')
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Address], [Phone]) VALUES (4, N'Viettel Post2', N' Thang Long Boulevard, Me Tri Ward, Nam Tu Liem District, City. Hanoi.', N'19008095')
SET IDENTITY_INSERT [dbo].[Shippers] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierID], [supplierName], [address], [phone], [img]) VALUES (1, N'Thiên Long', N'Hai Bà Trung - Hà N?i', N'0354874568', N'https://upload.wikimedia.org/wikipedia/vi/3/3b/Logo_thienlong.png')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [address], [phone], [img]) VALUES (2, N'Parker', N'Ha Noi', N'0354874538', N'https://agiare.vn/wp-content/uploads/2020/01/but-bi-parker.jpg')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
USE [master]
GO
ALTER DATABASE [ShopManagement3] SET  READ_WRITE 
GO
