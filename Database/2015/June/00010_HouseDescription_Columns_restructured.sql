USE [LYSAdmin]
GO

ALTER TABLE [dbo].[HouseDescriptions] DROP CONSTRAINT [FK_HouseDescriptions_HouseID]
GO

/****** Object:  Table [dbo].[HouseDescriptions]    Script Date: 27-06-2015 18:39:29 ******/
DROP TABLE [dbo].[HouseDescriptions]
GO

/****** Object:  Table [dbo].[HouseDescriptions]    Script Date: 27-06-2015 18:39:29 ******/
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
	[NoOfRooms] [int] NOT NULL,
	[NoOfBathrooms] [int] NOT NULL,
	[NoOfBalconnies] [int] NULL,
	[Latitude] [decimal](9, 6) NOT NULL,
	[Longitude] [decimal](9, 6) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
 CONSTRAINT [PK__House_Description] PRIMARY KEY CLUSTERED 
(
	[DescrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[HouseDescriptions]  WITH CHECK ADD  CONSTRAINT [FK_HouseDescriptions_HouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO

ALTER TABLE [dbo].[HouseDescriptions] CHECK CONSTRAINT [FK_HouseDescriptions_HouseID]
GO


