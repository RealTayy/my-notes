USE FAKEBANK
GO

-- Trigger for customers_AIU
CREATE OR ALTER TRIGGER tr_customers_AIU
    ON customers
    FOR INSERT, UPDATE
AS declare @Action varchar(20);
SET @Action = IIF(EXISTS(SELECT * FROM deleted), 'Updated', 'Inserted');
BEGIN
    -- Insert into customersAudit
    INSERT INTO customersAudit
        (customerID, customerFirstName, customerLastName, userID, action, actionTime)
    SELECT
        i.ID, i.firstName, i.lastName, SUSER_SNAME(), @Action, IIF(EXISTS(SELECT i.madeAt), i.madeAt, GETDATE())
    FROM INSERTED i
END
GO

-- Trigger for accounts_AIU
CREATE OR ALTER TRIGGER tr_accounts_AIU
    ON accounts
    FOR INSERT, UPDATE
AS declare @Action varchar(20);
SET @Action = IIF(EXISTS(SELECT * FROM deleted), 'Updated', 'Inserted');
BEGIN
    -- Insert into accountsAudit
    INSERT INTO accountsAudit
        (accountID, accountType, userID, action, actionTime)
    SELECT
        i.ID, i.accountType, SUSER_SNAME(), @Action, IIF(EXISTS(SELECT i.madeAt), i.madeAt, GETDATE())
    FROM INSERTED i
END
GO

-- Trigger for transactions_AIU
CREATE OR ALTER TRIGGER tr_transactions_AIU
    ON transactions
    FOR INSERT, UPDATE
AS declare @Action varchar(20);
SET @Action = IIF(EXISTS(SELECT * FROM deleted), 'Updated', 'Inserted');
BEGIN
    -- Insert into transactionsAudit
    INSERT INTO transactionsAudit
        (transactionID, transactionAmount, accountID, userID, action, actionTime)
    SELECT
        i.ID, i.amount, i.accountID, SUSER_SNAME(), @Action, IIF(EXISTS(SELECT i.madeAt), i.madeAt, GETDATE())
    FROM INSERTED i

    -- Update relevant account balance
    UPDATE accounts
	SET balance += i.totalAmount
	FROM (SELECT i.accountID, SUM(i.amount) totalAmount
        FROM INSERTED i
        GROUP BY i.accountID) i
	WHERE accounts.ID = i.accountID
END
GO
