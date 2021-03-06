USE [master]
GO
/****** Object:  Database [ContactManagementApplication]    Script Date: 06/21/2014 22:42:03 ******/
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
/****** Object:  User [cma]    Script Date: 06/21/2014 22:42:03 ******/
--CREATE USER [cma] FOR LOGIN [cma] WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 06/21/2014 22:42:03 ******/
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
/****** Object:  StoredProcedure [dbo].[spContactSave]    Script Date: 06/21/2014 22:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spContactSave]
	@ContactID int = NULL,
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@Address1 varchar(100) = NULL,
	@Address2 varchar(100) = NULL,
	@City varchar(50) = NULL,
	@State varchar(2) = NULL,
	@Zip varchar(10) = NULL,
	@IsActive bit = NULL
as
begin
	if exists (select ContactID from Contacts where ContactID = @ContactID)
		begin
			update Contacts
			set 
				FirstName = coalesce(@FirstName, FirstName),
				LastName = coalesce(@LastName, LastName),
				Address1 = coalesce(@Address1, Address1),
				Address2 = coalesce(@Address2, Address2),
				City = coalesce(@City, City),
				[State] = coalesce(@State, [State]),
				Zip = coalesce(@Zip, Zip),
				IsActive = coalesce(@IsActive, IsActive),
				DateModified = GETDATE()
			where
				ContactID = @ContactID
				
			select * from Contacts where ContactID = @ContactID
		end
	else
		begin
			insert into Contacts
				(FirstName, LastName, Address1, Address2, City, [State], Zip, IsActive, DateCreated, DateModified)
			values
				(@FirstName, @LastName, @Address1, @Address2, @City, @State, @Zip, @IsActive, GETDATE(), GETDATE())		
				
			select * from Contacts where ContactID = SCOPE_IDENTITY()
		end
end
GO
