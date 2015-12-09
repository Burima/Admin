--Changed PgInfos table into PGDetails
use[LYSAdmin]
go
drop table PgInfos
go
Create Table PGDetails
(
PGdetailID int not null,
PGName varchar(50) not null,
AreaID int not null,
OwnerID int not null

CONSTRAINT PK_PGDetails_PGDetailID PRIMARY KEY(PGdetailID),
CONSTRAINT FK_PGDetails_AreaID FOREIGN KEY (AreaID) REFERENCES Areas(AreaID),
CONSTRAINT FK_PGDetails_OwnerID FOREIGN KEY (OwnerID) REFERENCES Users(UserID),
)