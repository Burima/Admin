USE [LYSAdmin]
GO

ALTER TABLE [dbo].[BasicAmenities] DROP CONSTRAINT [FK__Basic_Amenities__Houses]
GO

/****** Object:  Table [dbo].[BasicAmenities]    Script Date: 27-06-2015 13:50:14 ******/
DROP TABLE [dbo].[BasicAmenities]
GO

/****** Object:  Table [dbo].[BasicAmenities]    Script Date: 27-06-2015 13:50:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HouseAmenities](
	[AminityID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[AC] [bit] NULL,
	[Twowheeleropenparking] [bit] NULL,
	[Wifi] [bit] NULL,
	[Roomservice] [bit] NULL,
	[Fridge] [bit] NULL,
	[Watersupply] [bit] NULL,
	[Wardrobes] [bit] NULL,
	[GYM] [bit] NULL,
	[Partyhall] [bit] NULL,
	[Fourwheeleropenparking] [bit] NULL,
	[Commontv] [bit] NULL,
	[Housekeeping] [bit] NULL,
	[Washingmachine] [bit] NULL,
	[Hotcoldwatersupply] [bit] NULL,
	[Lockers] [bit] NULL,
	[Swimming_pool] [bit] NULL,
	[Lift] [bit] NULL,
	[Attachbathrooms] [bit] NULL,
	[Twowheelercloseparking] [bit] NULL,
	[Individualtv] [bit] NULL,
	[Security] [bit] NULL,
	[Newspaper] [bit] NULL,
	[Mineraldrinkingwater] [bit] NULL,
	[Intercomfacility] [bit] NULL,
	[Playground] [bit] NULL,
	[Clubhouse] [bit] NULL,
	[Powerbackup] [bit] NULL,
	[Fourwheelercloseparking] [bit] NULL,
	[LCDtvcableconnection] [bit] NULL,
	[Emergencymedicalservices] [bit] NULL,
	[Ironingwashingservices] [bit] NULL,
	[Aquaguard] [bit] NULL,
	[Videosurveillance] [bit] NULL,
	[Kitchenfacilitywithgas] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[Lunchgiven] [bit] NULL,
	[BreakFastgiven] [bit] NULL,
	[Dinnergiven] [bit] NULL,
	[Guardianentry] [bit] NULL,
	[NonVegallowed] [bit] NULL,
	[Nosmoking] [bit] NULL,
	[Nodrinking] [bit] NULL,
	[Noboysentry] [bit] NULL,
 CONSTRAINT [PK__House_Amenities] PRIMARY KEY CLUSTERED 
(
	[AminityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[HouseAmenities]  WITH CHECK ADD  CONSTRAINT [FK__House_Amenities__Houses] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO

ALTER TABLE [dbo].[HouseAmenities] CHECK CONSTRAINT [FK__House_Amenities__Houses]
GO


