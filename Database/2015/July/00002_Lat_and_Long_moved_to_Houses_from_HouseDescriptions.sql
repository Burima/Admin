Use [LYSAdmin]
/*------ remove Lat n Long from HouseDescroptions-------------*/
alter table HouseDescriptions
drop column Latitude
go
alter table HouseDescriptions
drop column Longitude
go
/*------ add Lat n Long from Houses with longer precesion------------*/
alter table Houses
add Latitude decimal(30,25)
go
alter table Houses
add Longitude decimal(30,25)
go