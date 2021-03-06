USE [master]
GO
/****** Object:  Database [jhl_db]    Script Date: 1/23/2018 8:10:43 AM ******/
CREATE DATABASE [jhl_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jhl_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\jhl_db.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'jhl_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\jhl_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [jhl_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jhl_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jhl_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jhl_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jhl_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jhl_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jhl_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [jhl_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jhl_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jhl_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jhl_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jhl_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jhl_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jhl_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jhl_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jhl_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jhl_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jhl_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jhl_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jhl_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jhl_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jhl_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jhl_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jhl_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jhl_db] SET RECOVERY FULL 
GO
ALTER DATABASE [jhl_db] SET  MULTI_USER 
GO
ALTER DATABASE [jhl_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jhl_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jhl_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jhl_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [jhl_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'jhl_db', N'ON'
GO
USE [jhl_db]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 1/23/2018 8:10:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisementName] [nvarchar](300) NOT NULL,
	[AdvertisementImage] [int] NOT NULL,
	[Link] [ntext] NOT NULL,
	[Index] [int] NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[ShowOnHome] [bit] NULL,
	[Active] [bit] NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[CategoryName] [nvarchar](100) NULL,
	[CategoryImage] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[ShowOnHome] [bit] NULL CONSTRAINT [DF__Category__ShowOn__267ABA7A]  DEFAULT ((0)),
	[MetaTitle] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[MetaDescriptions] [ntext] NULL,
	[Active] [bit] NULL CONSTRAINT [DF__Category__Active__276EDEB3]  DEFAULT ((1)),
	[Deleted] [bit] NULL CONSTRAINT [DF__Category__Delete__286302EC]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF__Category__Create__29572725]  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL CONSTRAINT [DF__Category__Modifi__2A4B4B5E]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[IsReaded] [bit] NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Config]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigName] [nvarchar](300) NOT NULL,
	[Value] [ntext] NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[Title] [nvarchar](250) NOT NULL,
	[CourseImage] [int] NOT NULL,
	[StartDate] [nvarchar](500) NULL,
	[Price] [nvarchar](500) NULL,
	[Teacher] [nvarchar](500) NULL,
	[Participants] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[MetaTitle] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[MetaDescriptions] [ntext] NULL,
	[ViewCount] [int] NULL,
	[Active] [bit] NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCategory]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[CategoryImage] [int] NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_CourseCategory_ShowOnHome]  DEFAULT ((0)),
	[MetaTitle] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[MetaDescriptions] [ntext] NULL,
	[Active] [bit] NULL CONSTRAINT [DF_CourseCategory_Active]  DEFAULT ((1)),
	[Deleted] [bit] NULL CONSTRAINT [DF_CourseCategory_Deleted]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_CourseCategory_Created]  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL CONSTRAINT [DF_CourseCategory_Modified]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_CourseCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[Path] [ntext] NOT NULL,
	[Title] [nvarchar](300) NULL,
 CONSTRAINT [pk_image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [nvarchar](50) NOT NULL,
	[Loged] [datetime] NULL,
	[LogedBy] [int] NULL,
	[Detail] [nvarchar](300) NULL,
 CONSTRAINT [pk_log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageImage] [int] NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](300) NULL CONSTRAINT [DF__Page__Descriptio__59063A47]  DEFAULT (N'Ðang cập nhật...'),
	[Body] [ntext] NULL CONSTRAINT [DF__Page__Body__59FA5E80]  DEFAULT (N'Ðang cập nhật...'),
	[MetaTitle] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[MetaDescriptions] [ntext] NULL,
	[ViewCount] [int] NULL DEFAULT ((0)),
	[DisplayOrder] [int] NULL,
	[ShowOnHome] [bit] NULL DEFAULT ((0)),
	[Active] [bit] NULL DEFAULT ((1)),
	[Deleted] [bit] NULL DEFAULT ((0)),
	[Created] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[PostImage] [int] NOT NULL,
	[MoreImage] [nvarchar](250) NULL,
	[CategoryID] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[MetaTitle] [ntext] NULL,
	[MetaKeywords] [ntext] NULL,
	[MetaDescriptions] [ntext] NULL,
	[ViewCount] [int] NULL,
	[Active] [bit] NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTag]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_posttag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SliderName] [nvarchar](300) NOT NULL,
	[SliderImage] [int] NOT NULL,
	[DisplayOrder] [int] NULL,
	[ShowOnHome] [bit] NULL,
	[Link] [ntext] NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NULL,
	[Deleted] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
	[Visited] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [pk_statistics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL DEFAULT ((1)),
	[Deleted] [bit] NULL DEFAULT ((0)),
	[Created] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1/23/2018 8:10:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[BirthDate] [date] NULL,
	[Gender] [nvarchar](5) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](100) NOT NULL,
	[Photo] [int] NULL,
	[Attempt] [int] NULL CONSTRAINT [DF__User__Attempt__1367E606]  DEFAULT ((3)),
	[Notes] [ntext] NULL,
	[Active] [bit] NULL CONSTRAINT [DF__User__Active__145C0A3F]  DEFAULT ((1)),
	[Deleted] [bit] NULL CONSTRAINT [DF__User__Deleted__15502E78]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF__User__Created__164452B1]  DEFAULT (getdate()),
	[CreatedBy] [int] NULL,
	[Modified] [datetime] NULL CONSTRAINT [DF__User__Modified__173876EA]  DEFAULT (getdate()),
	[ModifiedBy] [int] NULL,
 CONSTRAINT [pk_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [ParentID], [CategoryName], [CategoryImage], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (1, NULL, N'Du học Nhật Bản', 1, N'Du học Nhật Bản', 1, 1, N'du-hoc-nhat-ban', N'du hoc nhat ban', N'Du học Nhật Bản', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [ParentID], [CategoryName], [CategoryImage], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (2, NULL, N'Giao lưu - Hội thảo', 1, N'Giao lưu - Hội thảo', 2, 1, N'giao-luu-hoi-thao', N'giao luu, hoi thao', N'Giao lưu - Hội thảo', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [ParentID], [CategoryName], [CategoryImage], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (3, NULL, N'Tin tức JHL', 1, N'Tin tức JHL', 3, 1, N'tin-tuc-jhl', N'tin tuc jhl', N'Tin tức JHL', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [ParentID], [CategoryName], [CategoryImage], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (4, NULL, N'Việt Nam - Nhật Bản', 1, N'Việt Nam - Nhật Bản', 4, 1, N'viet-nam-nhat-ban', N'vat nam, nhat ban', N'Việt Nam - Nhật Bản', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[Category] ([ID], [ParentID], [CategoryName], [CategoryImage], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (5, NULL, N'Sự kiện', 1, N'Sự kiện', 5, 1, N'su-kien', N'sự kiện', N'Sự kiện', 1, 0, CAST(N'2018-01-23 00:06:01.527' AS DateTime), 3, CAST(N'2018-01-23 00:06:01.527' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CourseCategory] ON 

INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (1, NULL, NULL, N'Khóa học kinh doanh', N'Khóa học kinh doanh', 1, 1, N'khoa-hoc-kinh-doanh', N'kinh doanh', N'Khóa học kinh doanh', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (2, NULL, NULL, N'Khóa học Tiếng Nhật', N'Khóa học Tiếng Nhật', 2, 1, N'khoa-hoc-tieng-nhat', N'tiếng nhật', N'Khóa học Tiếng Nhật', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (3, NULL, NULL, N'Đào tạo cử nhân', N'Đào tạo cử nhân', 3, 1, N'dao-tao-cu-nhan', N'cử nhân, đào tạo', N'Đào tạo cử nhân', 1, 0, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3, CAST(N'2018-01-22 23:56:21.477' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (4, 1, NULL, N'Khóa học kinh doanh cao cấp Keieijuku', N'Khóa học kinh doanh cao cấp Keieijuku', 1, 1, N'khoa-hoc-kinh-doanh-cao-cap-keieijuku', N'Keieijuku, kinh doanh', N'Khóa học kinh doanh cao cấp Keieijuku', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (5, 1, NULL, N'Khóa học ngắn hạn', N'Khóa học ngắn hạn', 3, 1, N'khoa-hoc-ngan-han', N'Khóa học ngắn hạn', N'Khóa học ngắn hạn', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (6, 1, NULL, N'Khóa học Trung hạn', N'Khóa học Trung hạn', 3, 1, N'khoa-hoc-trung-han', N'Khóa học Trung hạn', N'Khóa học Trung hạn', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (7, 2, NULL, N'Khóa học giao tiếp sơ cấp', N'Khóa học giao tiếp sơ cấp', 1, 1, N'khoa-hoc-giao-tiep-so-cap', N'Khóa học giao tiếp sơ cấp', N'Khóa học giao tiếp sơ cấp', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (8, 2, NULL, N'Khóa học luyện thi năng lực tiếng Nhật', N'Khóa học luyện thi năng lực tiếng Nhật', 2, 1, N'khoa-hoc-luyen-thi-nang-luc-tieng-nhat', N'Khóa học luyện thi năng lực tiếng Nhật', N'Khóa học luyện thi năng lực tiếng Nhật', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (9, 2, NULL, N'Khóa học tiếng nhật cho doanh nghiệp', N'Khóa học tiếng nhật cho doanh nghiệp', 3, 1, N'khoa-hoc-tieng-nhat-cho-doanh-nghiep', N'Khóa học tiếng nhật cho doanh nghiệp', N'Khóa học tiếng nhật cho doanh nghiệp', 1, 0, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3, CAST(N'2018-01-23 00:09:28.080' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (10, 2, NULL, N'Khóa học kế toán tiếng nhật', N'Khóa học kế toán tiếng nhật', 4, 1, N'khoa-hoc-ke-toan-tieng-nhat', N'Khóa học kế toán tiếng nhật', N'Khóa học kế toán tiếng nhật', 1, 0, CAST(N'2018-01-23 00:15:14.317' AS DateTime), 3, CAST(N'2018-01-23 00:15:14.317' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (11, 2, NULL, N'Khóa học phiên dịch Tiếng Nhật', N'Khóa học phiên dịch Tiếng Nhật', 5, 1, N'khoa-hoc-phien-dich-tieng-nhat', N'Khóa học phiên dịch Tiếng Nhật', NULL, 1, 0, CAST(N'2018-01-23 00:15:43.610' AS DateTime), 3, CAST(N'2018-01-23 00:15:43.610' AS DateTime), 3)
INSERT [dbo].[CourseCategory] ([ID], [ParentID], [CategoryImage], [CategoryName], [Description], [DisplayOrder], [ShowOnHome], [MetaTitle], [MetaKeywords], [MetaDescriptions], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (12, 3, NULL, N'Chương trình cử nhân Kinh doanh quốc tế theo mô hình Nhật Bản', N'Chương trình cử nhân Kinh doanh quốc tế theo mô hình Nhật Bản', 1, 1, N'chuong-trinh-cu-nhan-kinh-doanh-quoc-te-theo-mo-hinh-nhat-ban', N'Chương trình cử nhân Kinh doanh quốc tế theo mô hình Nhật Bản', NULL, 1, 0, CAST(N'2018-01-23 00:17:53.220' AS DateTime), 3, CAST(N'2018-01-23 00:17:53.220' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[CourseCategory] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ID], [FileName], [Path], [Title]) VALUES (1, N'no-image', N'/Images/images/no-image.png', N'Chưa có hình ảnh')
INSERT [dbo].[Image] ([ID], [FileName], [Path], [Title]) VALUES (2, N'no-image-2', N'https://avatars3.githubusercontent.com/u/22876230?s=88&v=4', N'Chưa có hình ảnh')
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (1, 1, N'Giới thiệu tổng quan', N'Đang cập nhật', N'Đang cập nhật', N'gioi-thieu-tong-quan', NULL, NULL, 0, 1, 1, 1, 0, CAST(N'2018-01-23 00:21:44.137' AS DateTime), 3, CAST(N'2018-01-23 00:21:44.137' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (2, 1, N'Đội ngũ giảng viên', N'Đang cập nhật', N'Đang cập nhật', N'doi-ngu-giang-vien', N'giảng viên', N'Đội ngũ giảng viên', 0, 2, 1, 1, 0, CAST(N'2018-01-23 00:22:19.980' AS DateTime), 3, CAST(N'2018-01-23 00:22:19.980' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (3, 1, N'Đánh giá của học viên về JHL', N'Đang cập nhật', N'Đang cập nhật', N'danh-gia-cua-hoc-vien-ve-jhl', NULL, NULL, 0, 3, 1, 1, 0, CAST(N'2018-01-23 00:22:55.410' AS DateTime), 3, CAST(N'2018-01-23 00:22:55.410' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (4, 1, N'Giới thiệu các khóa học', N'Đang cập nhật', N'Đang cập nhật', N'gioi-thieu-cac-khoa-hoc', N'cac khoa hoc, khoa hoc tieng nhat', NULL, 0, 1, 1, 1, 0, CAST(N'2018-01-23 00:26:26.760' AS DateTime), 3, CAST(N'2018-01-23 00:26:26.760' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (5, 1, N'Lịch khai giảng', N'Ðang cập nhật...', N'Ðang cập nhật...', N'lich-khai-giang', N'khai giảng', NULL, 0, 1, 1, 1, 0, CAST(N'2018-01-23 07:28:46.467' AS DateTime), 3, CAST(N'2018-01-23 07:28:46.467' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (6, 1, N'Trường liên kết', N'Ðang cập nhật...', N'Ðang cập nhật...', N'truong-lien-ket', N'đối tác', NULL, 0, 2, 1, 1, 0, CAST(N'2018-01-23 07:29:37.107' AS DateTime), 3, CAST(N'2018-01-23 07:29:37.107' AS DateTime), 3)
INSERT [dbo].[Page] ([ID], [PageImage], [Title], [Description], [Body], [MetaTitle], [MetaKeywords], [MetaDescriptions], [ViewCount], [DisplayOrder], [ShowOnHome], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (7, 1, N'Liên hệ', N'Ðang cập nhật...', N'Ðang cập nhật...', N'lien-he', N'thông tin liên hệ', NULL, 0, 3, 1, 1, 0, CAST(N'2018-01-23 07:30:02.493' AS DateTime), 3, CAST(N'2018-01-23 07:30:02.493' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Page] OFF
SET IDENTITY_INSERT [dbo].[Statistics] ON 

INSERT [dbo].[Statistics] ([ID], [IP], [Visited]) VALUES (1, N'10.16.150.83', CAST(N'2018-01-23 00:21:05.103' AS DateTime))
INSERT [dbo].[Statistics] ([ID], [IP], [Visited]) VALUES (2, N'10.16.150.83', CAST(N'2018-01-23 00:21:09.403' AS DateTime))
INSERT [dbo].[Statistics] ([ID], [IP], [Visited]) VALUES (3, N'10.16.150.83', CAST(N'2018-01-23 00:21:10.357' AS DateTime))
INSERT [dbo].[Statistics] ([ID], [IP], [Visited]) VALUES (4, N'10.16.150.83', CAST(N'2018-01-23 00:21:12.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[Statistics] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [TagName], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (1, N'Du học', 1, 0, CAST(N'2018-01-23 00:19:27.137' AS DateTime), 3, CAST(N'2018-01-23 00:19:27.137' AS DateTime), 3)
INSERT [dbo].[Tag] ([ID], [TagName], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (2, N'Nhật Bản', 1, 0, CAST(N'2018-01-23 00:19:38.553' AS DateTime), 3, CAST(N'2018-01-23 00:19:38.553' AS DateTime), 3)
INSERT [dbo].[Tag] ([ID], [TagName], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (3, N'Đào tạo cử nhân', 1, 0, CAST(N'2018-01-23 00:20:20.683' AS DateTime), 3, CAST(N'2018-01-23 00:20:20.683' AS DateTime), 3)
INSERT [dbo].[Tag] ([ID], [TagName], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (4, N'Du học Nhật Bản', 1, 0, CAST(N'2018-01-23 00:20:35.053' AS DateTime), 3, CAST(N'2018-01-23 00:20:35.053' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (3, N'jhl', N'jhl', N'JHL 1', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (4, N'jhl2', N'jhl', N'JHL 2', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'0978785678', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (5, N'jhl3', N'jhl', N'JHL 3', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (6, N'jhl4', N'jhl', N'JHL 4', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (7, N'jhl5', N'jhl', N'JHL 5', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (8, N'jhl6', N'jhl', N'JHL 6', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (9, N'jhl7', N'jhl', N'JHL 7', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (10, N'jhl8', N'jhl', N'JHL 8', N'Admin', CAST(N'1994-12-11' AS Date), N'Name', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (11, N'jhl9', N'jhl', N'JHL 9', N'Admin', CAST(N'1994-12-11' AS Date), NULL, N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 23:20:37.390' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (12, N'jhl10', N'jhl', N'JHL 10', N'Admin', CAST(N'1994-12-11' AS Date), NULL, N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 1, 3, N'Không', 1, 0, CAST(N'2018-01-20 03:14:07.610' AS DateTime), 3, CAST(N'2018-01-20 23:20:44.983' AS DateTime), 3)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (13, N'jhl11', N'jhl', N'JHL 11', N'Admin', CAST(N'1994-12-11' AS Date), N'Nam', N'Diễn Châu, Nghệ An', N'01676084166', N'nguyenthanhdat.dcna@gmail.com', 2, 3, N'Không', 0, 0, NULL, NULL, CAST(N'2018-01-21 00:04:15.810' AS DateTime), NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [LastName], [FirstName], [BirthDate], [Gender], [Address], [Phone], [Email], [Photo], [Attempt], [Notes], [Active], [Deleted], [Created], [CreatedBy], [Modified], [ModifiedBy]) VALUES (1004, N'jhl12', N'jhl12', N'Nguyễn', N'Đạt', CAST(N'1991-01-01' AS Date), N'Nữ', N'Phường Phương Canh, Quận Nam Từ Liêm', N'01672104167', N'meodc94@gmail.com', 1, 3, N'Không', 0, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_category_categoryname]    Script Date: 1/23/2018 8:10:46 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [uq_category_categoryname] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_tag_tagname]    Script Date: 1/23/2018 8:10:46 AM ******/
ALTER TABLE [dbo].[Tag] ADD  CONSTRAINT [uq_tag_tagname] UNIQUE NONCLUSTERED 
(
	[TagName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_user_username]    Script Date: 1/23/2018 8:10:46 AM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [uq_user_username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF__Comment__Content__7C4F7684]  DEFAULT (N'Ðang cập nhật...') FOR [Content]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [IsReaded]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Config] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [DF__Course__Descript__3F115E1A]  DEFAULT (N'Ðang cập nhật...') FOR [Description]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [DF__Course__Detail__40058253]  DEFAULT (N'Ðang cập nhật...') FOR [Detail]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (getdate()) FOR [Loged]
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF__Post__Descriptio__30F848ED]  DEFAULT (N'Ðang cập nhật...') FOR [Description]
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF__Post__Detail__31EC6D26]  DEFAULT (N'Ðang cập nhật...') FOR [Detail]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PostTag] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[PostTag] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PostTag] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Slider] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [fk_advertisement_image] FOREIGN KEY([AdvertisementImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [fk_advertisement_image]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [fk_advertisement_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [fk_advertisement_user1]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [fk_advertisement_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [fk_advertisement_user2]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_category_category1] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_category_category1]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_category_image] FOREIGN KEY([CategoryImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_category_image]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_category_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_category_user1]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fk_category_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fk_category_user2]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [fk_comment_post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [fk_comment_user1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [fk_comment_user2]
GO
ALTER TABLE [dbo].[Config]  WITH CHECK ADD  CONSTRAINT [fk_config_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Config] CHECK CONSTRAINT [fk_config_user1]
GO
ALTER TABLE [dbo].[Config]  WITH CHECK ADD  CONSTRAINT [fk_config_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Config] CHECK CONSTRAINT [fk_config_user2]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CourseCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CourseCategory] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CourseCategory]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [fk_course_image] FOREIGN KEY([CourseImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [fk_course_image]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [fk_course_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [fk_course_user1]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [fk_course_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [fk_course_user2]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_CourseCategory] FOREIGN KEY([ParentID])
REFERENCES [dbo].[CourseCategory] ([ID])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_CourseCategory]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_Image] FOREIGN KEY([CategoryImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_Image]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_User]
GO
ALTER TABLE [dbo].[CourseCategory]  WITH CHECK ADD  CONSTRAINT [FK_CourseCategory_User1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CourseCategory] CHECK CONSTRAINT [FK_CourseCategory_User1]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [fk_log_user1] FOREIGN KEY([LogedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [fk_log_user1]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [fk_page_image] FOREIGN KEY([PageImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [fk_page_image]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [fk_page_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [fk_page_user1]
GO
ALTER TABLE [dbo].[Page]  WITH CHECK ADD  CONSTRAINT [fk_page_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Page] CHECK CONSTRAINT [fk_page_user2]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [fk_post_category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [fk_post_category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [fk_post_image] FOREIGN KEY([PostImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [fk_post_image]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [fk_post_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [fk_post_user1]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [fk_post_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [fk_post_user2]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [fk_posttag_product] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([ID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [fk_posttag_product]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [fk_posttag_tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [fk_posttag_tag]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [fk_posttag_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [fk_posttag_user1]
GO
ALTER TABLE [dbo].[PostTag]  WITH CHECK ADD  CONSTRAINT [fk_posttag_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[PostTag] CHECK CONSTRAINT [fk_posttag_user2]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [fk_slider_image] FOREIGN KEY([SliderImage])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [fk_slider_image]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [fk_slider_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [fk_slider_user1]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [fk_slider_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [fk_slider_user2]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [fk_tag_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [fk_tag_user1]
GO
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [fk_tag_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [fk_tag_user2]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [fk_user_image] FOREIGN KEY([Photo])
REFERENCES [dbo].[Image] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [fk_user_image]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [fk_user_user1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [fk_user_user1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [fk_user_user2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [fk_user_user2]
GO
USE [master]
GO
ALTER DATABASE [jhl_db] SET  READ_WRITE 
GO
