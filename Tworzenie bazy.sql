USE [master]
GO
/****** Object:  Database [Enterprise]    Script Date: 26.02.2023 13:01:37 ******/
CREATE DATABASE [Enterprise]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Enterprise', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Enterprise.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Enterprise_log', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Enterprise_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Enterprise] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Enterprise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Enterprise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Enterprise] SET ARITHABORT OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Enterprise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Enterprise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Enterprise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Enterprise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Enterprise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Enterprise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Enterprise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Enterprise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Enterprise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Enterprise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Enterprise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Enterprise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Enterprise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Enterprise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Enterprise] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Enterprise] SET  MULTI_USER 
GO
ALTER DATABASE [Enterprise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Enterprise] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Enterprise] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Enterprise] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Enterprise] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Enterprise] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Enterprise] SET QUERY_STORE = OFF
GO
USE [Enterprise]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.02.2023 13:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoicePositions]    Script Date: 26.02.2023 13:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoicePositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InvoicePositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 26.02.2023 13:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [varchar](50) NOT NULL,
	[ClientNumber] [int] NOT NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26.02.2023 13:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InvoicePositions]  WITH CHECK ADD  CONSTRAINT [FK_InvoicePositions_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[InvoicePositions] CHECK CONSTRAINT [FK_InvoicePositions_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Clients] FOREIGN KEY([ClientNumber])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Clients]
GO
USE [master]
GO
ALTER DATABASE [Enterprise] SET  READ_WRITE 
GO
