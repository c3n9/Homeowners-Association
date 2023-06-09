USE [master]
GO
/****** Object:  Database [HomeownersAssociation]    Script Date: 22.05.2023 15:44:53 ******/
CREATE DATABASE [HomeownersAssociation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeownersAssociation', FILENAME = N'D:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeownersAssociation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeownersAssociation_log', FILENAME = N'D:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\HomeownersAssociation_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HomeownersAssociation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeownersAssociation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeownersAssociation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeownersAssociation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeownersAssociation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeownersAssociation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeownersAssociation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeownersAssociation] SET  MULTI_USER 
GO
ALTER DATABASE [HomeownersAssociation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeownersAssociation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeownersAssociation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeownersAssociation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeownersAssociation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeownersAssociation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeownersAssociation', N'ON'
GO
ALTER DATABASE [HomeownersAssociation] SET QUERY_STORE = ON
GO
ALTER DATABASE [HomeownersAssociation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HomeownersAssociation]
GO
/****** Object:  Table [dbo].[Arrear]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[UtilitiesId] [int] NOT NULL,
	[Sum] [money] NOT NULL,
	[Date] [date] NOT NULL,
	[HousingId] [int] NOT NULL,
 CONSTRAINT [PK_ArrearUtilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Condition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counter]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MeterReadings] [decimal](10, 3) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[UtilitiesId] [int] NOT NULL,
	[HousingId] [int] NOT NULL,
 CONSTRAINT [PK_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Housing]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Housing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Square] [decimal](10, 2) NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[OwnerId] [int] NOT NULL,
	[AppartmentNumber] [int] NULL,
	[HouseNumber] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
 CONSTRAINT [PK_Housing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[PassportSeries] [nvarchar](4) NOT NULL,
	[PassportNumber] [nvarchar](6) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Sum] [money] NOT NULL,
	[ResidentId] [int] NOT NULL,
	[UtilitiesId] [int] NOT NULL,
	[HousingId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentUtilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resident]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[HousingId] [int] NULL,
 CONSTRAINT [PK_Resident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilities]    Script Date: 22.05.2023 15:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[RatePerMonth] [money] NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Utilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Arrear] ON 

INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (41, 81, 1, 2000.0000, CAST(N'2023-04-24' AS Date), 2)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (42, 82, 2, 3000.0000, CAST(N'2023-04-25' AS Date), 3)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (43, 83, 3, 234.0000, CAST(N'2023-04-26' AS Date), 4)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (44, 84, 4, 342.0000, CAST(N'2023-04-27' AS Date), 5)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (45, 85, 5, 2435.0000, CAST(N'2023-04-28' AS Date), 6)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (46, 86, 6, 3544.0000, CAST(N'2023-04-29' AS Date), 7)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (47, 87, 7, 535.0000, CAST(N'2023-04-30' AS Date), 9)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (48, 88, 8, 5354.0000, CAST(N'2023-05-01' AS Date), 10)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (49, 89, 9, 5445.0000, CAST(N'2023-05-02' AS Date), 11)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (50, 90, 10, 456.0000, CAST(N'2023-05-03' AS Date), 12)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (51, 91, 1, 435.0000, CAST(N'2023-05-04' AS Date), 13)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (52, 92, 2, 354.0000, CAST(N'2023-05-05' AS Date), 14)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (53, 93, 3, 355.0000, CAST(N'2023-05-06' AS Date), 15)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (54, 94, 4, 4545.0000, CAST(N'2023-05-07' AS Date), 16)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (55, 95, 5, 3455.0000, CAST(N'2023-05-08' AS Date), 17)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (56, 96, 6, 435.0000, CAST(N'2023-05-09' AS Date), 18)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (57, 97, 7, 5354.0000, CAST(N'2023-05-10' AS Date), 19)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (58, 98, 8, 3544.0000, CAST(N'2023-05-11' AS Date), 20)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (59, 99, 9, 324.0000, CAST(N'2023-05-12' AS Date), 21)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (60, 100, 10, 235.0000, CAST(N'2023-05-13' AS Date), 22)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (61, 101, 1, 3554.0000, CAST(N'2023-05-14' AS Date), 23)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (62, 102, 2, 4534.0000, CAST(N'2023-05-15' AS Date), 24)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (63, 103, 3, 345.0000, CAST(N'2023-05-16' AS Date), 25)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (64, 104, 4, 3455.0000, CAST(N'2023-05-17' AS Date), 26)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (65, 105, 5, 634.0000, CAST(N'2023-05-18' AS Date), 27)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (66, 106, 6, 4365.0000, CAST(N'2023-05-19' AS Date), 28)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (67, 107, 7, 456.0000, CAST(N'2023-05-20' AS Date), 29)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (68, 108, 8, 646.0000, CAST(N'2023-05-21' AS Date), 30)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (69, 109, 9, 566.0000, CAST(N'2023-05-22' AS Date), 31)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (70, 110, 10, 4665.0000, CAST(N'2023-05-23' AS Date), 32)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (71, 111, 1, 6454.0000, CAST(N'2023-05-24' AS Date), 33)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (72, 112, 2, 5554.0000, CAST(N'2023-05-25' AS Date), 34)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (73, 113, 3, 4556.0000, CAST(N'2023-05-26' AS Date), 35)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (74, 114, 4, 4654.0000, CAST(N'2023-05-27' AS Date), 36)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (75, 115, 5, 4564.0000, CAST(N'2023-05-28' AS Date), 37)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (76, 116, 6, 5466.0000, CAST(N'2023-05-29' AS Date), 39)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (77, 117, 7, 4564.0000, CAST(N'2023-05-30' AS Date), 40)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (78, 118, 8, 455.0000, CAST(N'2023-05-31' AS Date), 41)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (79, 119, 9, 456.0000, CAST(N'2023-06-01' AS Date), 41)
INSERT [dbo].[Arrear] ([Id], [OwnerId], [UtilitiesId], [Sum], [Date], [HousingId]) VALUES (80, 120, 10, 546.0000, CAST(N'2023-06-02' AS Date), 40)
SET IDENTITY_INSERT [dbo].[Arrear] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Казань')
INSERT [dbo].[City] ([Id], [Name]) VALUES (2, N'Москва')
INSERT [dbo].[City] ([Id], [Name]) VALUES (3, N'Нижний Новгород')
INSERT [dbo].[City] ([Id], [Name]) VALUES (4, N'Тольятти')
INSERT [dbo].[City] ([Id], [Name]) VALUES (5, N'Берлин')
INSERT [dbo].[City] ([Id], [Name]) VALUES (6, N'Нижнекамск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (7, N'Владивосток')
INSERT [dbo].[City] ([Id], [Name]) VALUES (8, N'Хабаровск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (9, N'Железногорск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (10, N'Нефтекамск')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Condition] ON 

INSERT [dbo].[Condition] ([Id], [Name]) VALUES (1, N'Хорошее')
INSERT [dbo].[Condition] ([Id], [Name]) VALUES (2, N'Требуется легкий ремонт')
INSERT [dbo].[Condition] ([Id], [Name]) VALUES (3, N'Плохое')
SET IDENTITY_INSERT [dbo].[Condition] OFF
GO
SET IDENTITY_INSERT [dbo].[Counter] ON 

INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (1, CAST(2344.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 1, 2)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (2, CAST(2344.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 2, 3)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (3, CAST(2344.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 3, 4)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (4, CAST(2344.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 4, 5)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (5, CAST(1234.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 5, 6)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (6, CAST(3245.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 6, 7)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (7, CAST(2435.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 7, 9)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (8, CAST(3245.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 8, 10)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (9, CAST(23442.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 9, 11)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (10, CAST(3424.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 10, 12)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (11, CAST(4245.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 1, 13)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (12, CAST(2454.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 2, 14)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (13, CAST(4525.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 3, 15)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (14, CAST(2452.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 4, 16)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (15, CAST(25245.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 5, 17)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (16, CAST(25255.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 6, 18)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (17, CAST(542452.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 7, 19)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (18, CAST(252552.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 8, 20)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (19, CAST(522554.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 9, 21)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (20, CAST(255454.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 10, 22)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (21, CAST(255245.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 1, 23)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (22, CAST(25542.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 2, 24)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (23, CAST(255254.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 3, 25)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (24, CAST(25254.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 4, 26)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (25, CAST(2545.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 5, 27)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (26, CAST(25524.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 6, 28)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (27, CAST(2565.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 7, 29)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (28, CAST(87578.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 8, 30)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (29, CAST(5688.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 9, 31)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (30, CAST(6578.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 10, 32)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (31, CAST(6878.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 1, 33)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (32, CAST(6758.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 2, 34)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (33, CAST(67887.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 3, 35)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (34, CAST(6787.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 4, 36)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (35, CAST(87685.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 5, 37)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (36, CAST(687786.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 6, 39)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (37, CAST(6778.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 7, 40)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (38, CAST(87667.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 8, 41)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (39, CAST(678768.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 9, 2)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (40, CAST(68768.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 10, 3)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (41, CAST(678687.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 1, 4)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (42, CAST(877876.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 2, 5)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (43, CAST(768787.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 3, 6)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (44, CAST(786678.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 4, 7)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (45, CAST(68776.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 5, 9)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (46, CAST(6787.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 6, 10)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (47, CAST(678876.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 7, 11)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (48, CAST(67878.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 8, 12)
INSERT [dbo].[Counter] ([Id], [MeterReadings], [ReleaseDate], [UtilitiesId], [HousingId]) VALUES (49, CAST(786786.000 AS Decimal(10, 3)), CAST(N'2023-05-22' AS Date), 9, 13)
SET IDENTITY_INSERT [dbo].[Counter] OFF
GO
SET IDENTITY_INSERT [dbo].[Housing] ON 

INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (2, CAST(100.00 AS Decimal(10, 2)), 4, 1, 5000000.0000, 81, 3, 4, 1)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (3, CAST(30.00 AS Decimal(10, 2)), 1, 1, 7000000.0000, 81, 24, 5, 3)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (4, CAST(36.00 AS Decimal(10, 2)), 2, 1, 3445420.0000, 81, 234, 6, 4)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (5, CAST(29.00 AS Decimal(10, 2)), 1, 1, 3556536.0000, 83, 235, 7, 5)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (6, CAST(61.00 AS Decimal(10, 2)), 3, 1, 3425325.0000, 84, 32, 8, 6)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (7, CAST(81.00 AS Decimal(10, 2)), 4, 1, 23453453.0000, 90, 42, 9, 7)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (9, CAST(49.00 AS Decimal(10, 2)), 2, 1, 4534543.0000, 120, 23, 11, 9)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (10, CAST(31.00 AS Decimal(10, 2)), 3, 1, 4535443.0000, 121, 24, 12, 10)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (11, CAST(47.00 AS Decimal(10, 2)), 1, 2, 3453443.0000, 122, 245, 13, 11)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (12, CAST(59.00 AS Decimal(10, 2)), 2, 2, 3443435.0000, 123, 23, 14, 12)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (13, CAST(84.00 AS Decimal(10, 2)), 3, 2, 3453342.0000, 124, 32, 15, 13)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (14, CAST(44.00 AS Decimal(10, 2)), 3, 2, 5675675.0000, 125, 12, 16, 14)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (15, CAST(37.00 AS Decimal(10, 2)), 1, 1, 56756675.0000, 126, 21, 17, 15)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (16, CAST(94.00 AS Decimal(10, 2)), 2, 1, 78578856.0000, 127, 31, 18, 16)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (17, CAST(83.00 AS Decimal(10, 2)), 3, 1, 7688645.0000, 128, 43, 19, 17)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (18, CAST(80.00 AS Decimal(10, 2)), 4, 1, 546787.0000, 129, 34, 20, 18)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (19, CAST(46.00 AS Decimal(10, 2)), 2, 1, 76856758.0000, 130, 13, 21, 19)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (20, CAST(93.00 AS Decimal(10, 2)), 1, 1, 65865868.0000, 131, 134, 22, 20)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (21, CAST(23.00 AS Decimal(10, 2)), 2, 1, 5675677.0000, 132, 43, 23, 21)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (22, CAST(71.00 AS Decimal(10, 2)), 3, 1, 5465465.0000, 133, 15, 24, 22)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (23, CAST(20.00 AS Decimal(10, 2)), 1, 3, 64545645.0000, 134, 16, 25, 23)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (24, CAST(84.00 AS Decimal(10, 2)), 2, 3, 45644565.0000, 135, 17, 26, 24)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (25, CAST(96.00 AS Decimal(10, 2)), 3, 3, 4565445.0000, 136, 18, 27, 25)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (26, CAST(48.00 AS Decimal(10, 2)), 4, 3, 466436554.0000, 137, 19, 28, 26)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (27, CAST(70.00 AS Decimal(10, 2)), 3, 3, 5464554.0000, 138, 20, 29, 27)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (28, CAST(90.00 AS Decimal(10, 2)), 2, 3, 45445.0000, 139, 21, 30, 28)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (29, CAST(55.00 AS Decimal(10, 2)), 1, 3, 456456.0000, 140, 22, 31, 29)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (30, CAST(87.00 AS Decimal(10, 2)), 2, 3, 46544.0000, 141, 23, 32, 30)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (31, CAST(61.00 AS Decimal(10, 2)), 3, 3, 43645654.0000, 142, 24, 33, 1)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (32, CAST(38.00 AS Decimal(10, 2)), 1, 3, 43436.0000, 143, 25, 34, 3)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (33, CAST(78.00 AS Decimal(10, 2)), 2, 1, 4454345.0000, 144, 26, 35, 3)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (34, CAST(77.00 AS Decimal(10, 2)), 3, 1, 4563454.0000, 145, 27, 36, 4)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (35, CAST(53.00 AS Decimal(10, 2)), 1, 1, 44346.0000, 146, 28, 37, 5)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (36, CAST(75.00 AS Decimal(10, 2)), 2, 1, 4346343.0000, 147, 29, 38, 6)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (37, CAST(56.00 AS Decimal(10, 2)), 3, 1, 643653465.0000, 148, 30, 39, 7)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (39, CAST(73.00 AS Decimal(10, 2)), 2, 1, 44564454.0000, 150, 32, 41, 9)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (40, CAST(27.00 AS Decimal(10, 2)), 2, 2, 446445.0000, 151, 33, 42, 10)
INSERT [dbo].[Housing] ([Id], [Square], [NumberOfRooms], [ConditionId], [Cost], [OwnerId], [AppartmentNumber], [HouseNumber], [StreetId]) VALUES (41, CAST(43.00 AS Decimal(10, 2)), 1, 1, 445645.0000, 152, 34, 43, 11)
SET IDENTITY_INSERT [dbo].[Housing] OFF
GO
SET IDENTITY_INSERT [dbo].[Owner] ON 

INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (81, N'Яковлева', N'Марина', N'Борисовна', N'3568', N'401958', N'40195845876', N'mwilson@hotmail.com', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (82, N'Колесников', N'Михаил', N'Витальевич', N'3174', N'458765', N'45876596829', N'bastian@live.com', CAST(N'2023-04-12' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (83, N'Игнатьев', N'Николай', N'Эдуардович', N'8599', N'596829', N'46484207837', N'pmint@att.net', CAST(N'2023-04-13' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (84, N'Киселева', N'Валерия', N'Владимировна', N'9249', N'464848', N'68243326021', N'gavollink@outlook.com', CAST(N'2023-04-14' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (85, N'Савин', N'Леонид', N'Николаевич', N'3759', N'207837', N'50260562000', N'shrapnull@optonline.net', CAST(N'2023-04-15' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (86, N'Калашников', N'Анатолий', N'Константинович', N'8105', N'682437', N'62049783501', N'willg@comcast.net', CAST(N'2023-04-16' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (87, N'Суворов', N'Александр', N'Дмитриевич', N'9825', N'326021', N'37526312709', N'bwcarty@yahoo.com', CAST(N'2023-04-17' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (88, N'Евсеев', N'Фёдор', N'Александрович', N'9952', N'502606', N'23229932503', N'lydia@me.com', CAST(N'2023-04-18' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (89, N'Алексеева', N'Маргарита', N'Максимовна', N'8391', N'562000', N'36745766621', N'janusfury@icloud.com', CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (90, N'Шаров', N'Алексей', N'Аркадиевич', N'6796', N'620491', N'65934546925', N'schwaang@verizon.net', CAST(N'2023-04-20' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (91, N'Прохоров', N'Андрей', N'Станиславович', N'3829', N'783501', N'10265868293', N'sakusha@aol.com', CAST(N'2023-04-21' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (92, N'Тетерин', N'Владислав', N'Романович', N'8263', N'375261', N'17346370180', N'mcrawfor@yahoo.com', CAST(N'2023-04-22' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (93, N'Галкин', N'Константин', N'Пётрович', N'8956', N'312709', N'22346612828', N'gavinls@mac.com', CAST(N'2023-04-23' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (94, N'Селиверстова', N'Полина', N'Витальевна', N'4093', N'232292', N'28740830861', N'hahsler@yahoo.ca', CAST(N'2023-04-24' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (95, N'Лихачева', N'Наталья', N'Юрьевна', N'5234', N'932503', N'26638214887', N'frikazoyd@yahoo.ca', CAST(N'2023-04-25' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (96, N'Фомина', N'Валерия', N'Евгеньевна', N'8573', N'367453', N'72719989358', N'punkis@icloud.com', CAST(N'2023-04-26' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (97, N'Трофимов', N'Игорь', N'Владимирович', N'7299', N'766621', N'58654244170', N'pmint@gmail.com', CAST(N'2023-04-27' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (98, N'Рогова', N'Людмила', N'Аркадиевна', N'3050', N'659348', N'31818947021', N'timlinux@icloud.com', CAST(N'2023-04-28' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (99, N'Кириллов', N'Валерий', N'Евгеньевич', N'4087', N'546925', N'54380426813', N'seanq@mac.com', CAST(N'2023-04-29' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (100, N'Калашников', N'Антон', N'Олегович', N'6992', N'102659', N'95152671018', N'openldap@live.com', CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (101, N'Королев', N'Эдуард', N'Борисович', N'2667', N'868293', N'40588441755', N'parents@aol.com', CAST(N'2023-05-01' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (102, N'Щукин', N'Денис', N'Леонидович', N'7879', N'173463', N'50323220915', N'brbarret@live.com', CAST(N'2023-05-02' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (103, N'Князев', N'Василий', N'Валентинович', N'8217', N'370180', N'42705492772', N'gfody@outlook.com', CAST(N'2023-05-03' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (104, N'Федотов', N'Олег', N'Антонович', N'1390', N'223467', N'59865761717', N'johndo@aol.com', CAST(N'2023-05-04' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (105, N'Самойлов', N'Фёдор', N'Ильич', N'6556', N'612828', N'47306306879', N'monkeydo@verizon.net', CAST(N'2023-05-05' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (106, N'Полякова', N'Маргарита', N'Александровна', N'2309', N'287402', N'64489309199', N'kludge@comcast.net', CAST(N'2023-05-06' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (107, N'Блохина', N'Алла', N'Кирилловна', N'6435', N'830861', N'30313744704', N'mnemonic@mac.com', CAST(N'2023-05-07' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (108, N'Веселова', N'Надежда', N'Павловна', N'3098', N'266382', N'35381962670', N'fviegas@yahoo.ca', CAST(N'2023-05-08' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (109, N'Киселева', N'Алёна', N'Романовна', N'5364', N'214887', N'93002650073', N'bachmann@me.com', CAST(N'2023-05-09' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (110, N'Жуков', N'Дмитрий', N'Пётрович', N'8817', N'727193', N'83994165389', N'scottzed@me.com', CAST(N'2023-05-10' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (111, N'Кононов', N'Виталий', N'Егорович', N'3337', N'989358', N'64115819265', N'smcnabb@aol.com', CAST(N'2023-05-11' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (112, N'Шубина', N'Дарина', N'Максимовна', N'8509', N'586545', N'97471901670', N'djupedal@live.com', CAST(N'2023-05-12' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (113, N'Щукин', N'Александр', N'Геннадьевич', N'4945', N'244170', N'79865741086', N'rgiersig@optonline.net', CAST(N'2023-05-13' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (114, N'Туров', N'Вячеслав', N'Сергеевич', N'8991', N'318186', N'35898385599', N'manuals@hotmail.com', CAST(N'2023-05-14' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (115, N'Крылов', N'Геннадий', N'Денисович', N'6698', N'947021', N'68241426516', N'chaikin@yahoo.com', CAST(N'2023-05-15' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (116, N'Кондратьев', N'Валерий', N'Георгиевич', N'4997', N'543808', N'99915355085', N'daveewart@aol.com', CAST(N'2023-05-16' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (117, N'Дмитриева', N'Валерия', N'Дмитриевна', N'2787', N'426813', N'26931141544', N'hermanab@live.com', CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (118, N'Князева', N'Александра', N'Игоревна', N'8063', N'951521', N'60336862599', N'konst@comcast.net', CAST(N'2023-05-18' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (119, N'Миронова', N'Надежда', N'Васильевна', N'6368', N'671018', N'46239347118', N'alastair@outlook.com', CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (120, N'Шубина', N'Кира', N'Эдуардовна', N'8170', N'405886', N'55448715116', N'singh@hotmail.com', CAST(N'2023-05-20' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (121, N'Субботин', N'Максим', N'Аркадиевич', N'5390', N'441755', N'14097189106', N'grossman@hotmail.com', CAST(N'2023-05-21' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (122, N'Харитонов', N'Валентин', N'Романович', N'9451', N'503235', N'48532758572', N'bcevc@me.com', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (123, N'Кононова', N'Нина', N'Максимовна', N'1454', N'220915', N'51273487234', N'tedrlord@mac.com', CAST(N'2023-05-23' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (124, N'Прохоров', N'Станислав', N'Антонович', N'1294', N'427053', N'42651999151', N'timtroyr@att.net', CAST(N'2023-05-24' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (125, N'Петров', N'Вячеслав', N'Валерьевич', N'6857', N'492772', N'35508269312', N'granboul@verizon.net', CAST(N'2023-05-25' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (126, N'Дементьева', N'Лариса', N'Антоновна', N'5522', N'598650', N'14154603368', N'imightb@msn.com', CAST(N'2023-05-26' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (127, N'Щукин', N'Леонид', N'Никитович', N'5881', N'761717', N'86259462396', N'munjal@live.com', CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (128, N'Родионов', N'Пётр', N'Ильич', N'1926', N'473060', N'34711554484', N'bescoto@yahoo.ca', CAST(N'2023-05-28' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (129, N'Ермаков', N'Анатолий', N'Георгиевич', N'5353', N'306879', N'71511140978', N'xtang@me.com', CAST(N'2023-05-29' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (130, N'Мартынов', N'Денис', N'Иванович', N'3359', N'644891', N'18910485326', N'maradine@icloud.com', CAST(N'2023-05-30' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (131, N'Дмитриева', N'Лада', N'Георгиевна', N'7654', N'309199', N'75857512734', N'dexter@yahoo.ca', CAST(N'2023-05-31' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (132, N'Воронцова', N'Анастасия', N'Тимуровна', N'8528', N'303139', N'30919303139', N'dkasak@optonline.net', CAST(N'2023-06-01' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (133, N'Харитонов', N'Даниил', N'Витальевич', N'4004', N'744704', N'74470353810', N'chrisj@hotmail.com', CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (134, N'Бирюков', N'Геннадий', N'Аркадиевич', N'8375', N'353810', N'96267930029', N'drolsky@aol.com', CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (135, N'Дьячков', N'Юрий', N'Павлович', N'3526', N'962670', N'65007839944', N'smpeters@yahoo.com', CAST(N'2023-06-04' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (136, N'Крюкова', N'Татьяна', N'Степановна', N'8731', N'930029', N'16538641153', N'hillct@gmail.com', CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (137, N'Иванов', N'Владимир', N'Сергеевич', N'9620', N'650073', N'81926974710', N'sethbrown@me.com', CAST(N'2023-06-06' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (138, N'Рыбакова', N'Екатерина', N'Тимуровна', N'6094', N'839944', N'90167798658', N'jyoliver@outlook.com', CAST(N'2023-06-07' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (139, N'Рогова', N'Яна', N'Семёновна', N'3742', N'165389', N'74108358982', N'dimensio@att.net', CAST(N'2023-06-08' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (140, N'Дорофеев', N'Станислав', N'Дмитриевич', N'7089', N'641153', N'38559682414', N'jonas@me.com', CAST(N'2023-06-09' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (141, N'Селиверстова', N'Ксения', N'Матвеевна', N'7999', N'819265', N'63681705390', N'mirod@verizon.net', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (142, N'Авдеева', N'Ольга', N'Ильинична', N'9115', N'974710', N'94511451294', N'ijackson@mac.com', CAST(N'2023-06-11' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (143, N'Копылова', N'Надежда', N'Анатольевна', N'8999', N'901670', N'68575525881', N'subir@me.com', CAST(N'2023-06-12' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (144, N'Осипова', N'Жанна', N'Данииловна', N'9841', N'798658', N'19265353359', N'yumpy@aol.com', CAST(N'2023-06-13' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (145, N'Яковлева', N'Жанна', N'Евгеньевна', N'9771', N'741086', N'76548528004', N'evilopie@gmail.com', CAST(N'2023-06-14' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (146, N'Горбунов', N'Тимур', N'Евгеньевич', N'2228', N'358982', N'83753526731', N'citizenl@gmail.com', CAST(N'2023-06-15' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (147, N'Филатова', N'Лариса', N'Григориевна', N'7592', N'385599', N'96206093742', N'scarlet@yahoo.com', CAST(N'2023-06-16' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (148, N'Ковалев', N'Константин', N'Владиславович', N'6098', N'682414', N'34254532666', N'arathi@live.com', CAST(N'2023-06-17' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (149, N'Авдеева', N'Лада', N'Пётровна', N'9474', N'426516', N'34665653542', N'cameron@optonline.net', CAST(N'2023-06-18' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (150, N'Яковлева', N'Ирина', N'Станиславовна', N'4018', N'999151', N'34234567534', N'matloff@att.net', CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (151, N'Зухин', N'Трофим', N'Вениаминович', N'4111', N'404340', N'85062671223', N'cutteifroijimme-5590@yopmail.com', CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Owner] ([Id], [Surname], [Name], [Patronymic], [PassportSeries], [PassportNumber], [PhoneNumber], [Email], [RegistrationDate]) VALUES (152, N'Дмитриев', N'Егор', N'Сергеевич', N'2838', N'234545', N'85092317568', N'quetroddilacru-6487@yopmail.com', CAST(N'2023-05-22' AS Date))
SET IDENTITY_INSERT [dbo].[Owner] OFF
GO
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (1, CAST(N'2023-04-11' AS Date), 2000.0000, 1, 1, 2)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (2, CAST(N'2023-04-12' AS Date), 3000.0000, 2, 2, 3)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (3, CAST(N'2023-04-13' AS Date), 234.0000, 3, 3, 4)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (4, CAST(N'2023-04-14' AS Date), 342.0000, 4, 4, 5)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (5, CAST(N'2023-04-15' AS Date), 2435.0000, 5, 5, 6)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (6, CAST(N'2023-04-16' AS Date), 3544.0000, 6, 6, 7)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (7, CAST(N'2023-04-17' AS Date), 535.0000, 7, 7, 9)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (8, CAST(N'2023-04-18' AS Date), 5354.0000, 8, 8, 10)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (9, CAST(N'2023-04-19' AS Date), 5445.0000, 9, 9, 11)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (10, CAST(N'2023-04-20' AS Date), 456.0000, 10, 10, 12)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (11, CAST(N'2023-04-21' AS Date), 435.0000, 11, 1, 13)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (12, CAST(N'2023-04-22' AS Date), 354.0000, 12, 2, 14)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (13, CAST(N'2023-04-23' AS Date), 355.0000, 13, 3, 15)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (14, CAST(N'2023-04-24' AS Date), 4545.0000, 14, 4, 16)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (15, CAST(N'2023-04-25' AS Date), 3455.0000, 15, 5, 17)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (16, CAST(N'2023-04-26' AS Date), 435.0000, 16, 6, 18)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (17, CAST(N'2023-04-27' AS Date), 5354.0000, 17, 7, 19)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (18, CAST(N'2023-04-28' AS Date), 3544.0000, 18, 8, 20)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (19, CAST(N'2023-04-29' AS Date), 324.0000, 19, 9, 21)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (20, CAST(N'2023-04-30' AS Date), 235.0000, 20, 10, 22)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (21, CAST(N'2023-05-01' AS Date), 3554.0000, 21, 1, 23)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (22, CAST(N'2023-05-02' AS Date), 4534.0000, 22, 2, 24)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (23, CAST(N'2023-05-03' AS Date), 345.0000, 23, 3, 25)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (24, CAST(N'2023-05-04' AS Date), 3455.0000, 24, 4, 26)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (25, CAST(N'2023-05-05' AS Date), 634.0000, 25, 5, 27)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (26, CAST(N'2023-05-06' AS Date), 4365.0000, 26, 6, 28)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (27, CAST(N'2023-05-07' AS Date), 456.0000, 27, 7, 29)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (28, CAST(N'2023-05-08' AS Date), 646.0000, 28, 8, 30)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (29, CAST(N'2023-05-09' AS Date), 566.0000, 29, 9, 31)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (30, CAST(N'2023-05-10' AS Date), 4665.0000, 30, 10, 32)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (31, CAST(N'2023-05-11' AS Date), 6454.0000, 31, 1, 33)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (32, CAST(N'2023-05-12' AS Date), 5554.0000, 32, 2, 34)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (33, CAST(N'2023-05-13' AS Date), 4556.0000, 33, 3, 35)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (34, CAST(N'2023-05-14' AS Date), 4654.0000, 34, 4, 36)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (35, CAST(N'2023-05-15' AS Date), 4564.0000, 35, 5, 37)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (36, CAST(N'2023-05-16' AS Date), 5466.0000, 36, 6, 39)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (37, CAST(N'2023-05-17' AS Date), 4564.0000, 37, 7, 40)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (38, CAST(N'2023-05-18' AS Date), 455.0000, 38, 8, 41)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (39, CAST(N'2023-05-19' AS Date), 456.0000, 39, 9, 41)
INSERT [dbo].[Payment] ([Id], [Date], [Sum], [ResidentId], [UtilitiesId], [HousingId]) VALUES (40, CAST(N'2023-05-20' AS Date), 546.0000, 40, 10, 40)
GO
SET IDENTITY_INSERT [dbo].[Resident] ON 

INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (1, N'Яковлева', N'Марина', N'Борисовна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (2, N'Колесников', N'Михаил', N'Витальевич', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (3, N'Игнатьев', N'Николай', N'Эдуардович', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (4, N'Киселева', N'Валерия', N'Владимировна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (5, N'Савин', N'Леонид', N'Николаевич', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (6, N'Калашников', N'Анатолий', N'Константинович', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (7, N'Суворов', N'Александр', N'Дмитриевич', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (8, N'Евсеев', N'Фёдор', N'Александрович', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (9, N'Алексеева', N'Маргарита', N'Максимовна', 11)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (10, N'Шаров', N'Алексей', N'Аркадиевич', 12)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (11, N'Прохоров', N'Андрей', N'Станиславович', 13)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (12, N'Тетерин', N'Владислав', N'Романович', 14)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (13, N'Галкин', N'Константин', N'Пётрович', 15)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (14, N'Семенова', N'Алёна', N'Вадимовна', 16)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (15, N'Дмитриев', N'Егор', N'Аркадиевич', 17)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (16, N'Воробьева', N'Евгения', N'Пётровна', 18)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (17, N'Мухина', N'Светлана', N'Анатольевна', 19)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (18, N'Казакова', N'София', N'Владиславовна', 20)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (19, N'Кошелева', N'Екатерина', N'Анатольевна', 21)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (20, N'Сазонова', N'Валерия', N'Денисовна', 22)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (21, N'Максимов', N'Пётр', N'Андреевич', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (22, N'Фомичева', N'Ирина', N'Кирилловна', 24)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (23, N'Ситникова', N'Валерия', N'Михайловна', 25)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (24, N'Афанасьев', N'Виктор', N'Евгеньевич', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (25, N'Некрасова', N'Лариса', N'Александровна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (26, N'Уварова', N'Лидия', N'Александровна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (27, N'Тетерин', N'Владимир', N'Даниилович', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (28, N'Агафонова', N'Людмила', N'Дмитриевна', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (29, N'Евсеева', N'Вероника', N'Станиславовна', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (30, N'Ермакова', N'Зоя', N'Павловна', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (31, N'Гуляев', N'Денис', N'Даниилович', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (32, N'Алексеева', N'Нина', N'Игоревна', 11)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (33, N'Тетерин', N'Олег', N'Степанович', 12)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (34, N'Васильева', N'Жанна', N'Валентиновна', 13)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (35, N'Герасимова', N'Лидия', N'Константиновна', 14)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (36, N'Ширяев', N'Павел', N'Вадимович', 15)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (37, N'Терентьев', N'Андрей', N'Николаевич', 16)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (38, N'Антонова', N'София', N'Антоновна', 17)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (39, N'Емельянов', N'Семён', N'Станиславович', 18)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (40, N'Сергеев', N'Кирилл', N'Евгеньевич', 19)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (41, N'Лебедева', N'Алина', N'Матвеевна', 20)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (42, N'Веселова', N'Елена', N'Степановна', 21)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (43, N'Соболева', N'Вера', N'Аркадиевна', 22)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (44, N'Богданова', N'Лада', N'Вячеславовна', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (45, N'Вишнякова', N'Полина', N'Максимовна', 24)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (46, N'Никитин', N'Семён', N'Даниилович', 25)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (47, N'Гуляев', N'Виктор', N'Владимирович', 26)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (48, N'Дорофеев', N'Андрей', N'Станиславович', 27)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (49, N'Уваров', N'Арсений', N'Эдуардович', 28)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (50, N'Агафонова', N'Любовь', N'Валентиновна', 29)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (51, N'Соловьева', N'Маргарита', N'Евгеньевна', 30)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (52, N'Сергеева', N'Дарья', N'Аркадиевна', 31)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (53, N'Кудрявцева', N'Юлия', N'Анатольевна', 32)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (54, N'Богданов', N'Виктор', N'Васильевич', 33)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (55, N'Морозов', N'Семён', N'Семёнович', 34)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (56, N'Степанова', N'Вероника', N'Пётровна', 35)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (57, N'Третьяков', N'Матвей', N'Степанович', 36)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (58, N'Кононова', N'Антонина', N'Дмитриевна', 37)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (59, N'Мельникова', N'Юлия', N'Эдуардовна', 39)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (60, N'Жданова', N'Варвара', N'Леонидовна', 40)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (61, N'Попов', N'Леонид', N'Арсениевич', 41)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (62, N'Журавлев', N'Олег', N'Владимирович', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (63, N'Турова', N'Анна', N'Вадимовна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (64, N'Сидорова', N'Оксана', N'Антоновна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (65, N'Маслов', N'Валерий', N'Арсениевич', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (66, N'Беляева', N'Татьяна', N'Николаевна', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (67, N'Федотова', N'Екатерина', N'Романовна', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (68, N'Кудрявцева', N'Яна', N'Кирилловна', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (69, N'Архипов', N'Константин', N'Кириллович', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (70, N'Филиппова', N'Маргарита', N'Фёдоровна', 11)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (71, N'Носков', N'Вячеслав', N'Борисович', 12)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (72, N'Зимин', N'Кирилл', N'Семёнович', 13)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (73, N'Комаров', N'Вячеслав', N'Владиславович', 14)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (74, N'Коновалов', N'Эдуард', N'Павлович', 15)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (75, N'Богданова', N'Александра', N'Николаевна', 16)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (76, N'Суворов', N'Станислав', N'Пётрович', 17)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (77, N'Родионов', N'Владимир', N'Степанович', 18)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (78, N'Маркова', N'Елизавета', N'Аркадиевна', 19)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (79, N'Юдин', N'Эдуард', N'Пётрович', 20)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (80, N'Веселова', N'Ксения', N'Анатольевна', 21)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (81, N'Гуляева', N'Елена', N'Егоровна', 22)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (82, N'Егоров', N'Андрей', N'Игоревич', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (83, N'Кудрявцев', N'Михаил', N'Иванович', 24)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (84, N'Носов', N'Алексей', N'Валерьевич', 25)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (85, N'Миронова', N'Жанна', N'Семёновна', 26)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (86, N'Антонова', N'Алла', N'Фёдоровна', 27)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (87, N'Лобанов', N'Илья', N'Георгиевич', 28)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (88, N'Волков', N'Даниил', N'Алексеевич', 29)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (89, N'Суханов', N'Михаил', N'Арсениевич', 30)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (90, N'Третьяков', N'Иван', N'Константинович', 31)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (91, N'Зуева', N'Полина', N'Борисовна', 32)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (92, N'Колесникова', N'Екатерина', N'Дмитриевна', 33)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (93, N'Максимова', N'Евгения', N'Фёдоровна', 34)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (94, N'Чернов', N'Виктор', N'Станиславович', 35)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (95, N'Авдеев', N'Михаил', N'Григориевич', 36)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (96, N'Воронцова', N'Евгения', N'Кирилловна', 37)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (97, N'Авдеева', N'Марина', N'Данииловна', 39)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (98, N'Федотов', N'Алексей', N'Кириллович', 40)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (99, N'Щукина', N'Маргарита', N'Никитовна', 41)
GO
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (100, N'Баранова', N'Александра', N'Семёновна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (101, N'Никитин', N'Евгений', N'Юрьевич', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (102, N'Карпова', N'Карина', N'Олеговна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (103, N'Титова', N'Зоя', N'Евгеньевна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (104, N'Самойлова', N'Екатерина', N'Степановна', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (105, N'Одинцов', N'Леонид', N'Викторович', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (106, N'Терентьев', N'Борис', N'Валерьевич', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (107, N'Савельева', N'Алёна', N'Николаевна', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (108, N'Антонов', N'Максим', N'Валентинович', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (109, N'Самойлов', N'Аркадий', N'Никитович', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (110, N'Лапин', N'Андрей', N'Семёнович', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (111, N'Фокин', N'Илья', N'Максимович', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (112, N'Калашников', N'Аркадий', N'Вадимович', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (113, N'Лыткина', N'Людмила', N'Викторовна', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (114, N'Сидоров', N'Александр', N'Леонидович', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (115, N'Быков', N'Антон', N'Матвеевич', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (116, N'Крюкова', N'Вера', N'Геннадьевна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (117, N'Ковалев', N'Юрий', N'Викторович', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (118, N'Дьячков', N'Егор', N'Романович', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (119, N'Зайцев', N'Матвей', N'Витальевич', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (120, N'Анисимов', N'Даниил', N'Валентинович', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (121, N'Крюков', N'Вячеслав', N'Дмитриевич', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (122, N'Ефремов', N'Олег', N'Викторович', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (123, N'Захаров', N'Валерий', N'Ильич', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (124, N'Новиков', N'Анатолий', N'Юрьевич', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (125, N'Артемьев', N'Олег', N'Владимирович', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (126, N'Белоусов', N'Григорий', N'Степанович', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (127, N'Савин', N'Роман', N'Сергеевич', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (128, N'Давыдов', N'Борис', N'Кириллович', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (129, N'Калашников', N'Георгий', N'Борисович', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (130, N'Самойлова', N'Екатерина', N'Денисовна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (131, N'Ершов', N'Николай', N'Максимович', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (132, N'Кузнецов', N'Антон', N'Витальевич', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (133, N'Гордеева', N'Маргарита', N'Семёновна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (134, N'Симонов', N'Роман', N'Ильич', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (135, N'Терентьева', N'Вера', N'Васильевна', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (136, N'Ковалева', N'Алёна', N'Олеговна', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (137, N'Баранова', N'Анастасия', N'Витальевна', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (138, N'Копылова', N'Ольга', N'Аркадиевна', 11)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (139, N'Емельянов', N'Владимир', N'Анатольевич', 12)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (140, N'Хохлова', N'Людмила', N'Егоровна', 13)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (141, N'Тарасов', N'Аркадий', N'Валерьевич', 14)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (142, N'Симонова', N'Зоя', N'Семёновна', 15)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (143, N'Шубин', N'Александр', N'Станиславович', 16)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (144, N'Яковлев', N'Виктор', N'Кириллович', 17)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (145, N'Константинова', N'Елизавета', N'Евгеньевна', 18)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (146, N'Тимофеева', N'Антонина', N'Антоновна', 19)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (147, N'Самсонов', N'Юрий', N'Павлович', 20)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (148, N'Алексеева', N'Марина', N'Юрьевна', 22)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (149, N'Савельева', N'Жанна', N'Михайловна', 21)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (150, N'Молчанова', N'Светлана', N'Леонидовна', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (151, N'Исаков', N'Антон', N'Эдуардович', 24)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (152, N'Антонова', N'Яна', N'Павловна', 25)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (153, N'Дементьева', N'Анна', N'Арсениевна', 26)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (154, N'Бурова', N'Маргарита', N'Антоновна', 27)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (155, N'Васильева', N'Вероника', N'Матвеевна', 40)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (156, N'Карпова', N'Надежда', N'Олеговна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (157, N'Лыткина', N'Ксения', N'Романовна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (158, N'Харитонов', N'Аркадий', N'Григориевич', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (159, N'Федосеев', N'Фёдор', N'Юрьевич', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (160, N'Максимов', N'Иван', N'Тимурович', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (161, N'Кулагина', N'Нина', N'Денисовна', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (162, N'Петухова', N'Анна', N'Андреевна', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (163, N'Зуева', N'Ирина', N'Васильевна', 10)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (164, N'Рогов', N'Даниил', N'Эдуардович', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (165, N'Белоусова', N'Лидия', N'Валентиновна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (166, N'Силина', N'Дарина', N'Игоревна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (167, N'Федотов', N'Арсений', N'Фёдорович', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (168, N'Прохоров', N'Борис', N'Валентинович', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (169, N'Носкова', N'Ольга', N'Константиновна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (170, N'Федотов', N'Максим', N'Борисович', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (171, N'Нестеров', N'Тимур', N'Васильевич', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (172, N'Лазарева', N'Вероника', N'Семёновна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (173, N'Третьякова', N'Зоя', N'Борисовна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (174, N'Ширяева', N'Ирина', N'Валентиновна', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (175, N'Никитин', N'Сергей', N'Максимович', 7)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (176, N'Дроздова', N'Ирина', N'Степановна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (177, N'Панфилова', N'Оксана', N'Андреевна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (178, N'Суханова', N'Светлана', N'Арсениевна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (179, N'Герасимов', N'Иван', N'Павлович', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (180, N'Калашникова', N'Татьяна', N'Кирилловна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (181, N'Устинов', N'Вячеслав', N'Борисович', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (182, N'Ильина', N'Дарья', N'Валерьевна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (183, N'Ситников', N'Георгий', N'Ильич', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (184, N'Горшков', N'Фёдор', N'Антонович', 40)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (185, N'Крюкова', N'Оксана', N'Леонидовна', 23)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (186, N'Чернова', N'Наталья', N'Антоновна', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (187, N'Громов', N'Аркадий', N'Евгеньевич', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (188, N'Мамонтова', N'Евгения', N'Егоровна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (189, N'Анисимов', N'Олег', N'Николаевич', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (190, N'Гурьева', N'Ольга', N'Вячеславовна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (191, N'Белозеров', N'Геннадий', N'Эдуардович', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (192, N'Кириллова', N'Лариса', N'Степановна', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (193, N'Брагина', N'Анна', N'Вячеславовна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (194, N'Котова', N'Маргарита', N'Леонидовна', 2)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (195, N'Шилова', N'Надежда', N'Ильинична', 3)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (196, N'Анисимов', N'Степан', N'Денисович', 4)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (197, N'Бурова', N'Дарья', N'Викторовна', 5)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (198, N'Дементьев', N'Николай', N'Алексеевич', 6)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (199, N'Колобова', N'Яна', N'Григориевна', 7)
GO
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (200, N'Воронов', N'Илья', N'Борисович', 9)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (201, N'Ширяева', N'Анна', N'Тимуровна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (202, N'Лазарев', N'Владимир', N'Валерьевич', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (203, N'Шаров', N'Иван', N'Геннадьевич', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (204, N'Белякова', N'Антонина', N'Кирилловна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (205, N'Калинина', N'Карина', N'Николаевна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (206, N'Новикова', N'Лариса', N'Геннадьевна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (207, N'Николаев', N'Максим', N'Олегович', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (208, N'Лапина', N'Татьяна', N'Антоновна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (209, N'Блинов', N'Максим', N'Сергеевич', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (210, N'Федотов', N'Денис', N'Витальевич', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (211, N'Королев', N'Виталий', N'Станиславович', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (212, N'Андреева', N'Нина', N'Витальевна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (213, N'Щукина', N'Жанна', N'Валерьевна', NULL)
INSERT [dbo].[Resident] ([Id], [Surname], [Name], [Patronymic], [HousingId]) VALUES (216, N'Григорьев', N'Иван', N'Степанович', 10)
SET IDENTITY_INSERT [dbo].[Resident] OFF
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (1, N'Вокзальная', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (3, N'Речная', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (4, N'Калининская', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (5, N'Верная', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (6, N'Пожитная', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (7, N'Морская', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (9, N'Ветренная', 1)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (10, N'Жукова', 2)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (11, N'Мореходова', 2)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (12, N'Клиническая', 2)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (13, N'Габдуллы тукая', 2)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (14, N'Мирная', 3)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (15, N'Камерная', 3)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (16, N'Веселая', 3)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (17, N'Грустная', 3)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (18, N'Одинокая', 4)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (19, N'Спальная', 4)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (20, N'Кармическая', 4)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (21, N'Китайская', 5)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (22, N'Французская', 5)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (23, N'Личная', 6)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (24, N'Летальная', 6)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (25, N'Ванная', 7)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (26, N'Мамадышская', 8)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (27, N'Зеленая', 9)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (28, N'Красная', 9)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (29, N'Желтая', 10)
INSERT [dbo].[Street] ([Id], [Name], [CityId]) VALUES (30, N'Винная', 10)
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
SET IDENTITY_INSERT [dbo].[Utilities] ON 

INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (1, N'Холодная вода (ХВС)', 300.0000, N'Совокупность мероприятий, направленных на обеспечение разных потребителей водой в необходимом объеме. Система водоснабжения (привычное название - водопровод) - это инженерные сооружения, непосредственно предназначенные для решения типичных задач водоснабжения. ')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (2, N'Горячая вода (ГВС)', 100.0000, N'Обеспечение бытовых нужд населения и производственных потребностей в воде с повышенной температурой. Является одним из показателей качества жизни, важным фактором улучшения санитарно-гигиенических и культурно-бытовых условий жизни.')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (3, N'Тепловая энергия', 200.0000, N'Компонент «тепловая энергия» определяется не по приборам учета, а по нормативным показателям расхода тепла на подогрев. ')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (4, N'Водоотведение', 400.0000, N'Водооотведение в квитанции за ЖКХ — оплата за отведение использованной воды из квартир.')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (5, N'Электроснабжение', 500.0000, N'Совокупность источников и систем преобразования, передачи и распределения электрической энергии. ')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (6, N'Газоснабжение, в том числе бытовой газ в баллонах', 120.0000, N'Организованная подача и распределение газового топлива для нужд народного хозяйства.')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (7, N'Отопление', 420.0000, N'Искусственный обогрев помещений с целью возмещения в них теплопотерь и поддержания на заданном уровне температуры, отвечающей условиям теплового комфорта и/или требованиям технологического процесса. Под отоплением понимают также устройства и системы, выполняющие эту функцию.  ')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (8, N'Твердое топливо при наличии печного отопления', 560.0000, N' Твердое топливо весьма неоднородно по своей теплоотдаче – это касается и дров, и иных видов: угля, торфа, брикетов. Теплотехнические показатели для разных пород древесины и для разновидностей твердого топлива также учтены в калькуляторе. ')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (9, N'Содержание и ремонт общего имущества', 320.0000, N'Согласно статье 154 Жилищного кодекса РФ текущее содержание и ремонт общего имущества в многоквартирном доме – это перечень необходимых сезонных и иных работ, проводимых с целью поддержания дома в надлежащем внешнем и функциональном виде, устранение недочетов и неполадок для комфортного проживания собственников в своих квартирах.')
INSERT [dbo].[Utilities] ([Id], [Name], [RatePerMonth], [Description]) VALUES (10, N'Вывоз мусора', 321.0000, N'Мусор — это всё, что осталось ненужным после потребления, производства, приготовления еды, оказания услуг или торговли.')
SET IDENTITY_INSERT [dbo].[Utilities] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owner]    Script Date: 22.05.2023 15:44:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner] ON [dbo].[Owner]
(
	[PassportNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Owner_1]    Script Date: 22.05.2023 15:44:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Owner_1] ON [dbo].[Owner]
(
	[PassportSeries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Counter] ADD  CONSTRAINT [DF_Counter_ReleaseDate]  DEFAULT (getdate()) FOR [ReleaseDate]
GO
ALTER TABLE [dbo].[Owner] ADD  CONSTRAINT [DF_Owner_RegistrationDate]  DEFAULT (sysdatetime()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Arrear]  WITH CHECK ADD  CONSTRAINT [FK_ArrearUtilities_Housing] FOREIGN KEY([HousingId])
REFERENCES [dbo].[Housing] ([Id])
GO
ALTER TABLE [dbo].[Arrear] CHECK CONSTRAINT [FK_ArrearUtilities_Housing]
GO
ALTER TABLE [dbo].[Arrear]  WITH CHECK ADD  CONSTRAINT [FK_ArrearUtilities_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([Id])
GO
ALTER TABLE [dbo].[Arrear] CHECK CONSTRAINT [FK_ArrearUtilities_Owner]
GO
ALTER TABLE [dbo].[Arrear]  WITH CHECK ADD  CONSTRAINT [FK_ArrearUtilities_Utilities] FOREIGN KEY([UtilitiesId])
REFERENCES [dbo].[Utilities] ([Id])
GO
ALTER TABLE [dbo].[Arrear] CHECK CONSTRAINT [FK_ArrearUtilities_Utilities]
GO
ALTER TABLE [dbo].[Counter]  WITH CHECK ADD  CONSTRAINT [FK_Counter_Housing] FOREIGN KEY([HousingId])
REFERENCES [dbo].[Housing] ([Id])
GO
ALTER TABLE [dbo].[Counter] CHECK CONSTRAINT [FK_Counter_Housing]
GO
ALTER TABLE [dbo].[Counter]  WITH CHECK ADD  CONSTRAINT [FK_Counter_Utilities] FOREIGN KEY([UtilitiesId])
REFERENCES [dbo].[Utilities] ([Id])
GO
ALTER TABLE [dbo].[Counter] CHECK CONSTRAINT [FK_Counter_Utilities]
GO
ALTER TABLE [dbo].[Housing]  WITH CHECK ADD  CONSTRAINT [FK_Housing_Condition] FOREIGN KEY([ConditionId])
REFERENCES [dbo].[Condition] ([Id])
GO
ALTER TABLE [dbo].[Housing] CHECK CONSTRAINT [FK_Housing_Condition]
GO
ALTER TABLE [dbo].[Housing]  WITH CHECK ADD  CONSTRAINT [FK_Housing_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([Id])
GO
ALTER TABLE [dbo].[Housing] CHECK CONSTRAINT [FK_Housing_Owner]
GO
ALTER TABLE [dbo].[Housing]  WITH CHECK ADD  CONSTRAINT [FK_Housing_Street] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Housing] CHECK CONSTRAINT [FK_Housing_Street]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_PaymentUtilities_Housing] FOREIGN KEY([HousingId])
REFERENCES [dbo].[Housing] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_PaymentUtilities_Housing]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_PaymentUtilities_Resident] FOREIGN KEY([ResidentId])
REFERENCES [dbo].[Resident] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_PaymentUtilities_Resident]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_PaymentUtilities_Utilities] FOREIGN KEY([UtilitiesId])
REFERENCES [dbo].[Utilities] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_PaymentUtilities_Utilities]
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD  CONSTRAINT [FK_Resident_Housing] FOREIGN KEY([HousingId])
REFERENCES [dbo].[Housing] ([Id])
GO
ALTER TABLE [dbo].[Resident] CHECK CONSTRAINT [FK_Resident_Housing]
GO
ALTER TABLE [dbo].[Street]  WITH CHECK ADD  CONSTRAINT [FK_Street_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Street] CHECK CONSTRAINT [FK_Street_City]
GO
USE [master]
GO
ALTER DATABASE [HomeownersAssociation] SET  READ_WRITE 
GO
