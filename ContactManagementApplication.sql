USE [master]
GO
/****** Object:  Database [ContactManagementApplication]    Script Date: 06/20/2014 22:33:25 ******/
CREATE DATABASE [ContactManagementApplication] ON  PRIMARY 
( NAME = N'ContactManagementApplication', FILENAME = N'C:\SQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ContactManagementApplication.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContactManagementApplication_log', FILENAME = N'C:\SQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ContactManagementApplication_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ContactManagementApplication] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactManagementApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactManagementApplication] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ContactManagementApplication] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ContactManagementApplication] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ContactManagementApplication] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ContactManagementApplication] SET ARITHABORT OFF
GO
ALTER DATABASE [ContactManagementApplication] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ContactManagementApplication] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ContactManagementApplication] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ContactManagementApplication] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ContactManagementApplication] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ContactManagementApplication] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ContactManagementApplication] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ContactManagementApplication] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ContactManagementApplication] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ContactManagementApplication] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ContactManagementApplication] SET  DISABLE_BROKER
GO
ALTER DATABASE [ContactManagementApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ContactManagementApplication] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ContactManagementApplication] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ContactManagementApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ContactManagementApplication] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ContactManagementApplication] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ContactManagementApplication] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ContactManagementApplication] SET  READ_WRITE
GO
ALTER DATABASE [ContactManagementApplication] SET RECOVERY FULL
GO
ALTER DATABASE [ContactManagementApplication] SET  MULTI_USER
GO
ALTER DATABASE [ContactManagementApplication] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ContactManagementApplication] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ContactManagementApplication', N'ON'
GO
USE [ContactManagementApplication]
GO
/****** Object:  User [cma]    Script Date: 06/20/2014 22:33:25 ******/
CREATE USER [cma] FOR LOGIN [cma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 06/20/2014 22:33:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[IsActive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
