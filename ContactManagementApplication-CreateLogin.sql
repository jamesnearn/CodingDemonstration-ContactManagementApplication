USE [master]
GO
CREATE LOGIN [cma] WITH PASSWORD=N'123', DEFAULT_DATABASE=[ContactManagementApplication], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [ContactManagementApplication]
GO
CREATE USER [cma] FOR LOGIN [cma]
GO
USE [ContactManagementApplication]
GO
EXEC sp_addrolemember N'db_datareader', N'cma'
GO
USE [ContactManagementApplication]
GO
EXEC sp_addrolemember N'db_datawriter', N'cma'
GO
USE [ContactManagementApplication]
GO
EXEC sp_addrolemember N'db_owner', N'cma'
GO
