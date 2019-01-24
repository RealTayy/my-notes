-- Tables:
-- * ClientAudit with columns ClientID int, ClientName nvarchar(200),UserID nvarchar(200), Action nvarchar(20), ActionTime datetime

-- #7: What is the purpose of the following trigger?
-- CREATE TRIGGER trgAfterInsert ON [dbo].[Clients] 
-- FOR INSERT
-- AS
-- 	declare @ClientID int;
-- 	declare @ClientName nvarchar(200);	
	
-- select @ClientID=i.ClientID from inserted i;	
-- select @ClientName=i.ClientName from inserted i;	
-- insert into ClientAudit (ClientID, ClientName, UserID, Action, ActionTime)
-- values (@ClientID, @ClientName, SUSER_SNAME(),‘Inserted’, getdate())

-- #8: Any comment about the Insert trigger above? How can we capture changes to Clients?
