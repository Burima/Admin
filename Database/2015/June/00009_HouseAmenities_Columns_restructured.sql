USE [LYSAdmin]
GO

ALTER TABLE [dbo].[HouseAmenities] DROP CONSTRAINT [FK__House_Amenities__Houses]
GO

/****** Object:  Table [dbo].[BasicAmenities]    Script Date: 27-06-2015 13:50:14 ******/
DROP TABLE [dbo].[HouseAmenities]
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
	[TwoWheelerOpenParking] [bit] NULL,
	[Wifi] [bit] NULL,
	[RoomService] [bit] NULL,
	[Fridge] [bit] NULL,
	[WaterSupply] [bit] NULL,
	[Wardrobes] [bit] NULL,
	[GYM] [bit] NULL,
	[Partyhall] [bit] NULL,
	[FourWheelerOpenParking] [bit] NULL,
	[CommonTV] [bit] NULL,
	[Housekeeping] [bit] NULL,
	[Washingmachine] [bit] NULL,
	[HotColdWaterSupply] [bit] NULL,
	[Lockers] [bit] NULL,
	[SwimmingPool] [bit] NULL,
	[Lift] [bit] NULL,
	[AttachBathrooms] [bit] NULL,
	[TwoWheelerCloseParking] [bit] NULL,
	[IndividualTV] [bit] NULL,
	[Security] [bit] NULL,
	[Newspaper] [bit] NULL,
	[MineralDrinkingWater] [bit] NULL,
	[IntercomFacility] [bit] NULL,
	[Playground] [bit] NULL,
	[Clubhouse] [bit] NULL,
	[Powerbackup] [bit] NULL,
	[FourWheelerCloseParking] [bit] NULL,
	[LCDTVCableConnection] [bit] NULL,
	[EmergencyMedicalServices] [bit] NULL,
	[IroningWashingServices] [bit] NULL,
	[Aquaguard] [bit] NULL,
	[VideoSurveillance] [bit] NULL,
	[KitchenFacilityWithGas] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LunchGiven] [bit] NULL,
	[BreakFastGiven] [bit] NULL,
	[DinnerGiven] [bit] NULL,
	[GuardianEntry] [bit] NULL,
	[NonVegAllowed] [bit] NULL,
	[NoSmoking] [bit] NULL,
	[NoDrinking] [bit] NULL,
	[NoBoysEntry] [bit] NULL,
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


