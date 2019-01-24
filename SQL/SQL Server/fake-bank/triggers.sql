USE FAKEBANK
GO
CREATE TRIGGER tr_transactions_AIU
    ON transactions
    FOR INSERT, UPDATE
AS
BEGIN
    DECLARE
        @amount DECIMAL(18,4),
        @accountID INT
    SELECT
        @amount = amount,
        @accountID = accountID
        FROM INSERTED
    -- Update account balance
    UPDATE accounts
    SET    balance = (balance + @amount)
    WHERE  ID = @accountID
END
GO