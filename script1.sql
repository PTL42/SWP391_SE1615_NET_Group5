USE [master]
GO
/****** Object:  Database [ShopManagement]    Script Date: 5/27/2022 10:38:00 PM ******/
CREATE DATABASE [ShopManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ShopManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopManagement', N'ON'
GO
ALTER DATABASE [ShopManagement] SET QUERY_STORE = OFF
GO
USE [ShopManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](10) NOT NULL,
	[password] [nvarchar](10) NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [username_pk] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerid] [nvarchar](10) NOT NULL,
	[customername] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NULL,
	[phonenumber] [nchar](12) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeid] [nvarchar](10) NOT NULL,
	[ename] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phonenumber] [nvarchar](12) NOT NULL,
	[dob] [date] NOT NULL,
	[username] [nvarchar](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employeeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [nvarchar](10) NOT NULL,
	[customerid] [nvarchar](10) NOT NULL,
	[createdDate] [date] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[invoiceid] [int] NOT NULL,
	[productid] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[sum] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/27/2022 10:38:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productid] [nvarchar](50) NOT NULL,
	[productname] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Account]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([customerid])
REFERENCES [dbo].[Customer] ([customerid])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Employee] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Employee] ([employeeid])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Employee]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([invoiceid])
REFERENCES [dbo].[Invoice] ([invoiceid])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productid])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Product]
GO
USE [master]
GO
ALTER DATABASE [ShopManagement] SET  READ_WRITE 
GO
