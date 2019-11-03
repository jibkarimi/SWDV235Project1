

--Create and drop if exist db
DROP DATABASE IF EXISTs JibBussiness
Create database JibBussiness;
GO
Use JibBussiness;
GO

--Create visitor table:
CREATE TABLE [dbo].[visitor](
[Visitor_ID]      int identity(1,1) NOT NULL Primary KEY,
[visitor_name]    [nchar](50) NOT NULL,
[visitor_email]   [nchar](50) NOT NULL,
[visitor_phone]   [nchar](50) NOT NULL,
[SuitType]        [varchar] (50) NOT NULL,
[HeardVia]        [varchar](50) NOT NULL,
[visitor_Comment] [nchar](200) NOT NULL,
) ON [PRIMARY]

GO

--creating stored proc
create procedure InsertVisitor
@visitor_name nchar(50),
@visitor_email nchar(50),
@visitor_phone nchar(50),
@SuitType varchar (50),
@HeardVia varchar (50),
@visitor_Comment nchar(200)
as
INSERT INTO [dbo].[visitor]
           ([visitor_name],
            [visitor_email],
            [visitor_phone],
			[SuitType],
		    [HeardVia],
		    [visitor_Comment])
     VALUES
		   (@visitor_name,
			@visitor_email,
			@visitor_phone,
			@SuitType,
			@HeardVia,
			@visitor_Comment)
GO

--stor proc test
execute InsertVisitor "JIB", "JIB@gmail.com", "2089999999","FIX", "Fcaebook", "This is a message for JIB";

--creating login
CREATE LOGIN [JIB] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[JibBussiness]
go

use JibBussiness
go

--create user
CREATE USER [JIB] FOR LOGIN [JIB] WITH DEFAULT_SCHEMA=[dbo]
GO

--grant insertVisotor permisison to user
grant execute on InsertVisitor to JIB
go

select * from visitor;