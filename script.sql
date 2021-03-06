USE [master]
GO
/****** Object:  Database [UniversityDB]    Script Date: 2/16/2016 12:55:13 AM ******/
CREATE DATABASE [UniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UniversityDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UniversityDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UniversityDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UniversityDB]
GO
/****** Object:  Table [dbo].[t_AllocateClassRoom]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](6) NOT NULL,
	[AllocationStatus] [bit] NULL,
 CONSTRAINT [PK_t_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_course]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Credit] [decimal](18, 2) NULL,
	[Description] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[SemesterId] [int] NULL,
	[TeacherName] [varchar](50) NULL,
 CONSTRAINT [PK_t_course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_courseassign]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_courseassign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[TeacherId] [int] NULL,
	[Credit] [decimal](18, 2) NULL,
	[CourseId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_t_courseassign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_day]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_department]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_t_department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_designation]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_t_designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_EnrollInCourse]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_EnrollInCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsStudentActive] [bit] NULL,
 CONSTRAINT [PK_t_EnrollInCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_Grade]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_t_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_room]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_semester]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_t_semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_student]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[Date] [date] NULL,
	[Address] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[RegNo] [varchar](50) NULL,
 CONSTRAINT [PK_t_student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_StudentResult]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_t_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_teacher]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[email] [varchar](50) NULL,
	[contactNo] [varchar](50) NULL,
	[designationId] [int] NULL,
	[departmentId] [int] NULL,
	[credit] [decimal](18, 2) NULL,
	[remaining] [decimal](18, 2) NULL,
 CONSTRAINT [PK_t_teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[t_courses]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[t_courses] as select c.DepartmentId,c.Code,C.Name,s.Name as Semester,c.TeacherName from t_course as c join t_semester as s on c.SemesterId = s.Id

GO
/****** Object:  View [dbo].[ViewClassSchedule]    Script Date: 2/16/2016 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ViewClassSchedule]
as

SELECT        d.Id AS DepartmentId, c.Code, c.Name, COALESCE (dbo.t_room.RoomName, 'Not sheduled yet') AS RoomName, COALESCE (dbo.t_Day.DayName, 'Not sheduled yet') AS DayName, CASE WHEN r.StartTime IS NULL 
                         THEN '00:00:00.0000000' ELSE CONVERT(varchar, r.StartTime) END AS StartTime, CASE WHEN r.EndTime IS NULL THEN '00:00:00.0000000' ELSE CONVERT(varchar, r.EndTime) END AS EndTime
FROM            dbo.t_course AS c LEFT OUTER JOIN
                         dbo.t_AllocateClassRoom AS r ON r.CourseId = c.Id LEFT OUTER JOIN
                         dbo.t_room ON r.RoomId = dbo.t_Room.Id LEFT OUTER JOIN
                         dbo.t_day ON r.DayId = dbo.t_Day.Id LEFT OUTER JOIN
                         dbo.t_department as d on c.DepartmentId=d.Id
GO
SET IDENTITY_INSERT [dbo].[t_AllocateClassRoom] ON 

INSERT [dbo].[t_AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (4, 1, 10, 1, 1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[t_AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (18, 10, 2, 1, 1, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 1)
INSERT [dbo].[t_AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (19, 14, 2, 2, 1, CAST(N'01:30:00' AS Time), CAST(N'02:30:00' AS Time), 1)
INSERT [dbo].[t_AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [EndTime], [AllocationStatus]) VALUES (20, 11, 2, 1, 1, CAST(N'01:30:00' AS Time), CAST(N'02:30:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[t_AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[t_course] ON 

INSERT [dbo].[t_course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [TeacherName]) VALUES (10, N'CSE 101', N'Programming C', CAST(5.00 AS Decimal(18, 2)), N'Programming Language', 1, 1, N'Samiul Ehsan')
INSERT [dbo].[t_course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [TeacherName]) VALUES (11, N'CSE 102', N'Java', CAST(3.00 AS Decimal(18, 2)), N'Progragmming Language', 1, 2, N'Junaye')
INSERT [dbo].[t_course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [TeacherName]) VALUES (12, N'CSE 103', N'Asp.Net', CAST(3.00 AS Decimal(18, 2)), N'Programming Language', 1, 1, N'Samiul Ehsan')
INSERT [dbo].[t_course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [TeacherName]) VALUES (13, N'EEE 101', N'Electronics', CAST(3.00 AS Decimal(18, 2)), N'asdf', 2, 1, N'Not Assigned Yet')
INSERT [dbo].[t_course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [TeacherName]) VALUES (14, N'EEE 102', N'Electrical Device', CAST(3.00 AS Decimal(18, 2)), N'Physics', 2, 1, N'Not Assigned Yet')
SET IDENTITY_INSERT [dbo].[t_course] OFF
SET IDENTITY_INSERT [dbo].[t_courseassign] ON 

INSERT [dbo].[t_courseassign] ([Id], [DepartmentId], [TeacherId], [Credit], [CourseId], [IsActive]) VALUES (24, 1, 10, CAST(5.00 AS Decimal(18, 2)), 10, 0)
INSERT [dbo].[t_courseassign] ([Id], [DepartmentId], [TeacherId], [Credit], [CourseId], [IsActive]) VALUES (25, 1, 11, CAST(3.00 AS Decimal(18, 2)), 11, 0)
INSERT [dbo].[t_courseassign] ([Id], [DepartmentId], [TeacherId], [Credit], [CourseId], [IsActive]) VALUES (26, 1, 11, CAST(3.00 AS Decimal(18, 2)), 12, 0)
INSERT [dbo].[t_courseassign] ([Id], [DepartmentId], [TeacherId], [Credit], [CourseId], [IsActive]) VALUES (27, 1, 12, CAST(5.00 AS Decimal(18, 2)), 10, 0)
INSERT [dbo].[t_courseassign] ([Id], [DepartmentId], [TeacherId], [Credit], [CourseId], [IsActive]) VALUES (28, 1, 12, CAST(3.00 AS Decimal(18, 2)), 12, 0)
SET IDENTITY_INSERT [dbo].[t_courseassign] OFF
SET IDENTITY_INSERT [dbo].[t_day] ON 

INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (1, N'Sunday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (2, N'Monday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (3, N'Tuesday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (4, N'Wednesday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (5, N'Thursday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (6, N'Friday')
INSERT [dbo].[t_day] ([Id], [DayName]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [dbo].[t_day] OFF
SET IDENTITY_INSERT [dbo].[t_department] ON 

INSERT [dbo].[t_department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[t_department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical,Electronics Engineering')
INSERT [dbo].[t_department] ([Id], [Code], [Name]) VALUES (3, N'CEN', N'Civil Engineering ')
INSERT [dbo].[t_department] ([Id], [Code], [Name]) VALUES (4, N'BBA', N'Bachelor of Bussiness Acounting')
INSERT [dbo].[t_department] ([Id], [Code], [Name]) VALUES (5, N'ETE', N'Electrical and Telecom Engineering')
SET IDENTITY_INSERT [dbo].[t_department] OFF
SET IDENTITY_INSERT [dbo].[t_designation] ON 

INSERT [dbo].[t_designation] ([Id], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[t_designation] ([Id], [Name]) VALUES (2, N'Senior Lecturer')
INSERT [dbo].[t_designation] ([Id], [Name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[t_designation] ([Id], [Name]) VALUES (4, N'Associate Professor')
SET IDENTITY_INSERT [dbo].[t_designation] OFF
SET IDENTITY_INSERT [dbo].[t_EnrollInCourse] ON 

INSERT [dbo].[t_EnrollInCourse] ([Id], [StudentId], [CourseId], [Date], [IsStudentActive]) VALUES (4, 1, 10, CAST(N'2016-02-10' AS Date), 0)
INSERT [dbo].[t_EnrollInCourse] ([Id], [StudentId], [CourseId], [Date], [IsStudentActive]) VALUES (5, 2, 11, CAST(N'2016-02-10' AS Date), 0)
INSERT [dbo].[t_EnrollInCourse] ([Id], [StudentId], [CourseId], [Date], [IsStudentActive]) VALUES (6, 2, 10, CAST(N'2016-06-23' AS Date), 0)
INSERT [dbo].[t_EnrollInCourse] ([Id], [StudentId], [CourseId], [Date], [IsStudentActive]) VALUES (7, 1, 11, CAST(N'2016-02-09' AS Date), 1)
SET IDENTITY_INSERT [dbo].[t_EnrollInCourse] OFF
SET IDENTITY_INSERT [dbo].[t_Grade] ON 

INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (1, N'A+')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (2, N'A')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (3, N'A-')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (4, N'B+')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (5, N'B')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (6, N'B-')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (7, N'C+')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (8, N'C')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (9, N'C-')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (10, N'D+')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (11, N'D')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (12, N'D-')
INSERT [dbo].[t_Grade] ([Id], [Grade]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[t_Grade] OFF
SET IDENTITY_INSERT [dbo].[t_room] ON 

INSERT [dbo].[t_room] ([Id], [RoomName]) VALUES (1, N'R No-101')
INSERT [dbo].[t_room] ([Id], [RoomName]) VALUES (2, N'R No-102')
INSERT [dbo].[t_room] ([Id], [RoomName]) VALUES (3, N'R No-202')
INSERT [dbo].[t_room] ([Id], [RoomName]) VALUES (4, N'R No-801')
SET IDENTITY_INSERT [dbo].[t_room] OFF
SET IDENTITY_INSERT [dbo].[t_semester] ON 

INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (1, N'1st Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (2, N'2nd Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (3, N'3rd Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (4, N'4th Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (5, N'5th Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (6, N'6th Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (7, N'7th Semester')
INSERT [dbo].[t_semester] ([Id], [Name]) VALUES (8, N'8th Semester')
SET IDENTITY_INSERT [dbo].[t_semester] OFF
SET IDENTITY_INSERT [dbo].[t_student] ON 

INSERT [dbo].[t_student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (1, N'abul', N'abul@gmail.com', N'1234', CAST(N'2016-02-10' AS Date), N'asgdajh', 1, N'CSE-2016-001')
INSERT [dbo].[t_student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (2, N'Nayeem', N'ndn@gmail.com', N'+919836656119', CAST(N'2016-02-15' AS Date), N'AG-116,1st floor,talbagan,krishnapur,kolkata', 1, N'CSE-2016-2')
INSERT [dbo].[t_student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (6, N'babul', N'babul@gmail.com', N'31627357', CAST(N'2016-03-10' AS Date), N'ahsdaj', 2, N'EEE-2016-1')
INSERT [dbo].[t_student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (7, N'kalam', N'kajolmollick@gmail.com', N'12987', CAST(N'2016-02-09' AS Date), N'asdkalsjdak', 2, N'EEE-2016-2')
SET IDENTITY_INSERT [dbo].[t_student] OFF
SET IDENTITY_INSERT [dbo].[t_StudentResult] ON 

INSERT [dbo].[t_StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (2, 1, 10, N'A+')
INSERT [dbo].[t_StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (5, 7, 13, N'C+')
SET IDENTITY_INSERT [dbo].[t_StudentResult] OFF
SET IDENTITY_INSERT [dbo].[t_teacher] ON 

INSERT [dbo].[t_teacher] ([Id], [name], [address], [email], [contactNo], [designationId], [departmentId], [credit], [remaining]) VALUES (10, N'Zakir', N'Dhaka', N'zakir@gmil.com', N'1234', 1, 1, CAST(2.00 AS Decimal(18, 2)), CAST(-3.00 AS Decimal(18, 2)))
INSERT [dbo].[t_teacher] ([Id], [name], [address], [email], [contactNo], [designationId], [departmentId], [credit], [remaining]) VALUES (11, N'Junaye', N'Dhaka', N'j@gmail.com', N'1234', 1, 1, CAST(2.00 AS Decimal(18, 2)), CAST(-4.00 AS Decimal(18, 2)))
INSERT [dbo].[t_teacher] ([Id], [name], [address], [email], [contactNo], [designationId], [departmentId], [credit], [remaining]) VALUES (12, N'Samiul Ehsan', N'H#69,R#04,mohammadia housing society
Mohammadpur', N'samiul.rocking@gmail.com', N'+8801675270021', 4, 1, CAST(20.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[t_teacher] OFF
USE [master]
GO
ALTER DATABASE [UniversityDB] SET  READ_WRITE 
GO
