--adding OwnerID column in PgInfos table
alter table pginfos
add OwnerID int not null

--adding foreign key in PgInfos table
alter table pginfos
add constraint FK_PgInfos_OwnerID foreign key(OwnerID) references Users(UserID)

