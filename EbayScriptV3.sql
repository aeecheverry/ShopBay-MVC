USE [master]
GO
/****** Object:  Database [Ebay]    Script Date: 26/09/2017 11:06:13 a.m. ******/
CREATE DATABASE [Ebay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ebay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Ebay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ebay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Ebay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ebay] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ebay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ebay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ebay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ebay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ebay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ebay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ebay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ebay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ebay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ebay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ebay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ebay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ebay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ebay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ebay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ebay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ebay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ebay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ebay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ebay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ebay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ebay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ebay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ebay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ebay] SET  MULTI_USER 
GO
ALTER DATABASE [Ebay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ebay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ebay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ebay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ebay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ebay] SET QUERY_STORE = OFF
GO
USE [Ebay]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Ebay]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[EndDate] [date] NULL,
	[CurrentBid] [int] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BidList]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidList](
	[AuctionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Bid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryTitle] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CategoryImage] [image] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageCatalog]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageCatalog](
	[ProductID] [int] NOT NULL,
	[ProductImage] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movements]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movements](
	[UserID] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[Ammount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnSaleProducts]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnSaleProducts](
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_OnSaleProducts] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCommentary]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCommentary](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Rate] [float] NULL,
	[Comment] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [int] NULL,
	[UserID] [int] NOT NULL,
	[ShippingID] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[Existencies] [int] NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsSold]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSold](
	[BuyerID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[BuyDate] [date] NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[ShippingID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileCommentary]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileCommentary](
	[UserID] [int] NOT NULL,
	[RatedUserID] [int] NOT NULL,
	[Rate] [float] NULL,
	[Commentary] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingOptions]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingOptions](
	[ShippingID] [int] NOT NULL,
	[ArrivalTime] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[ShippingTitle] [varchar](50) NULL,
 CONSTRAINT [PK_ShippingOptions] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/09/2017 11:06:14 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Information] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Rate] [float] NULL,
	[AccMoney] [int] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (1, 9, CAST(N'2017-10-25' AS Date), 951000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (2, 11, CAST(N'2017-11-15' AS Date), 1600000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (3, 23, CAST(N'2017-10-05' AS Date), 3500)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (4, 12, CAST(N'2017-10-17' AS Date), 115800000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (5, 13, CAST(N'2017-11-11' AS Date), 178650000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 1, 200)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 3, 300)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 2, 400)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 5, 1000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 1, 2000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 6, 3500)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (1, N'Vehicles', N'From cars to helicopters. All available for you.', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (2, N'School', N'Directed for school days, anything scholar can be found here', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (3, N'Technology', N'Everything up to date on technology can be found here', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (4, N'Clothing', N'All clothing for men, women, and.. Anything that can be dressed', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (5, N'Security', N'To protect yourself and family with weapons', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (6, N'Collector Items', N'Unique items that tend to be expensive', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (7, N'Uncategorized', N'Everything else that can not be found in a specific category', NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (7, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (12, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (13, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (14, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (15, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (1, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (2, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (3, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (9, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (4, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (5, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (6, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (19, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (8, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (16, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (17, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (20, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (18, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (26, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (11, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (21, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (23, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (22, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (10, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (24, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (25, NULL)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (1, N'Cargar', 100000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (2, N'Cargar', 2500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (3, N'Cargar', 15000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (4, N'Cargar', 34000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (5, N'Cargar', 69000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (6, N'Cargar', 47000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (7, N'Cargar', 34500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (8, N'Cargar', 37000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (9, N'Cargar', 14500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (10, N'Cargar', 22000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (11, N'Cargar', 100225600)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (12, N'Cargar', 24000500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (13, N'Cargar', 35000000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (14, N'Cargar', 14500000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (15, N'Cargar', 36500100)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (1, N'Compra', -52000)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (2, 24)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (3, 3)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (4, 19)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (5, 4)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (6, 5)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (7, 21)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (8, 6)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (9, 16)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (10, 2)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (11, 8)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (12, 10)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (13, 20)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (14, 7)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (15, 22)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (16, 25)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (17, 15)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (18, 18)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (19, 17)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (20, 14)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (21, 26)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 7)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 12)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 13)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 14)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 15)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 2)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 3)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 9)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 4)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 5)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 6)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 19)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 8)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 16)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 17)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 20)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (4, 18)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (4, 26)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 11)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 21)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 23)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 22)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 10)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 24)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 25)
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 1, 3, N'Tons of errors and damaged components')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 15, 2, N'The hell is wrong with his hair?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 3, 5, N'Now i don''t get my cel stole so often')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (6, 1, 3, N'I don''t like it')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (12, 19, 4, N'Gorgeus beast')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 4, 1, N'Why would you sell this? It''s dangerous for children!')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 5, 2, N'Its very rusty')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (11, 21, 5, N'I''m getting used to "Usa el poder"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 6, 4, N'I like it')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (4, 16, 3, N'Bad quality')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 2, 5, N'400 dolars for this shit?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 8, 1, N'This shipment got lost many times')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 10, 2, N'It arrived broken. I want a refund.')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 20, 5, N'I used to hate algebra. With this book my life changed')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 21, 5, N'He doesn''t want me to use a Cap or a Hat because it blocks "El poder"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 24, 2, N'He keeps saying "Ay no pues, pshh", its pretty anoying. I demand a refund.')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 21, 5, N'He hitted me with his belt 5 "correazos" :(')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 7, 3, N'Yo prefiero un burro')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 22, 4, N'Confortable')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 25, 5, N'HOLA, HOLA, HOLA, ¿¡QUE TAL!?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (7, 15, 2, N'Arrived with low fuel')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 16, 2, N'Never received the product')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (13, 18, 4, N'I love it! It''s stretchy')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (4, 17, 4, N'Now i''m king koopa!')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 2, 5, N'Ya puedo montar mi plaquita de picó')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (8, 17, 1, N'Awful design')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (6, 21, 5, N'"Excelente!"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 17, 4, N'RAAWR!')
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (1, N'Samsung Galaxy S4', 600000, 1, 2, N'A very luxury celphone', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (2, N'Altera DE2 Cyclone IV', 1200000, 1, 2, N'A Fake board', 40, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (3, N'Pokemon GO Plus', 210000, 6, 1, N'Like a clock, but captures pokemon', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (4, N'M4', 512000, 5, 1, N'Military use only', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (5, N'AK47', 485000, 8, 1, N'My grand father''s heritage', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (6, N'Military Knife', 12000, 4, 1, N'Navy Seals knife', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (7, N'A Fucking Train', 66000000, 2, 3, N'Golden train from some arab''s rich kid', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (8, N'Toto Schoolbag', 97000, 1, 1, N'Usefull to carry stuff, and also more expensive.', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (9, N'Robotic Scorpio', 951000, 4, 2, N'Hours of fun guaranteed with this "animal"', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (10, N'Crystal Ball', 210000, 7, 2, N'Spoil your life', 4, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (11, N'Play Station 1', 1600000, 3, 2, N'Spend tons of time with this console and you''ll regret it', 9, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (12, N'Ford GT', 115800000, 4, 3, N'Beautiful sports car and perfect for racing on the streets', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (13, N'Bugatti Chiron', 178650000, 9, 3, N'Super expensive car. There''s only 3 around the globe.', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (14, N'Hunter', 110500000, 10, 3, N'Military chopper getting rusty on the hangar.', 4, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (15, N'Maverick', 98500000, 5, 3, N'US Navy Seals special chopper for operations', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (16, N'Shakira Notebook', 8000, 8, 1, N'Shakira themed notebook', 12, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (17, N'Bowser Backpack', 36000, 10, 2, N'King Koopa lost its shell. Somehow.', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (18, N'Fancy T-Shirt', 64000, 10, 1, N'Fancy Unisex T-Shirt ', 20, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (19, N'Flamethrower', 1250000, 9, 3, N'Powerful burning system', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (20, N'Baldor''s book', 35000, 10, 1, N'Algebra basics', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (21, N'Mancilla''s Logo', 100000, 10, 3, N'By having this, you''ll have EL PODER', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (22, N'Bed', 644000, 7, 2, N'Sleep confortable', 6, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (23, N'Jesus Christ Picture', 100, 3, 1, N'God Bless You', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (24, N'Bargained Alien', 609609, 1, 3, N'An extraterrestrial life that is said to come from an outer galaxy, where technology has advanced to giant steps ', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (25, N'Brownie', 2000, 2, 1, N'ITS LIIIIIIIIIFEEEEEEEEEEEEEE!!!!', 85, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (26, N'400 Million wanted T-Shirt', 52000, 14, 2, N'If you wear this Shirt, you will be wanted.', 15, 0)
INSERT [dbo].[ProductsSold] ([BuyerID], [SellerID], [ProductID], [BuyDate], [Price], [Quantity], [ShippingID]) VALUES (1, 14, 26, CAST(N'2017-09-20' AS Date), 52000, 1, 2)
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 2, 1, N'Bad quality products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 3, 5, N'Excelent products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 4, 3, N'"Ay no pues"')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 5, 5, N'Very logical products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 6, 5, N'Gay but good products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 7, 4, N'Nice products, however i won''t give 5 stars.')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 8, 5, N'Excelent products')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (1, N'3 Days', N'Fastest delivery option, not so secure though.', N'Puerta a Puerta')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (2, N'1 week', N'Very secure when you''re gonna deliver a package. Trustworty option', N'Servientrega')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (3, N'1 Month', N'100% trustworthy when delivering big stuff. Suitable for vehicles', N'Big Shipment')
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (1, 9, CAST(N'2017-10-25' AS Date), 951000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (2, 11, CAST(N'2017-11-15' AS Date), 1600000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (3, 23, CAST(N'2017-10-05' AS Date), 3500)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (4, 12, CAST(N'2017-10-17' AS Date), 115800000)
INSERT [dbo].[Auction] ([AuctionID], [ProductID], [EndDate], [CurrentBid]) VALUES (5, 13, CAST(N'2017-11-11' AS Date), 178650000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 1, 200)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 3, 300)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 2, 400)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 5, 1000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 1, 2000)
INSERT [dbo].[BidList] ([AuctionID], [UserID], [Bid]) VALUES (3, 6, 3500)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (1, N'Vehicles', N'From cars to helicopters. All available for you.', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (2, N'School', N'Directed for school days, anything scholar can be found here', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (3, N'Technology', N'Everything up to date on technology can be found here', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (4, N'Clothing', N'All clothing for men, women, and.. Anything that can be dressed', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (5, N'Security', N'To protect yourself and family with weapons', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (6, N'Collector Items', N'Unique items that tend to be expensive', NULL)
INSERT [dbo].[Category] ([CategoryID], [CategoryTitle], [Description], [CategoryImage]) VALUES (7, N'Uncategorized', N'Everything else that can not be found in a specific category', NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (7, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (12, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (13, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (14, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (15, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (1, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (2, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (3, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (9, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (4, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (5, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (6, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (19, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (8, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (16, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (17, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (20, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (18, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (26, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (11, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (21, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (23, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (22, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (10, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (24, NULL)
INSERT [dbo].[ImageCatalog] ([ProductID], [ProductImage]) VALUES (25, NULL)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (1, N'Cargar', 100000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (2, N'Cargar', 2500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (3, N'Cargar', 15000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (4, N'Cargar', 34000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (5, N'Cargar', 69000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (6, N'Cargar', 47000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (7, N'Cargar', 34500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (8, N'Cargar', 37000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (9, N'Cargar', 14500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (10, N'Cargar', 22000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (11, N'Cargar', 100225600)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (12, N'Cargar', 24000500)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (13, N'Cargar', 35000000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (14, N'Cargar', 14500000)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (15, N'Cargar', 36500100)
INSERT [dbo].[Movements] ([UserID], [Type], [Ammount]) VALUES (1, N'Compra', -52000)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (2, 24)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (3, 3)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (4, 19)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (5, 4)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (6, 5)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (7, 21)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (8, 6)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (9, 16)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (10, 2)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (11, 8)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (12, 10)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (13, 20)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (14, 7)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (15, 22)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (16, 25)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (17, 15)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (18, 18)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (19, 17)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (20, 14)
INSERT [dbo].[OnSaleProducts] ([SaleID], [ProductID]) VALUES (21, 26)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 7)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 12)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 13)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 14)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (1, 15)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 1)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 2)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 3)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (3, 9)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 4)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 5)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 6)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (5, 19)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 8)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 16)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 17)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (2, 20)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (4, 18)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (4, 26)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 11)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 21)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (6, 23)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 22)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 10)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 24)
INSERT [dbo].[ProductCategory] ([CategoryID], [ProductID]) VALUES (7, 25)
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 1, 3, N'Tons of errors and damaged components')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 15, 2, N'The hell is wrong with his hair?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 3, 5, N'Now i don''t get my cel stole so often')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (6, 1, 3, N'I don''t like it')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (12, 19, 4, N'Gorgeus beast')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 4, 1, N'Why would you sell this? It''s dangerous for children!')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 5, 2, N'Its very rusty')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (11, 21, 5, N'I''m getting used to "Usa el poder"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 6, 4, N'I like it')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (4, 16, 3, N'Bad quality')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 2, 5, N'400 dolars for this shit?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 8, 1, N'This shipment got lost many times')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 10, 2, N'It arrived broken. I want a refund.')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 20, 5, N'I used to hate algebra. With this book my life changed')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 21, 5, N'He doesn''t want me to use a Cap or a Hat because it blocks "El poder"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (1, 24, 2, N'He keeps saying "Ay no pues, pshh", its pretty anoying. I demand a refund.')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 21, 5, N'He hitted me with his belt 5 "correazos" :(')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (3, 7, 3, N'Yo prefiero un burro')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (2, 22, 4, N'Confortable')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 25, 5, N'HOLA, HOLA, HOLA, ¿¡QUE TAL!?')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (7, 15, 2, N'Arrived with low fuel')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 16, 2, N'Never received the product')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (13, 18, 4, N'I love it! It''s stretchy')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (4, 17, 4, N'Now i''m king koopa!')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (5, 2, 5, N'Ya puedo montar mi plaquita de picó')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (8, 17, 1, N'Awful design')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (6, 21, 5, N'"Excelente!"')
INSERT [dbo].[ProductCommentary] ([UserID], [ProductID], [Rate], [Comment]) VALUES (9, 17, 4, N'RAAWR!')
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (1, N'Samsung Galaxy S4', 600000, 1, 2, N'A very luxury celphone', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (2, N'Altera DE2 Cyclone IV', 1200000, 1, 2, N'A Fake board', 40, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (3, N'Pokemon GO Plus', 210000, 6, 1, N'Like a clock, but captures pokemon', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (4, N'M4', 512000, 5, 1, N'Military use only', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (5, N'AK47', 485000, 8, 1, N'My grand father''s heritage', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (6, N'Military Knife', 12000, 4, 1, N'Navy Seals knife', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (7, N'A Fucking Train', 66000000, 2, 3, N'Golden train from some arab''s rich kid', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (8, N'Toto Schoolbag', 97000, 1, 1, N'Usefull to carry stuff, and also more expensive.', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (9, N'Robotic Scorpio', 951000, 4, 2, N'Hours of fun guaranteed with this "animal"', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (10, N'Crystal Ball', 210000, 7, 2, N'Spoil your life', 4, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (11, N'Play Station 1', 1600000, 3, 2, N'Spend tons of time with this console and you''ll regret it', 9, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (12, N'Ford GT', 115800000, 4, 3, N'Beautiful sports car and perfect for racing on the streets', 2, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (13, N'Bugatti Chiron', 178650000, 9, 3, N'Super expensive car. There''s only 3 around the globe.', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (14, N'Hunter', 110500000, 10, 3, N'Military chopper getting rusty on the hangar.', 4, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (15, N'Maverick', 98500000, 5, 3, N'US Navy Seals special chopper for operations', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (16, N'Shakira Notebook', 8000, 8, 1, N'Shakira themed notebook', 12, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (17, N'Bowser Backpack', 36000, 10, 2, N'King Koopa lost its shell. Somehow.', 3, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (18, N'Fancy T-Shirt', 64000, 10, 1, N'Fancy Unisex T-Shirt ', 20, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (19, N'Flamethrower', 1250000, 9, 3, N'Powerful burning system', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (20, N'Baldor''s book', 35000, 10, 1, N'Algebra basics', 7, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (21, N'Mancilla''s Logo', 100000, 10, 3, N'By having this, you''ll have EL PODER', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (22, N'Bed', 644000, 7, 2, N'Sleep confortable', 6, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (23, N'Jesus Christ Picture', 100, 3, 1, N'God Bless You', 10, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (24, N'Bargained Alien', 609609, 1, 3, N'An extraterrestrial life that is said to come from an outer galaxy, where technology has advanced to giant steps ', 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (25, N'Brownie', 2000, 2, 1, N'ITS LIIIIIIIIIFEEEEEEEEEEEEEE!!!!', 85, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [Price], [UserID], [ShippingID], [Description], [Existencies], [Rate]) VALUES (26, N'400 Million wanted T-Shirt', 52000, 14, 2, N'If you wear this Shirt, you will be wanted.', 15, 0)
INSERT [dbo].[ProductsSold] ([BuyerID], [SellerID], [ProductID], [BuyDate], [Price], [Quantity], [ShippingID]) VALUES (1, 14, 26, CAST(N'2017-09-20' AS Date), 52000, 1, 2)
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 2, 1, N'Bad quality products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 3, 5, N'Excelent products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 4, 3, N'"Ay no pues"')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 5, 5, N'Very logical products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 6, 5, N'Gay but good products')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 7, 4, N'Nice products, however i won''t give 5 stars.')
INSERT [dbo].[ProfileCommentary] ([UserID], [RatedUserID], [Rate], [Commentary]) VALUES (1, 8, 5, N'Excelent products')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (1, N'3 Days', N'Fastest delivery option, not so secure though.', N'Puerta a Puerta')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (2, N'1 week', N'Very secure when you''re gonna deliver a package. Trustworty option', N'Servientrega')
INSERT [dbo].[ShippingOptions] ([ShippingID], [ArrivalTime], [Description], [ShippingTitle]) VALUES (3, N'1 Month', N'100% trustworthy when delivering big stuff. Suitable for vehicles', N'Big Shipment')
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (1, N'Schurches', N'Steven', N'awaker2130', N'1', N'Iglesias', N'3022948145', N'steveni@uninorte.edu.co', 0, 25000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (2, N'Seitan', N'Andres', N'andres123', N'1', N'Echeverry', N'3152146485', N'aeecheverry@uninorte.edu.co', 0, 2500, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (3, N'NickyCHAM', N'Johan', N'mary123', N'1', N'Ilias', N'3015148164', N'iliasj@uninorte.edu.co', 0, 15000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (4, N'Diuke', N'Juan', N'diuke1347', N'1', N'Duque', N'3004851048', N'pjduque@uninorte.edu.co', 0, 34000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (5, N'Bielos', N'Daniel', N'bielos', N'1', N'Bielostotzky', N'3152489758', N'dbielostutzky@uninorte.edu.co', 0, 69000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (6, N'Acero', N'Steel', N'cheila', N'1', N'Herrera', N'3154485558', N'steelh@uninorte.edu.co', 0, 47000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (7, N'LagW', N'Luis', N'waldronl', N'1', N'Garcia', N'3145879996', N'waldronl@uninorte.edu.co', 0, 34500, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (8, N'CameloP', N'Maria', N'jonathan123', N'1', N'Camelo', N'3224441058', N'camelop@uninorte.edu.co', 0, 37000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (9, N'FranchoVega', N'Francisco', N'francho', N'1', N'Vega', N'3105784452', N'fjvega@uninorte.edu.co', 0, 14500, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (10, N'AVilla', N'Andres', N'Villa', N'1', N'Villazon', N'3042556785', N'acvillazon@uninorte.edu.co', 0, 22000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (11, N'UN', N'Uninorte', N'uninorte123', N'2', N'Jesus Ferro', N'3574897', N'uninorte@uninorte.edu.co', 0, 100225600, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (12, N'HewlettPackard', N'HP', N'hewlett', N'2', N'Carlos Brownie', N'3461475', N'hp@hotmail.com', 0, 24000500, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (13, N'ProtectingYourRights', N'Ammu Nation', N'gunsgunsguns', N'2', N'Tommy Vercetti', N'3226488', N'ammunation@webadmin.com', 0, 35000000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (14, N'Sniper', N'Rifle', N'jeansjeans', N'2', N'Don Puccini', N'3100303', N'rifla@hotmail.com', 0, 14500000, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (15, N'Pikachu', N'Niantic', N'bugs', N'2', N'Fumito Ueda', N'3030808', N'bugantic@gmail.com', 0, 36500100, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Password], [Type], [Information], [Telephone], [Mail], [Rate], [AccMoney], [Image]) VALUES (16, N'DoBetter', N'Andres', N'DoBetter', N'1', N'Rueda', N'3224332112', N'aruedaf@uninorte.edu.co', 0, 0, NULL)
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_Products]
GO
ALTER TABLE [dbo].[BidList]  WITH CHECK ADD  CONSTRAINT [FK_BidList_Auction] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auction] ([AuctionID])
GO
ALTER TABLE [dbo].[BidList] CHECK CONSTRAINT [FK_BidList_Auction]
GO
ALTER TABLE [dbo].[BidList]  WITH CHECK ADD  CONSTRAINT [FK_BidList_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BidList] CHECK CONSTRAINT [FK_BidList_Users]
GO
ALTER TABLE [dbo].[ImageCatalog]  WITH CHECK ADD  CONSTRAINT [FK_ImageCatalog_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ImageCatalog] CHECK CONSTRAINT [FK_ImageCatalog_Products]
GO
ALTER TABLE [dbo].[Movements]  WITH CHECK ADD  CONSTRAINT [FK_Movements_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Movements] CHECK CONSTRAINT [FK_Movements_Users]
GO
ALTER TABLE [dbo].[OnSaleProducts]  WITH CHECK ADD  CONSTRAINT [FK_OnSaleProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OnSaleProducts] CHECK CONSTRAINT [FK_OnSaleProducts_Products]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Products]
GO
ALTER TABLE [dbo].[ProductCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProductCommentary_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCommentary] CHECK CONSTRAINT [FK_ProductCommentary_Products]
GO
ALTER TABLE [dbo].[ProductCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProductCommentary_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductCommentary] CHECK CONSTRAINT [FK_ProductCommentary_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ShippingOptions] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingOptions] ([ShippingID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ShippingOptions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Products]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_ShippingOptions] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingOptions] ([ShippingID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_ShippingOptions]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Users] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Users]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Users1] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Users1]
GO
ALTER TABLE [dbo].[ProfileCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProfileCommentary_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProfileCommentary] CHECK CONSTRAINT [FK_ProfileCommentary_Users]
GO
ALTER TABLE [dbo].[ProfileCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProfileCommentary_Users1] FOREIGN KEY([RatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProfileCommentary] CHECK CONSTRAINT [FK_ProfileCommentary_Users1]
GO
USE [master]
GO
ALTER DATABASE [Ebay] SET  READ_WRITE 
GO
