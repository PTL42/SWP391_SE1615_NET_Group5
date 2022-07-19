USE [ShoppingOnline]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[type_category] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[Discounts] [float] NULL,
	[Status] [bit] NULL,
	[DateExpired] [datetime] NULL,
	[DateUnexpired] [datetime] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[total_price] [float] NULL,
	[order_date] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[unit_price] [float] NULL,
	[status] [bit] NULL,
	[full_name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[type_shipping] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[sale_price] [float] NULL,
	[import_price] [float] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
	[import_date] [datetime] NULL,
	[category_id] [int] NULL,
	[DiscountId] [int] NULL,
	[product_image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProductSize]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductSize](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[size_product] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_tblProductSize] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/15/2022 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[status] [bit] NULL,
	[full_name] [nvarchar](50) NULL,
	[phone] [nvarchar](15) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([category_id], [type_category]) VALUES (1, N'DIOR')
INSERT [dbo].[tblCategory] ([category_id], [type_category]) VALUES (2, N'NIKE')
INSERT [dbo].[tblCategory] ([category_id], [type_category]) VALUES (3, N'ADIDAS')
INSERT [dbo].[tblCategory] ([category_id], [type_category]) VALUES (4, N'CROCS')
INSERT [dbo].[tblCategory] ([category_id], [type_category]) VALUES (5, N'DINCOX')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblDiscount] ON 

INSERT [dbo].[tblDiscount] ([DiscountId], [Discounts], [Status], [DateExpired], [DateUnexpired]) VALUES (1, 25, 1, CAST(N'2022-10-06 00:00:00.000' AS DateTime), CAST(N'2022-06-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblDiscount] ([DiscountId], [Discounts], [Status], [DateExpired], [DateUnexpired]) VALUES (2, 35, 0, CAST(N'2022-06-06 00:00:00.000' AS DateTime), CAST(N'2022-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblDiscount] ([DiscountId], [Discounts], [Status], [DateExpired], [DateUnexpired]) VALUES (3, 50, 1, CAST(N'2022-07-15 00:00:00.000' AS DateTime), CAST(N'2022-05-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblDiscount] ([DiscountId], [Discounts], [Status], [DateExpired], [DateUnexpired]) VALUES (4, 45, 1, CAST(N'2022-07-30 00:00:00.000' AS DateTime), CAST(N'2022-05-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDiscount] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (1, 2, 192000, CAST(N'2022-06-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (2, 2, 324000, CAST(N'2022-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (3, 2, 569100, CAST(N'2022-06-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (4, 2, 420000, CAST(N'2022-06-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (5, 2, 351000, CAST(N'2022-06-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (6, 2, 820000, CAST(N'2022-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (7, 2, 300000, CAST(N'2022-06-25 12:04:40.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (8, 2, 396000, CAST(N'2022-06-25 12:20:47.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (9, 2, 1455000, CAST(N'2022-07-12 09:47:20.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (10, 2, 261000, CAST(N'2022-07-15 07:35:01.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (11, 2, 261000, CAST(N'2022-07-15 07:44:06.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (12, 2, 21000, CAST(N'2022-07-15 07:52:37.000' AS DateTime))
INSERT [dbo].[tblOrder] ([order_id], [user_id], [total_price], [order_date]) VALUES (13, 2, 250000, CAST(N'2022-07-15 08:33:55.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (1, 1, 1, 2, 364000, 1, N'Lê Văn Linh', NULL, N'85 Phan Văn Trị', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (2, 1, 2, 3, 576000, 1, N'Lê Văn Linh', N'0753920558', N'123 Phạm Văn Đồng', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (3, 2, 2, 1, 324000, 1, N'Lê Văn Linh', N'0178225854', N'85 Phan Văn Trị', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (4, 2, 3, 2, 648000, 1, N'Lê Văn Phát', N'0246885225', N'45/2 Lê Văn Sỹ', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (5, 3, 4, 1, 569100, 1, N'Lê Văn Cương', N'0147522442', N'123 Phạm Văn Đồng', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (6, 4, 5, 1, 420000, 1, N'Lê Văn Phong', N'0852367522', N'96 Dương Đình Hội', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (7, 5, 7, 1, 351000, 1, N'Lê Văn Phát', N'0753920558', N'85 Phan Văn Trị', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (8, 6, 8, 1, 820000, 1, N'Lê Văn Trung', N'0475247851', N'45/2 Lê Văn Sỹ', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (9, 6, 4, 2, 1640000, 1, N'Lê Văn Linh', N'0125475898', N'123 Phạm Văn Đồng', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (10, 5, 2, 2, 702000, 1, N'Lê Văn Luyện', N'0852367522', N'96 Dương Đình Hội', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (11, 1, 5, 1, 192000, 1, N'Lê Văn Luyến', N'0178225854', N'85 Phan Văn Trị', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (12, 7, 3, 1, 300000, 1, N'Lê Văn Linh', N'0147522442', N'45/2 Lê Văn Sỹ', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (13, 8, 3, 1, 300000, 1, N'Lê Văn Luyện', N'0246885225', N'123 Phạm Văn Đồng', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (14, 8, 13, 1, 96000, 1, N'Lê Văn Trung', N'0147522442', N'96 Dương Đình Hội', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (15, 9, 2, 1, 255000, 1, N'Lê Văn Trung', N'0178225854', N'45/2 Lê Văn Sỹ', N'Express delivery')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (16, 9, 1, 5, 240000, 1, N'Lê Văn Dũng', N'0148224752', N'85 Phan Văn Trị', N'Buy on site')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (17, 10, 1024, 1, 21000, 1, N'Lê Văn Phát', N'0246885225', N'96 Dương Đình Hội', N'Bring Back')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (18, 10, 1, 1, 240000, 1, N'Lê Văn Long', N'0157524775', N'123 Phạm Văn Đồng', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (19, 11, 1024, 1, 21000, 1, N'Lê Văn Tiến', N'0852367522', N'45/2 Lê Văn Sỹ', N'Bring Back')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (20, 11, 1, 1, 240000, 1, N'Lê Văn Phong', N'0753920558', N'96 Dương Đình Hội', N'Ship Code')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (21, 12, 1024, 1, 21000, 1, N'Lê Văn Cương', N'0475247851', N'123 Phạm Văn Đồng', N'Bring Back')
INSERT [dbo].[tblOrderDetails] ([order_details_id], [order_id], [product_id], [quantity], [unit_price], [status], [full_name], [phone_number], [address], [type_shipping]) VALUES (22, 13, 20, 1, 250000, 1, N'Lê Văn Phong', N'0125475898', N'85 Phan Văn Trị', N'Ship Code')
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (1, N'C003 White', N'Da Tổng hợp tất cả sản phẩm đều bảo hành chính hãng Dincox ', 240000, 140000, 92, 1, CAST(N'2022-06-17 12:00:00.000' AS DateTime), 2, 1, N'assets/c3_white.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (2, N'C03 Blackss', N'kết hợp công nghệ siêu êm giữa latex và memory foam.', 255000, 120000, 1, 1, CAST(N'2022-05-30 12:00:00.000' AS DateTime), 3, 2, N'assets/c3_black.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (3, N'E001 Red', N'Đế cao su thiên nhiên chống trơn trượt', 300000, 100000, 48, 1, CAST(N'2022-05-03 12:00:00.000' AS DateTime), 4, 3, N'assets/c01_red.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (4, N'C05 Pink', N'Da bò thật
-Hoa văn,chi tiết: Một Màu', 230000, 130000, 40, 1, CAST(N'2022-05-10 00:00:00.000' AS DateTime), 5, 4, N'assets/c2_pink.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (5, N'C15 Grey', N'Vải Canvas, đế cao su thiên, đi làm, đi chơi, đi tiệc.', 265000, 140000, 50, 1, CAST(N'2022-05-15 00:00:00.000' AS DateTime), 3, 3, N'assets/c15_grey.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (6, N'test new product1', N'test new product1', 100000, 255000, 40, 1, CAST(N'2022-06-08 00:00:00.000' AS DateTime), 2, NULL, N'assets/logo_low.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (7, N'test new product2', N'test new product1', 100000, 255000, 40, 1, CAST(N'2022-06-08 00:00:00.000' AS DateTime), 2, NULL, N'assets/logo_low.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (8, N'test new product3', N'test new product1', 100000, 255000, 40, 1, CAST(N'2022-06-08 00:00:00.000' AS DateTime), 2, NULL, N'assets/logo_low.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (9, N'test 2', N'2', 440000, 150000, 8, 0, CAST(N'2022-06-06 12:00:00.000' AS DateTime), 2, NULL, N'assets/c3_black.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (10, N'test 3', N'test 3', 240000, 1000, 10, 0, CAST(N'2022-06-09 12:00:00.000' AS DateTime), 3, NULL, N'assets/c2_pink.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (11, N'test 3', N'test 3', 55000, 1000, 10, 0, CAST(N'2022-06-09 12:00:00.000' AS DateTime), 3, NULL, N'assets/c2_pink.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (12, N'test 3', N'test 3', 51000, 1000, 1, 0, CAST(N'2022-06-10 12:00:00.000' AS DateTime), 2, NULL, N'assets/c3_black.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (13, N'test 3', N'test 3', 96000, 1000, 0, 0, CAST(N'2022-06-10 12:00:00.000' AS DateTime), 2, NULL, N'assets/c3_black.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (14, N'test 3', N'test 3', 93000, 13000, 13, 0, CAST(N'2022-06-16 12:00:00.000' AS DateTime), 3, NULL, N'assets/logo.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (15, N'test 3', N'test 3', 69000, 13000, 13, 0, CAST(N'2022-06-16 12:00:00.000' AS DateTime), 3, NULL, N'assets/logo.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (16, N'test 4', N'test 4', 78000, 15000, 13, 0, CAST(N'2022-06-10 12:00:00.000' AS DateTime), 1, NULL, N'assets/c2_pink.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (17, N'test 4', N'test 4', 92000, 1000, 13, 0, CAST(N'2022-06-17 12:00:00.000' AS DateTime), 2, NULL, N'assets/logo.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (18, N'test dup', N'this product is every nice', 93000, 1000, 13, 0, CAST(N'2022-06-17 12:00:00.000' AS DateTime), 2, NULL, N'assets/logo.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (19, N'COP3 White', N'Da Tổng hợp tất cả sản phẩm đều bảo hành chính hãng Dincox ', 240000, 140000, 99, 1, CAST(N'2022-06-17 12:00:00.000' AS DateTime), 4, NULL, N'assets/c3_white.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (20, N'A33 Black', N'Da Tổng hợp tất', 250000, 245000, 14, 1, CAST(N'2022-06-17 12:00:00.000' AS DateTime), 5, NULL, N'assets/c3_white.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (1019, N'tessssssssssssssssssssss', N'tessssssssssssssssssssss', 120000, 20000, 12, 0, CAST(N'2022-07-08 12:00:00.000' AS DateTime), 2, NULL, N'assets/c01_red.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (1024, N'Update function product 23', N'Update function product 45', 21000, 25000, 21, 1, CAST(N'2022-07-13 12:00:00.000' AS DateTime), 2, NULL, N'assets/c3_black.png')
INSERT [dbo].[tblProduct] ([product_id], [product_name], [description], [sale_price], [import_price], [quantity], [status], [import_date], [category_id], [DiscountId], [product_image]) VALUES (1025, N'Test function add product 1', N'Test function add product 2', 12000, 23000, 12, 0, CAST(N'2022-07-21 12:00:00.000' AS DateTime), 4, NULL, N'assets/c3_black.png')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
SET IDENTITY_INSERT [dbo].[tblProductSize] ON 

INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (1, 36, 1)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (2, 37, 1)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (3, 38, 1)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (4, 39, 1)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (5, 40, 1)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (6, 36, 2)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (7, 37, 2)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (8, 38, 2)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (9, 39, 2)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (10, 40, 2)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (11, 36, 3)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (12, 37, 3)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (13, 38, 3)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (14, 39, 3)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (15, 40, 3)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (16, 36, 4)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (17, 37, 4)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (18, 38, 4)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (19, 39, 4)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (20, 40, 4)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (21, 36, 5)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (22, 37, 5)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (23, 38, 5)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (24, 39, 5)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (25, 40, 5)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (26, 36, 6)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (27, 37, 6)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (28, 38, 6)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (29, 39, 6)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (30, 40, 6)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (31, 36, 7)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (32, 37, 7)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (33, 38, 7)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (34, 39, 7)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (35, 40, 7)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (36, 36, 8)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (37, 37, 8)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (38, 38, 8)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (39, 39, 8)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (40, 40, 8)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (41, 36, 19)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (42, 37, 19)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (43, 38, 19)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (44, 39, 19)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (45, 40, 19)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (46, 36, 20)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (47, 37, 20)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (48, 38, 20)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (49, 39, 20)
INSERT [dbo].[tblProductSize] ([size_id], [size_product], [product_id]) VALUES (50, 40, 20)
SET IDENTITY_INSERT [dbo].[tblProductSize] OFF
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (1, N'ADMIN')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (2, N'CUSTOMER')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (3, N'SUPPLIER')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([user_id], [email], [password], [role_id], [status], [full_name], [phone], [create_date]) VALUES (1, N'admin@gmail.com', N'Cus123!@', 1, 1, N'Admin 1', N'0909452312', CAST(N'2020-05-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUser] ([user_id], [email], [password], [role_id], [status], [full_name], [phone], [create_date]) VALUES (2, N'cus1@gmail.com', N'Cus123!@', 2, 1, N'Lê Văn Cương', N'0934245212', CAST(N'2020-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblUser] ([user_id], [email], [password], [role_id], [status], [full_name], [phone], [create_date]) VALUES (3, N'test1@gmail.com', N'Cus123!@', 3, 1, N'test', N'0912351234', CAST(N'2020-05-25 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUser] ([user_id])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tblCategory] ([category_id])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[tblDiscount] ([DiscountId])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tblRole] ([role_id])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_User_Role]
GO
