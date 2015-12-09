USE [LYSAdmin]
GO

ALTER TABLE [dbo].[Beds] DROP CONSTRAINT [FK_Beds_UserID]
GO

ALTER TABLE [dbo].[Beds] DROP CONSTRAINT [FK_Beds_RoomID]
GO

/****** Object:  Table [dbo].[Beds]    Script Date: 27-06-2015 16:07:56 ******/
DROP TABLE [dbo].[Beds]
GO