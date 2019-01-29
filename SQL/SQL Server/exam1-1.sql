USE SQLTUTORIAL
-- SQL Designs:
-- Tables:
-- Invoices with columns [InvoiceNumber] int, [Amount] float, [ClientID] int not null
-- Clients with columns [ClientID] int, [ClientName] nvarchar(200)

-- #1: How do we design the Invoices table so that
-- a.	it does not contain negative Amount?
-- b.	it does not contain ClientID that not exists in Clients?
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
	ClientID int primary key,
	ClientName nvarchar(200)
);
GO
CREATE TABLE Invoices (
	InvoiceNumber int,
	Amount float,
	ClientID int not null REFERENCES Clients(ClientID), -- #1b
	CONSTRAINT CHK_NoNegatives
	CHECK ( InvoiceNumber >= 0 -- #1a
			AND Amount >= 0
			AND ClientID >= 0 )
);  
GO

INSERT INTO Clients
(ClientID,	ClientName)
VALUES
(1,			'Young'),
(2,			'Tay'),
(3,			'Tay'),
(4,			NULL)

INSERT INTO Invoices
(InvoiceNumber,	Amount,		ClientID)
VALUES
(1,				5000000.00,	1),
(2,				15000.00,	1),
(3,				2000.00,	2),
(4,				500.00,		2),
(5,				999.00,		3),
(5,				9000.00,	3),
(5,				1000.00,	4)
GO

 -- SQL Queries:
-- #2: List invoice number, amount and client name for all invoices
SELECT i.InvoiceNumber, i.Amount, c.ClientName
  FROM Invoices i
  LEFT OUTER JOIN Clients c
    ON i.ClientID = c.ClientID

-- #3: If not all clients are in the Clients table
-- a.	List all invoices and their amount and get the ClientName on the ones you have the information for?
SELECT i.InvoiceNumber, i.Amount, c.ClientName
  FROM Invoices i
  LEFT OUTER JOIN Clients c
    ON i.ClientID = c.ClientID
 WHERE c.ClientName IS NOT NULL

-- b.	List Invoices where ClientName is unknown
SELECT i.InvoiceNumber, i.Amount, c.ClientName
  FROM Invoices i
  LEFT OUTER JOIN Clients c
    ON i.ClientID = c.ClientID
 WHERE c.ClientName IS NULL

-- #4: List client name and sum of invoices for all clients
SELECT c.ClientID, c.ClientName, SUM(AMOUNT) as SumOfInvoices
  FROM Clients c
  LEFT OUTER JOIN Invoices i
    ON c.ClientID = i.ClientID
 GROUP BY c.ClientID, c.ClientName

-- #5: Assume all clients are present in the Clients table. Give me a list of all client names where sum of their invoices > 1,000,000
SELECT c.ClientID, c.ClientName, SUM(AMOUNT) SumOfInvoices
  FROM Clients c
  LEFT OUTER JOIN Invoices i
    ON c.ClientID = i.ClientID
 GROUP BY c.ClientID, c.ClientName
HAVING SUM(AMOUNT) > 1000000 -- IDK how to refer to alias(SumOfInvoices) instead of SUM(AMOUNT)

-- #6: How would you return the 3rd largest invoice?
SELECT *
  FROM Invoices i
 ORDER BY Amount
OFFSET 2 ROWS
 FETCH NEXT 1 ROWS ONLY

 -- Tables:
-- * ClientAudit with columns ClientID int, ClientName nvarchar(200),UserID nvarchar(200), Action nvarchar(20), ActionTime datetime
DROP TABLE IF EXISTS ClientAudit
CREATE TABLE ClientAudit (
  ClientID int,
  ClientName nvarchar(200),
  UserID nvarchar(200),
  Action nvarchar(20),
  ActionTime datetime
);
GO

-- #7: What is the purpose of the following trigger?
CREATE TRIGGER trgAfterInsert ON [dbo].[Clients] -- Creates a trigger on Clients table.
FOR INSERT -- Trigger runs after inserting into Clients.
AS         -- I don't know what this does. It's just part of trigger synthax?
	declare @ClientID int; -- Create local int variable named @ClientID .
	declare @ClientName nvarchar(200); -- Create local nvarvhar named @ClientName with 200 char limit.
	
select @ClientID=i.ClientID from inserted i;     -- Set @ClientID to inserted row's ClientID field.
select @ClientName=i.ClientName from inserted i; -- Set @ClientName to inserted row's ClientName field	.
insert into ClientAudit (ClientID, ClientName, UserID, Action, ActionTime) -- Start insert into ClientAudit Table.
values (@ClientID, @ClientName, SUSER_SNAME(),'Inserted', getdate())       -- Insert Client ID/Name, SID of person inserting, and DATETIME of when.
GO

-- #8: Any comment about the Insert trigger above? How can we capture changes to Clients?
CREATE TRIGGER trgAfterInsertUpdate ON [dbo].[Clients]
FOR INSERT, UPDATE
AS
	declare @ClientID int;
	declare @ClientName nvarchar(200);
    declare @Action varchar(200);

set @Action = IIF(EXISTS(SELECT * FROM deleted), 'Updated', 'Inserted');
select @ClientID=i.ClientID, @ClientName=i.ClientName from inserted i;
insert into ClientAudit (ClientID, ClientName, UserID, Action, ActionTime)
values (@ClientID, @ClientName, SUSER_SNAME(), @Action, getdate());
GO

-- THIS IS REFACTORED
CREATE TRIGGER trgAfterInsertUpdate ON [dbo].[Clients]
FOR INSERT, UPDATE
AS declare @Action varchar(200);

set @Action = IIF(EXISTS(SELECT * FROM deleted), 'Updated', 'Inserted');

insert into ClientAudit (ClientID, ClientName, UserID, Action, ActionTime)
select i.ClientID, i.ClientName, SUSER_SNAME(), @Action, getdate() from inserted i;
GO