USE [master]
GO
/****** Object:  Database [LYSAdmin]    Script Date: 21-06-2015 21:58:10 ******/
CREATE DATABASE [LYSAdmin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LYSAdmin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LYSAdmin.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LYSAdmin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LYSAdmin_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LYSAdmin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LYSAdmin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LYSAdmin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LYSAdmin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LYSAdmin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LYSAdmin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LYSAdmin] SET ARITHABORT OFF 
GO
ALTER DATABASE [LYSAdmin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LYSAdmin] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LYSAdmin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LYSAdmin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LYSAdmin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LYSAdmin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LYSAdmin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LYSAdmin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LYSAdmin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LYSAdmin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LYSAdmin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LYSAdmin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LYSAdmin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LYSAdmin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LYSAdmin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LYSAdmin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LYSAdmin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LYSAdmin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LYSAdmin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LYSAdmin] SET  MULTI_USER 
GO
ALTER DATABASE [LYSAdmin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LYSAdmin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LYSAdmin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LYSAdmin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LYSAdmin]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 21-06-2015 21:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Apartments](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentName] [varchar](50) NULL,
	[HouseNo] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NULL,
	[AreaID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[OwnerID] [int] NOT NULL,
 CONSTRAINT [PK_Apartments] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Areas](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](50) NULL,
	[CityID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BasicAmenities]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasicAmenities](
	[AminityID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[AC] [bit] NULL,
	[Two_wheeler_open_parking] [bit] NULL,
	[Wifi] [bit] NULL,
	[Room_service] [bit] NULL,
	[Fridge] [bit] NULL,
	[Water_supply] [bit] NULL,
	[Ward_robes] [bit] NULL,
	[GYM] [bit] NULL,
	[Party_Hall] [bit] NULL,
	[Four_wheeler_open_parking] [bit] NULL,
	[Common_TV] [bit] NULL,
	[House_Keeping] [bit] NULL,
	[Washing_machine] [bit] NULL,
	[Hot_Cold_Water_Supply] [bit] NULL,
	[Lockers] [bit] NULL,
	[Swimming_pool] [bit] NULL,
	[Lift] [bit] NULL,
	[Attach_bathrooms] [bit] NULL,
	[Two_wheeler_close_parking] [bit] NULL,
	[Individual_TV] [bit] NULL,
	[Security] [bit] NULL,
	[Newspaper] [bit] NULL,
	[Mineral_drinking_water] [bit] NULL,
	[Intercom_facility] [bit] NULL,
	[Playground] [bit] NULL,
	[Club_house] [bit] NULL,
	[Power_back_up] [bit] NULL,
	[Four_wheeler_close_parking] [bit] NULL,
	[LCD_TV_cable_connection] [bit] NULL,
	[Emergency_Medical_Services] [bit] NULL,
	[Ironing_washing_services] [bit] NULL,
	[Aqua_guard] [bit] NULL,
	[Video_Surveillance] [bit] NULL,
	[Kitchen_Facility_with_Gas] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[Lunch_Given] [bit] NULL,
	[BreakFast_Given] [bit] NULL,
	[Dinner_Given] [bit] NULL,
	[Guardian_Entry] [bit] NULL,
	[NonVeg_allowed] [bit] NULL,
	[No_Smoking] [bit] NULL,
	[No_Drinking] [bit] NULL,
	[No_Boys_Entry] [bit] NULL,
 CONSTRAINT [PK__Basic_Amenities] PRIMARY KEY CLUSTERED 
(
	[AminityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Beds]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beds](
	[BedID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[Bed_Status] [int] NULL,
	[Status_Update_Date] [datetime] NULL,
 CONSTRAINT [PK_Bed] PRIMARY KEY CLUSTERED 
(
	[BedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blocks]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blocks](
	[BlockID] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NULL,
	[ApartmentID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[isDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_Blocks] PRIMARY KEY CLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CountryID] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HouseDescriptions]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HouseDescriptions](
	[DescrID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[Address] [varchar](50) NULL,
	[Gender] [varchar](6) NOT NULL,
	[Landmark] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[No_of_Rooms] [int] NOT NULL,
	[No_of_Bathrooms] [int] NOT NULL,
	[No_of_Balconnies] [int] NULL,
 CONSTRAINT [PK__House_Description] PRIMARY KEY CLUSTERED 
(
	[DescrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HouseImages]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HouseImages](
	[HouseImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [varchar](50) NOT NULL,
	[HouseID] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_HouseImageID] PRIMARY KEY CLUSTERED 
(
	[HouseImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Houses]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Houses](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[HouseName] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NULL,
	[OwnerID] [int] NULL,
	[BlockID] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LinkID] [int] NULL,
	[LinkTypeID] [int] NULL,
	[isDeleted] [bit] NULL,
	[DeletedBy] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[DisplayName] [varchar](50) NULL,
 CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[RoomNumber] [varchar](5) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Monthly_Rent] [varchar](20) NOT NULL,
	[No_of_Beds] [int] NOT NULL,
	[Deposit] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PresentAddress] [varchar](50) NOT NULL,
	[PermanentAddress] [varchar](50) NOT NULL,
	[GovtIDType] [int] NOT NULL,
	[GovtID] [varchar](50) NOT NULL,
	[UserProfession] [int] NOT NULL,
	[CurrentEmployer] [varchar](50) NULL,
	[OfficeLocation] [varchar](60) NOT NULL,
	[EmployeeID] [varchar](10) NULL,
	[HighestEducation] [varchar](20) NOT NULL,
	[InstitutionName] [varchar](30) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21-06-2015 21:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Username] [varchar](25) NOT NULL,
	[Password] [varchar](25) NOT NULL,
	[Sex] [varchar](6) NOT NULL,
	[RoleID] [int] NOT NULL,
	[MobileNumber] [varchar](10) NOT NULL,
	[IsBackGroundVerified] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Photo] [varchar](50) NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 

INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (3, N'apart 2', N'House 2', N'dkjfhdfjd', 1, 1, CAST(0x0000A48D00AFE74C AS DateTime), CAST(0x0000A48D00AFE7F5 AS DateTime), 0, NULL, NULL, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (4, N'apartment 3 ', N'house 3 ', N'dsvfds', 1, 1, NULL, CAST(0x0000A491013AC79C AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (5, N'Apart 4', N'House 4', N'desc 4', 1, 1, CAST(0x0000A48D00B52274 AS DateTime), CAST(0x0000A48D00B52274 AS DateTime), 0, NULL, NULL, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (6, N'Capprt', N'Cat', N'dvkjd', 1, 1, CAST(0x0000A48F015CE62D AS DateTime), CAST(0x0000A48F015CE62D AS DateTime), 0, NULL, NULL, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (7, N'Bapart2', N'jhsj', N'skcd', 1, 1, CAST(0x0000A48F015D075E AS DateTime), CAST(0x0000A48F015D075E AS DateTime), 0, NULL, NULL, 1, 1)
INSERT [dbo].[Apartments] ([ApartmentID], [ApartmentName], [HouseNo], [Description], [Status], [AreaID], [CreatedOn], [LastUpdatedOn], [IsDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [OwnerID]) VALUES (8, N'Apart 7', N'h7', N'd7', 1, 1, CAST(0x0000A49100E0955D AS DateTime), CAST(0x0000A49100E0955D AS DateTime), 0, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Apartments] OFF
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (1, N'Adambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (2, N'Adyar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (3, N'Alandur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (4, N'Alwarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (5, N'Alwarthirunagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (6, N'Ambattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (7, N'Aminjikarai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (8, N'Anakaputhur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (9, N'Anna Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (10, N'Annanur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (11, N'Arakkonam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (12, N'Ashok Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (13, N'Avadi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (14, N'Ayanavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (15, N'Besant Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (16, N'Basin Bridge', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (17, N'Chepauk', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (18, N'Chetput', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (19, N'Chintadripet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (20, N'Chitlapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (21, N'Choolai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (22, N'Choolaimedu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (23, N'Chrompet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (24, N'Egmore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (25, N'Ekkaduthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (26, N'Ennore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (27, N'Foreshore Estate', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (28, N'Fort St. George', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (29, N'George Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (30, N'Government Estate', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (31, N'Guindy', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (32, N'Guduvanchery', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (33, N'IIT Madras', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (34, N'Injambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (35, N'ICF', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (36, N'Iyyapanthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (37, N'Jafferkhanpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (38, N'Karapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (39, N'Kattivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (40, N'Kazhipattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (41, N'K.K. Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (42, N'Keelkattalai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (43, N'Kelambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (44, N'Kilpauk', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (45, N'Kodambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (46, N'Kodungaiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (47, N'Kolathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (48, N'Korattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (49, N'Kottivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (50, N'Kotturpuram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (51, N'Kovalam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (52, N'Kovilambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (53, N'Koyambedu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (54, N'Kundrathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (55, N'Madhavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (56, N'Madhavaram Milk Colony', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (57, N'Madipakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (58, N'Madambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (59, N'Maduravoyal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (60, N'Manali', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (61, N'Manali New Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (62, N'Mangadu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (63, N'Manapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (64, N'Mandaveli', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (65, N'Mathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (66, N'Medavakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (67, N'Minjur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (68, N'Mogappair', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (69, N'MKB Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (70, N'Mount Road', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (71, N'Moolakadai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (72, N'Moulivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (73, N'Mugalivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (74, N'Mylapore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (75, N'Nandanam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (76, N'Nanganallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (77, N'Neelankarai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (78, N'Nesapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (79, N'Nolambur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (80, N'Noombal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (81, N'Nungambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (82, N'Pakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (83, N'Palavakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (84, N'Palavanthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (85, N'Pallavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (86, N'Pallikaranai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (87, N'Pammal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (88, N'Park Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (89, N'Parry''s Corner', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (90, N'Pattabiram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (91, N'PeramburBaracks', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (92, N'Perambur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (93, N'Peravallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (94, N'Perungalathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (95, N'Perungudi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (96, N'Pozhichalur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (97, N'Poonamallee', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (98, N'Porur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (99, N'Pudupet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
GO
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (100, N'Purasaiwalkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (101, N'Puzhal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (102, N'Raj Bhavan', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (103, N'Ramavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (104, N'Red Hills', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (105, N'Royapettah', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (106, N'Royapuram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (107, N'Saidapet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (108, N'Saligramam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (109, N'Santhome', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (110, N'Selaiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (111, N'Shenoy Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (112, N'Sholavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (113, N'Sholinganallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (114, N'Sithalapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (115, N'Sowcarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (116, N'St.Thomas Mount', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (117, N'Tambaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (118, N'Teynampet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (119, N'Tharamani', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (120, N'Theagaraya Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (121, N'Thirumullaivoyal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (122, N'Thiruneermalai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (123, N'Thiruninravur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (124, N'Thiruvanmiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (125, N'Tiruverkadu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (126, N'Thiruvotriyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (127, N'Tirusulam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (128, N'Tiruvallikeni', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (129, N'Tondiarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (130, N'United India Colony', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (131, N'Ullagaram-Puzhuthivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (132, N'Vandalur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (133, N'Vadapalani', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (134, N'Valasaravakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (135, N'Vallalar Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (136, N'Vanagaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (137, N'Velachery', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (138, N'Veppampattu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (139, N'Villivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (140, N'Virugambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (141, N'Vyasarpadi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (142, N'Washermanpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (143, N'West Mambalam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (144, N'Adambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (145, N'Adyar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (146, N'Alandur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (147, N'Alwarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (148, N'Alwarthirunagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (149, N'Ambattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (150, N'Aminjikarai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (151, N'Anakaputhur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (152, N'Anna Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (153, N'Annanur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (154, N'Arakkonam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (155, N'Ashok Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (156, N'Avadi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (157, N'Ayanavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (158, N'Besant Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (159, N'Basin Bridge', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (160, N'Chepauk', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (161, N'Chetput', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (162, N'Chintadripet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (163, N'Chitlapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (164, N'Choolai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (165, N'Choolaimedu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (166, N'Chrompet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (167, N'Egmore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (168, N'Ekkaduthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (169, N'Ennore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (170, N'Foreshore Estate', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (171, N'Fort St. George', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (172, N'George Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (173, N'Government Estate', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (174, N'Guindy', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (175, N'Guduvanchery', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (176, N'IIT Madras', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (177, N'Injambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (178, N'ICF', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (179, N'Iyyapanthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (180, N'Jafferkhanpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (181, N'Karapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (182, N'Kattivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (183, N'Kazhipattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (184, N'K.K. Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (185, N'Keelkattalai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (186, N'Kelambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (187, N'Kilpauk', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (188, N'Kodambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (189, N'Kodungaiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (190, N'Kolathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (191, N'Korattur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (192, N'Kottivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (193, N'Kotturpuram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (194, N'Kovalam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (195, N'Kovilambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (196, N'Koyambedu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (197, N'Kundrathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (198, N'Madhavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (199, N'Madhavaram Milk Colony', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
GO
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (200, N'Madipakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (201, N'Madambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (202, N'Maduravoyal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (203, N'Manali', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (204, N'Manali New Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (205, N'Mangadu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (206, N'Manapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (207, N'Mandaveli', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (208, N'Mathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (209, N'Medavakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (210, N'Minjur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (211, N'Mogappair', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (212, N'MKB Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (213, N'Mount Road', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (214, N'Moolakadai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (215, N'Moulivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (216, N'Mugalivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (217, N'Mylapore', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (218, N'Nandanam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (219, N'Nanganallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (220, N'Neelankarai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (221, N'Nesapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (222, N'Nolambur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (223, N'Noombal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (224, N'Nungambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (225, N'Pakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (226, N'Palavakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (227, N'Palavanthangal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (228, N'Pallavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (229, N'Pallikaranai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (230, N'Pammal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (231, N'Park Town', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (232, N'Parry''s Corner', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (233, N'Pattabiram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (234, N'PeramburBaracks', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (235, N'Perambur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (236, N'Peravallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (237, N'Perungalathur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (238, N'Perungudi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (239, N'Pozhichalur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (240, N'Poonamallee', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (241, N'Porur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (242, N'Pudupet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (243, N'Purasaiwalkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (244, N'Puthagaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (245, N'Puzhal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (246, N'Raj Bhavan', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (247, N'Ramavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (248, N'Red Hills', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (249, N'Royapettah', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (250, N'Royapuram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (251, N'Saidapet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (252, N'Saligramam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (253, N'Santhome', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (254, N'Selaiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (255, N'Shenoy Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (256, N'Sholavaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (257, N'Sholinganallur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (258, N'Sithalapakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (259, N'Sowcarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (260, N'St.Thomas Mount', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (261, N'Tambaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (262, N'Teynampet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (263, N'Tharamani', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (264, N'Theagaraya Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (265, N'Thirumullaivoyal', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (266, N'Thiruneermalai', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (267, N'Thiruninravur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (268, N'Thiruvanmiyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (269, N'Tiruverkadu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (270, N'Thiruvotriyur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (271, N'Tirusulam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (272, N'Tiruvallikeni', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (273, N'Tondiarpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (274, N'United India Colony', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (275, N'Ullagaram-Puzhuthivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (276, N'Vandalur', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (277, N'Vadapalani', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (278, N'Valasaravakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (279, N'Vallalar Nagar', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (280, N'Vanagaram', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (281, N'Velachery', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (282, N'Veppampattu', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (283, N'Villivakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (284, N'Virugambakkam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (285, N'Vyasarpadi', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (286, N'Washermanpet', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
INSERT [dbo].[Areas] ([AreaID], [AreaName], [CityID], [CreatedOn], [LastUpdatedOn]) VALUES (287, N'West Mambalam', 5, CAST(0x0000A46A012B0E67 AS DateTime), CAST(0x0000A46A012B0E67 AS DateTime))
SET IDENTITY_INSERT [dbo].[Areas] OFF
SET IDENTITY_INSERT [dbo].[Beds] ON 

INSERT [dbo].[Beds] ([BedID], [RoomID], [UserID], [Status], [CreatedOn], [LastUpdatedOn], [Bed_Status], [Status_Update_Date]) VALUES (1, 2, 2, 1, CAST(0x0000A4B5002542E6 AS DateTime), CAST(0x0000A4B5002542E6 AS DateTime), 1, CAST(0x0000A4B5002542E6 AS DateTime))
INSERT [dbo].[Beds] ([BedID], [RoomID], [UserID], [Status], [CreatedOn], [LastUpdatedOn], [Bed_Status], [Status_Update_Date]) VALUES (4, 2, 3, 1, CAST(0x0000A4B5002542E6 AS DateTime), CAST(0x0000A4B5002542E6 AS DateTime), 4, CAST(0x0000A4B5002542E6 AS DateTime))
INSERT [dbo].[Beds] ([BedID], [RoomID], [UserID], [Status], [CreatedOn], [LastUpdatedOn], [Bed_Status], [Status_Update_Date]) VALUES (5, 2, 3, 1, CAST(0x0000A4BE01368BD6 AS DateTime), CAST(0x0000A4BE01368BD6 AS DateTime), 2, CAST(0x0000A4BE01368BD6 AS DateTime))
INSERT [dbo].[Beds] ([BedID], [RoomID], [UserID], [Status], [CreatedOn], [LastUpdatedOn], [Bed_Status], [Status_Update_Date]) VALUES (6, 2, 3, 1, CAST(0x0000A4B801368BD6 AS DateTime), CAST(0x0000A4B801368BD6 AS DateTime), 2, CAST(0x0000A4B801368BD6 AS DateTime))
INSERT [dbo].[Beds] ([BedID], [RoomID], [UserID], [Status], [CreatedOn], [LastUpdatedOn], [Bed_Status], [Status_Update_Date]) VALUES (7, 2, 3, 1, CAST(0x0000A4AA01368BD6 AS DateTime), CAST(0x0000A4AA01368BD6 AS DateTime), 2, CAST(0x0000A4AA01368BD6 AS DateTime))
SET IDENTITY_INSERT [dbo].[Beds] OFF
SET IDENTITY_INSERT [dbo].[Blocks] ON 

INSERT [dbo].[Blocks] ([BlockID], [BlockName], [Description], [Status], [ApartmentID], [CreatedOn], [LastUpdatedOn], [isDeleted], [DeletedBy], [DeletedOn], [CreatedBy]) VALUES (1, N'Block1', N'jhjk', 1, 8, CAST(0x0000A49A00CFD830 AS DateTime), CAST(0x0000A49A00CFD830 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Blocks] ([BlockID], [BlockName], [Description], [Status], [ApartmentID], [CreatedOn], [LastUpdatedOn], [isDeleted], [DeletedBy], [DeletedOn], [CreatedBy]) VALUES (2, N'Block2', N'vvv', 1, 8, CAST(0x0000A49A00D003DD AS DateTime), CAST(0x0000A49A00D003DD AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Blocks] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (1, N'Mumbai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (2, N'Delhi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (3, N'Bangalore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (4, N'Hyderabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (5, N'Chennai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (6, N'Ahmedabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (7, N'Pune', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (8, N'Surat', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (9, N'Kolkata', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (10, N'Jaipur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (11, N'Lucknow', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (12, N'Kanpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (13, N'Nagpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (14, N'Indore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (15, N'Thane', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (16, N'Bhopal', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (17, N'Visakhapatnam', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (18, N'Pimpri-Chinchwad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (19, N'Patna', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (20, N'Vadodara', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (21, N'Ghaziabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (22, N'Ludhiana', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (23, N'Agra', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (24, N'Nashik', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (25, N'Faridabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (26, N'Meerut', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (27, N'Rajkot', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (28, N'Kalyan-Dombivali', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (29, N'Vasai-Virar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (30, N'Varanasi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (31, N'Srinagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (32, N'Aurangabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (33, N'Dhanbad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (34, N'Amritsar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (35, N'Navi Mumbai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (36, N'Allahabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (37, N'Ranchi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (38, N'Howrah', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (39, N'Coimbatore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (40, N'Jabalpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (41, N'Gwalior', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (42, N'Vijayawada', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (43, N'Jodhpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (44, N'Madurai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (45, N'Raipur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (46, N'Kota', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (47, N'Guwahati', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (48, N'Chandigarh', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (49, N'Solapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (50, N'Hubballi-Dharwad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (51, N'Bareilly', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (52, N'Moradabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (53, N'Mysore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (54, N'Gurgaon', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (55, N'Aligarh', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (56, N'Jalandhar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (57, N'Tiruchirappalli', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (58, N'Bhubaneswar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (59, N'Salem', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (60, N'Mira-Bhayandar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (61, N'Trivandrum', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (62, N'Bhiwandi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (63, N'Saharanpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (64, N'Gorakhpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (65, N'Guntur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (66, N'Bikaner', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (67, N'Amravati', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (68, N'Noida', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (69, N'Jamshedpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (70, N'Bhilai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (71, N'Warangal', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (72, N'Cuttack', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (73, N'Firozabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (74, N'Kochiá(Cochin)', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (75, N'Bhavnagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (76, N'Dehradun', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (77, N'Durgapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (78, N'Asansol', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (79, N'Nanded', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (80, N'Kolhapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (81, N'Ajmer', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (82, N'Gulbarga', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (83, N'Jamnagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (84, N'Ujjain', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (85, N'Loni', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (86, N'Siliguri', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (87, N'Jhansi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (88, N'Ulhasnagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (89, N'Nellore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (90, N'Jammu', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (91, N'Sangli-Miraj & Kupwad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (92, N'Belgaum', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (93, N'Mangalore', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (94, N'Ambattur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (95, N'Tirunelveli', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (96, N'Malegaon', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (97, N'Gaya', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (98, N'Jalgaon', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (99, N'Udaipur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
GO
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (100, N'Maheshtala', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (101, N'Tirupur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (102, N'Davanagere', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (103, N'Kozhikodeá(Calicut)', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (104, N'Akola', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (105, N'Kurnool', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (106, N'Rajpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (107, N'Sonarpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (108, N'Bokaro', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (109, N'South Dumdum', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (110, N'Bellary', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (111, N'Patiala', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (112, N'Gopalpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (113, N'Agartala', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (114, N'Bhagalpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (115, N'Muzaffarnagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (116, N'Bhatpara', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (117, N'Panihati', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (118, N'Latur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (119, N'Dhule', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (120, N'Rohtak', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (121, N'Korba', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (122, N'Bhilwara', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (123, N'Brahmapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (124, N'Muzaffarpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (125, N'Ahmednagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (126, N'Mathura', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (127, N'Kollamá(Quilon)', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (128, N'Avadi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (129, N'Rajahmundry', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (130, N'Kadapa', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (131, N'Kamarhati', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (132, N'Bilaspur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (133, N'Shahjahanpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (134, N'Bijapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (135, N'Rampur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (136, N'Shivamoggaá(Shimoga)', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (137, N'Chandrapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (138, N'Junagadh', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (139, N'Thrissur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (140, N'Alwar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (141, N'Bardhaman', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (142, N'Kulti', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (143, N'Kakinada', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (144, N'Nizamabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (145, N'Parbhani', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (146, N'Tumkur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (147, N'Hisar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (148, N'Ozhukarai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (149, N'Bihar Sharif', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (150, N'Panipat', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (151, N'Darbhanga', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (152, N'Bally', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (153, N'Aizawl', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (154, N'Dewas', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (155, N'Ichalkaranji', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (156, N'Tirupati', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (157, N'Karnal', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (158, N'Bathinda', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (159, N'Jalna', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (160, N'Barasat', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (161, N'Kirari Suleman Nagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (162, N'Purnia', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (163, N'Satna', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (164, N'Mau', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (165, N'Sonipat', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (166, N'Farrukhabad', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (167, N'Sagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (168, N'Rourkela', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (169, N'Durg', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (170, N'Imphal', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (171, N'Ratlam', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (172, N'Hapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (173, N'Anantapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (174, N'Arrah', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (175, N'Karimnagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (176, N'Etawah', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (177, N'Ambernath', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (178, N'North Dumdum', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (179, N'Bharatpur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (180, N'Begusarai', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (181, N'New Delhi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (182, N'Gandhidham', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (183, N'Baranagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (184, N'Tiruvottiyur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (185, N'Puducherry', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (186, N'Sikar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (187, N'Thoothukudi', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (188, N'Rewa', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (189, N'Mirzapur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (190, N'Raichur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (191, N'Pali', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (192, N'Ramagundam', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (193, N'Vizianagaram', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (194, N'Katihar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (195, N'Haridwar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (196, N'Sri Ganganagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (197, N'Karawal Nagar', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (198, N'Nagercoil', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (199, N'Mango', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
GO
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (200, N'Bulandshahr', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (201, N'Thanjavur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
INSERT [dbo].[Cities] ([CityID], [CityName], [CountryID], [CreatedOn], [LastUpdatedOn]) VALUES (202, N'Gangarampur', 1, CAST(0x0000A46A012B5829 AS DateTime), CAST(0x0000A46A012B5829 AS DateTime))
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [CountryName], [CreatedOn], [LastUpdatedOn]) VALUES (1, N'India', CAST(0x0000A46A012B61B3 AS DateTime), CAST(0x0000A46A012B61B3 AS DateTime))
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Houses] ON 

INSERT [dbo].[Houses] ([HouseID], [HouseName], [Description], [Status], [OwnerID], [BlockID], [CreatedOn], [LastUpdatedOn], [LinkID], [LinkTypeID], [isDeleted], [DeletedBy], [DeletedOn], [CreatedBy], [DisplayName]) VALUES (1, N'F1', N'Houses', 1, 1, NULL, NULL, NULL, 1, 2, 0, NULL, NULL, 1, N'Ganesh PG')
SET IDENTITY_INSERT [dbo].[Houses] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedOn], [LastUpdatedOn]) VALUES (1, N'SuperAdmin', CAST(0x0000A47E00D8EAF1 AS DateTime), CAST(0x0000A47E00D8EAF1 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedOn], [LastUpdatedOn]) VALUES (2, N'Owner', CAST(0x0000A47E00D8EAF1 AS DateTime), CAST(0x0000A47E00D8EAF1 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedOn], [LastUpdatedOn]) VALUES (3, N'EndUser', CAST(0x0000A47E00D8EAF1 AS DateTime), CAST(0x0000A47E00D8EAF1 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedOn], [LastUpdatedOn]) VALUES (11, N'AdminEmployee', CAST(0x0000A47E00D8EAF1 AS DateTime), CAST(0x0000A47E00D8EAF1 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [CreatedOn], [LastUpdatedOn]) VALUES (21, N'OwnerEmployee', CAST(0x0000A47E00D8EAF1 AS DateTime), CAST(0x0000A47E00D8EAF1 AS DateTime))
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [HouseID], [RoomNumber], [CreatedOn], [LastUpdatedOn], [Status], [Monthly_Rent], [No_of_Beds], [Deposit]) VALUES (2, 1, N'1', CAST(0x0000A4B5002542E6 AS DateTime), CAST(0x0000A4B5002542E6 AS DateTime), 1, N'7000', 5, N'5000')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Username], [Password], [Sex], [RoleID], [MobileNumber], [IsBackGroundVerified], [CreatedBy], [CreatedOn], [LastUpdatedOn], [Status], [Photo], [ManagerID]) VALUES (1, N'Liakat', N'Mondol', N'lia@g.com', N'passw0rd!', N'Male', 1, N'9176760905', 1, 1, CAST(0x0000A487002542E6 AS DateTime), CAST(0x0000A487002542E6 AS DateTime), 1, NULL, 1)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Username], [Password], [Sex], [RoleID], [MobileNumber], [IsBackGroundVerified], [CreatedBy], [CreatedOn], [LastUpdatedOn], [Status], [Photo], [ManagerID]) VALUES (2, N'Susmita', N'Biswas', N'sus@gmail.com', N'password', N'Female', 3, N'8939381972', 1, 2, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Username], [Password], [Sex], [RoleID], [MobileNumber], [IsBackGroundVerified], [CreatedBy], [CreatedOn], [LastUpdatedOn], [Status], [Photo], [ManagerID]) VALUES (3, N'Ali', N'Mondol', N'ali@gmail.com', N'password', N'Male', 3, N'9051979204', 1, 1, NULL, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_AreaID] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Areas] ([AreaID])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_AreaID]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_OwnerID]
GO
ALTER TABLE [dbo].[Areas]  WITH NOCHECK ADD  CONSTRAINT [FK_Areas_CityID] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_CityID]
GO
ALTER TABLE [dbo].[BasicAmenities]  WITH CHECK ADD  CONSTRAINT [FK__Basic_Amenities__Houses] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO
ALTER TABLE [dbo].[BasicAmenities] CHECK CONSTRAINT [FK__Basic_Amenities__Houses]
GO
ALTER TABLE [dbo].[Beds]  WITH CHECK ADD  CONSTRAINT [FK_Beds_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Beds] CHECK CONSTRAINT [FK_Beds_RoomID]
GO
ALTER TABLE [dbo].[Beds]  WITH CHECK ADD  CONSTRAINT [FK_Beds_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Beds] CHECK CONSTRAINT [FK_Beds_UserID]
GO
ALTER TABLE [dbo].[Blocks]  WITH CHECK ADD  CONSTRAINT [FK_Blocks_ApartmentID] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartments] ([ApartmentID])
GO
ALTER TABLE [dbo].[Blocks] CHECK CONSTRAINT [FK_Blocks_ApartmentID]
GO
ALTER TABLE [dbo].[Cities]  WITH NOCHECK ADD  CONSTRAINT [FK_Cities_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_CountryID]
GO
ALTER TABLE [dbo].[HouseDescriptions]  WITH CHECK ADD  CONSTRAINT [FK_HouseDescriptions_HouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO
ALTER TABLE [dbo].[HouseDescriptions] CHECK CONSTRAINT [FK_HouseDescriptions_HouseID]
GO
ALTER TABLE [dbo].[HouseImages]  WITH CHECK ADD  CONSTRAINT [FK_HouseImages_HouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO
ALTER TABLE [dbo].[HouseImages] CHECK CONSTRAINT [FK_HouseImages_HouseID]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK__Rooms__HouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK__Rooms__HouseID]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [PK_UserDetails_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [PK_UserDetails_UserID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_RoleID]
GO
USE [master]
GO
ALTER DATABASE [LYSAdmin] SET  READ_WRITE 
GO
