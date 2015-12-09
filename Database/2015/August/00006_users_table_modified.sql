alter table Users
drop column Photo
go
alter table Users
add  ProfilePicture Varbinary(max) null
go
alter table Users
drop column Sex
go
alter table Users
add Gender int null