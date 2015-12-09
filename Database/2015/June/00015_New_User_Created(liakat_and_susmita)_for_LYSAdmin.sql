USE [master];
GO
--Create a server-level login named liakat with password l0cky0urstay007
CREATE LOGIN [susmita] WITH PASSWORD = 'l0cky0urstay007';

--Create a server-level login named susmita with password l0cky0urstay007
CREATE LOGIN [susmita] WITH PASSWORD = 'l0cky0urstay007';
GO


--Set context to msdb database
USE [LYSAdmin];
GO
--Create a database user named liakat and link it to server-level login liakat
CREATE USER [liakat] FOR LOGIN [liakat];
GO
--Added database user liakat in msdb to db_owner in msdb
EXEC sp_addrolemember [db_owner], [liakat];

--Create a database user named theirname and link it to server-level login theirname
CREATE USER [susmita] FOR LOGIN [susmita];
GO
--Added database user susmita in msdb to db_owner in msdb
EXEC sp_addrolemember [db_owner], [susmita];
        