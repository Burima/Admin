
INSERT [dbo].[Users] ([UserID],[FirstName],[LastName],[Username],[Password],[Sex],[RoleID],[MobileNumber],[IsBackGroundVerified],[CreatedBy],[CreatedOn],[LastUpdatedOn],[Status],[Photo],[ManagerID]) 
       VALUES (0, N'Default',N'Default',N'Default',N'Default',1,1,3232,1,1,getdate(),getdate(),1,N'Default',1)

SET IDENTITY_INSERT [dbo].[Users] OFF