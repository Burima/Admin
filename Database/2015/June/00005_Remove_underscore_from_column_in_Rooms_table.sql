USE [LYSAdmin]
GO

ALTER TABLE [dbo].[Rooms] DROP CONSTRAINT [FK__Rooms__HouseID]
GO

/****** Object:  Table [dbo].[Rooms]    Script Date: 27-06-2015 14:25:07 ******/
DROP TABLE [dbo].[Rooms]
GO


/****** Object:  Table [dbo].[Rooms]    Script Date: 27-06-2015 14:25:07 ******/
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
	[MonthlyRent] [varchar](20) NOT NULL,
	[NoOfBeds] [int] NOT NULL,
	[Deposit] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK__Rooms__HouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[Houses] ([HouseID])
GO

ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK__Rooms__HouseID]
GO



