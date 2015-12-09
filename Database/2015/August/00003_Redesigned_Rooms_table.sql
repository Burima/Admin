ALTER TABLE Beds
DROP CONSTRAINT FK_Beds_RoomID 
GO

ALTER TABLE Rooms
DROP CONSTRAINT FK__Rooms__HouseID
GO

DROP TABLE Rooms
GO

CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[MonthlyRent] [int] NOT NULL,
	[Deposit] [int] NOT NULL,
	[NoOfBeds] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
)
GO

ALTER TABLE Rooms
ADD CONSTRAINT PK_Rooms_RoomID PRIMARY KEY (RoomID)
GO

ALTER TABLE Rooms
ADD CONSTRAINT FK_Rooms_HouseID FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
GO

ALTER TABLE Beds
ADD CONSTRAINT FK_Beds_RoomID FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
GO