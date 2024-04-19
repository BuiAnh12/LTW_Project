USE [master]
GO
/****** Object:  Database [InstitutionManagement]    Script Date: 4/18/2024 8:58:29 PM ******/
CREATE DATABASE [InstitutionManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InstitutionManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InstitutionManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InstitutionManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InstitutionManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InstitutionManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InstitutionManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InstitutionManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InstitutionManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InstitutionManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InstitutionManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InstitutionManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [InstitutionManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InstitutionManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InstitutionManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InstitutionManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InstitutionManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InstitutionManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InstitutionManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InstitutionManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InstitutionManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InstitutionManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InstitutionManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InstitutionManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InstitutionManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InstitutionManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InstitutionManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InstitutionManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InstitutionManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InstitutionManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InstitutionManagement] SET  MULTI_USER 
GO
ALTER DATABASE [InstitutionManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InstitutionManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InstitutionManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InstitutionManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InstitutionManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InstitutionManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InstitutionManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [InstitutionManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InstitutionManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[discription] [text] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mainTeacherId] [int] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[supervisorId] [int] NULL,
	[groupDetail] [text] NULL,
	[officeId] [int] NULL,
	[courseId] [int] NULL,
	[format] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupDetail]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupDetail](
	[groupId] [int] NULL,
	[studentId] [int] NULL,
	[status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupSchedue]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupSchedue](
	[groupId] [int] NOT NULL,
	[lessonId] [int] NOT NULL,
	[occurDate] [date] NULL,
	[teacherId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupId] ASC,
	[lessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NULL,
	[detail] [text] NULL,
	[lessonNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[location] [nvarchar](100) NULL,
	[directorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[age] [int] NULL,
	[parentName] [nvarchar](50) NULL,
	[parenetEmail] [nvarchar](50) NULL,
	[parenetPhone] [nvarchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/18/2024 8:58:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nvarchar](50) NULL,
	[roleId] [int] NULL,
	[officeId] [int] NULL,
	[accountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password]) VALUES (1, N'tom', N'123')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (2, N'finn', N'123')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (3, N'andrew', N'123')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (4, N'ben', N'123')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (5, N'hanna', N'123')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (6, N'han', N'123')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (1, N'PTSY1', N'Python Start Year 1', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (2, N'PTSY2', N'Python Start Year 2 ', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (3, N'PTPY1', N'Python Pro Year 1', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (4, N'PTPY2', N'Python Pro Year 2', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (5, N'GD', N'Game Development', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (6, N'VP', N'Visual Programming', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (7, N'UGD', N'Unity Game Development', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (8, N'WDY1', N'Web Development Year 1', 1)
INSERT [dbo].[Course] ([id], [name], [discription], [status]) VALUES (9, N'WDY2', N'Web Development Year 2 ', 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([id], [mainTeacherId], [startDate], [endDate], [supervisorId], [groupDetail], [officeId], [courseId], [format]) VALUES (1, 2, NULL, NULL, 3, NULL, 2, 1, 1)
INSERT [dbo].[Group] ([id], [mainTeacherId], [startDate], [endDate], [supervisorId], [groupDetail], [officeId], [courseId], [format]) VALUES (2, 5, NULL, NULL, 6, NULL, 3, 6, 1)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[GroupDetail] ([groupId], [studentId], [status]) VALUES (1, 1, 1)
INSERT [dbo].[GroupDetail] ([groupId], [studentId], [status]) VALUES (1, 2, 1)
INSERT [dbo].[GroupDetail] ([groupId], [studentId], [status]) VALUES (2, 3, 1)
GO
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 1, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 2, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 3, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 4, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 5, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 6, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 7, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (1, 8, NULL, 2)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 41, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 42, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 43, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 44, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 45, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 46, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 47, NULL, 5)
INSERT [dbo].[GroupSchedue] ([groupId], [lessonId], [occurDate], [teacherId]) VALUES (2, 48, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (1, 1, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (2, 1, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (3, 1, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (4, 1, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (5, 1, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (6, 1, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (7, 1, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (8, 1, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (9, 2, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (10, 2, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (11, 2, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (12, 2, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (13, 2, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (14, 2, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (15, 2, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (16, 2, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (17, 3, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (18, 3, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (19, 3, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (20, 3, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (21, 3, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (22, 3, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (23, 3, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (24, 3, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (25, 4, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (26, 4, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (27, 4, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (28, 4, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (29, 4, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (30, 4, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (31, 4, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (32, 4, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (33, 5, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (34, 5, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (35, 5, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (36, 5, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (37, 5, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (38, 5, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (39, 5, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (40, 5, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (41, 6, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (42, 6, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (43, 6, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (44, 6, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (45, 6, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (46, 6, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (47, 6, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (48, 6, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (49, 7, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (50, 7, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (51, 7, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (52, 7, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (53, 7, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (54, 7, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (55, 7, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (56, 7, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (57, 8, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (58, 8, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (59, 8, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (60, 8, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (61, 8, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (62, 8, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (63, 8, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (64, 8, N'Lesson 8', 8)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (65, 9, N'Lesson 1', 1)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (66, 9, N'Lesson 2', 2)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (67, 9, N'Lesson 3', 3)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (68, 9, N'Lesson 4', 4)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (69, 9, N'Lesson 5', 5)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (70, 9, N'Lesson 6', 6)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (71, 9, N'Lesson 7', 7)
INSERT [dbo].[Lesson] ([id], [courseId], [detail], [lessonNo]) VALUES (72, 9, N'Lesson 8', 8)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
INSERT [dbo].[Office] ([id], [name], [location], [directorId]) VALUES (1, N'PXL', N'Phan Xich Long', 2)
INSERT [dbo].[Office] ([id], [name], [location], [directorId]) VALUES (2, N'NVH', N'Nguyen Van Huong', 2)
INSERT [dbo].[Office] ([id], [name], [location], [directorId]) VALUES (3, N'NLB', N'Nguyen Luong Bang', 6)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [roleName]) VALUES (3, N'Admin')
INSERT [dbo].[Role] ([id], [roleName]) VALUES (4, N'Teacher')
INSERT [dbo].[Role] ([id], [roleName]) VALUES (5, N'Sale')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [name], [age], [parentName], [parenetEmail], [parenetPhone]) VALUES (1, N'Michal', 10, N'Nick', N'nick@gmail.com', N'0909124231')
INSERT [dbo].[Student] ([id], [name], [age], [parentName], [parenetEmail], [parenetPhone]) VALUES (2, N'Anna', 12, N'Lee', N'lee@gmail.com', N'0909124122')
INSERT [dbo].[Student] ([id], [name], [age], [parentName], [parenetEmail], [parenetPhone]) VALUES (3, N'Minh', 7, N'Ngoc', N'ngocnn@gmail.com', N'0914092211')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (2, N'Tom Bui', N'0909385145', N'tombui@gmail.com', 4, 1, 1)
INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (3, N'Finn Tran', N'0909123123', NULL, 3, 2, 2)
INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (4, N'Andrew Phan', N'0908123123', NULL, 5, 1, 3)
INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (5, N'Ben Nguyen', NULL, NULL, 4, 3, 4)
INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (6, N'Hannah Nguyen', NULL, NULL, 3, 3, 5)
INSERT [dbo].[User] ([id], [name], [phone], [email], [roleId], [officeId], [accountId]) VALUES (7, N'Han Tran', NULL, NULL, 5, 2, 6)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC572E694B580]    Script Date: 4/18/2024 8:58:29 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD FOREIGN KEY([mainTeacherId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD FOREIGN KEY([officeId])
REFERENCES [dbo].[Office] ([id])
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD FOREIGN KEY([supervisorId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[GroupDetail]  WITH CHECK ADD FOREIGN KEY([groupId])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[GroupDetail]  WITH CHECK ADD FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[GroupSchedue]  WITH CHECK ADD FOREIGN KEY([groupId])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[GroupSchedue]  WITH CHECK ADD FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([id])
GO
ALTER TABLE [dbo].[GroupSchedue]  WITH CHECK ADD FOREIGN KEY([teacherId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD FOREIGN KEY([directorId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([officeId])
REFERENCES [dbo].[Office] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
GO
USE [master]
GO
ALTER DATABASE [InstitutionManagement] SET  READ_WRITE 
GO
