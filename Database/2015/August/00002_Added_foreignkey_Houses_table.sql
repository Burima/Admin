USE [LYSAdmin]
GO
EXEC sp_rename 'Houses.PGInfoId', 'PGDetailID', 'COLUMN';
GO

EXEC sp_rename 'PGDetails.PGdetailID', 'PGDetailID', 'COLUMN';
GO

ALTER TABLE Houses
ADD CONSTRAINT FK_Houses_PGDetailID FOREIGN KEY(PGDetailID) REFERENCES PGDetails(PGDetailID)
GO