USE [LYSAdmin]
GO

ALTER TABLE [dbo].[HouseAmenities] DROP CONSTRAINT [FK__House_Amenities__Houses]
GO

/****** Object:  Table [dbo].[HouseAmenities]    Script Date: 27-06-2015 21:23:43 ******/
DROP TABLE [dbo].[HouseAmenities]
GO

/****** Object:  Table [dbo].[HouseAmenities]    Script Date: 27-06-2015 21:23:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HouseAmenities](
	[AminityID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[AC] [bit] NULL,
	[Fridge] [bit] NULL,
	[Wifi] [bit] NULL,
	[Washingmachine] [bit] NULL,
	[AttachBathrooms] [bit] NULL,
	[KitchenFacilityWithGas] [bit] NULL,
	[CommonTV] [bit] NULL,
	[IndividualTV] [bit] NULL,
	[LCDTVCableConnection] [bit] NULL,
	[Wardrobes] [bit] NULL,
	[IntercomFacility] [bit] NULL,
	[IroningWashingServices] [bit] NULL,
	[LunchGiven] [bit] NULL,
	[BreakFastGiven] [bit] NULL,
	[DinnerGiven] [bit] NULL,	
	[WaterSupply] [bit] NULL,
	[HotColdWaterSupply] [bit] NULL,
	[MineralDrinkingWater] [bit] NULL,
	[Aquaguard] [bit] NULL,
	[Housekeeping] [bit] NULL,	
	[RoomService] [bit] NULL,	
	[Newspaper] [bit] NULL,
	[TwoWheelerOpenParking] [bit] NULL,	
	[TwoWheelerCloseParking] [bit] NULL,
	[FourWheelerOpenParking] [bit] NULL,
	[FourWheelerCloseParking] [bit] NULL,	
	[Lockers] [bit] NULL,	
	[GYM] [bit] NULL,
	[Lift] [bit] NULL,	
	[Playground] [bit] NULL,
	[Clubhouse] [bit] NULL,
	[Partyhall] [bit] NULL,	
	[Security] [bit] NULL,
	[SwimmingPool] [bit] NULL,
	[VideoSurveillance] [bit] NULL,	
	[Powerbackup] [bit] NULL,	
	[EmergencyMedicalServices] [bit] NULL,	
	[NonVegAllowed] [bit] NULL,
	[GuardianEntry] [bit] NULL,
	[NoSmoking] [bit] NULL,
	[NoDrinking] [bit] NULL,
	[NoBoysEntry] [bit] NULL,	
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
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


