USE [master]
GO
/****** Object:  Database [Restaurants]    Script Date: 10/19/2020 7:51:08 PM ******/
CREATE DATABASE [Restaurants]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurants', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Restaurants.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restaurants_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Restaurants_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Restaurants] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurants].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurants] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurants] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurants] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurants] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurants] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurants] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurants] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurants] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurants] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurants] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurants] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurants] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurants] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurants] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurants] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurants] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurants] SET RECOVERY FULL 
GO
ALTER DATABASE [Restaurants] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurants] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurants] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurants] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurants] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restaurants] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Restaurants', N'ON'
GO
ALTER DATABASE [Restaurants] SET QUERY_STORE = OFF
GO
USE [Restaurants]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DriverID] [int] NOT NULL,
	[Name] [text] NULL,
	[Driver#] [nchar](10) NULL,
	[MaxDeliveryDistance] [text] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[ID] [int] NOT NULL,
	[City] [text] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ManagerID] [int] NOT NULL,
	[ManagerFirstName] [text] NOT NULL,
	[ManagerLastName] [text] NOT NULL,
	[ContactNumber] [nchar](10) NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantInfo]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantInfo](
	[ID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Phonenumber] [nchar](10) NOT NULL,
	[Manager#] [int] NOT NULL,
	[RecordedEmployees] [int] NOT NULL,
	[EstimatedProfit] [int] NOT NULL,
	[MonthlyBillAmount] [int] NOT NULL,
	[SalesCoupon] [nchar](10) NOT NULL,
	[CouponCode] [text] NULL,
 CONSTRAINT [PK_RestaurantInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantInventory]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantInventory](
	[RestaurantID] [int] NOT NULL,
	[StockSourceID] [int] NOT NULL,
	[StockLow] [text] NOT NULL,
	[ReOrderDate] [nchar](10) NULL,
	[DeliveryDate] [nchar](10) NULL,
	[DriverID] [int] NULL,
 CONSTRAINT [PK_RestaurantInventory] PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 10/19/2020 7:51:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockSourceID] [int] NOT NULL,
	[Name] [text] NOT NULL,
	[Address] [text] NULL,
	[Phone#] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RestaurantInfo]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantInfo_Location] FOREIGN KEY([Manager#])
REFERENCES [dbo].[Managers] ([ManagerID])
GO
ALTER TABLE [dbo].[RestaurantInfo] CHECK CONSTRAINT [FK_RestaurantInfo_Location]
GO
ALTER TABLE [dbo].[RestaurantInfo]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantInfo_Location1] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([ID])
GO
ALTER TABLE [dbo].[RestaurantInfo] CHECK CONSTRAINT [FK_RestaurantInfo_Location1]
GO
ALTER TABLE [dbo].[RestaurantInventory]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantInventory_Delivery] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Delivery] ([DriverID])
GO
ALTER TABLE [dbo].[RestaurantInventory] CHECK CONSTRAINT [FK_RestaurantInventory_Delivery]
GO
ALTER TABLE [dbo].[RestaurantInventory]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantInventory_RestaurantInfo] FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[RestaurantInfo] ([ID])
GO
ALTER TABLE [dbo].[RestaurantInventory] CHECK CONSTRAINT [FK_RestaurantInventory_RestaurantInfo]
GO
ALTER TABLE [dbo].[RestaurantInventory]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantInventory_Stock] FOREIGN KEY([StockSourceID])
REFERENCES [dbo].[Stock] ([StockSourceID])
GO
ALTER TABLE [dbo].[RestaurantInventory] CHECK CONSTRAINT [FK_RestaurantInventory_Stock]
GO
USE [master]
GO
ALTER DATABASE [Restaurants] SET  READ_WRITE 
GO
