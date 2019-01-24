USE FAKEBANK
GO

SELECT *
    FROM accounts
    WHERE  ID = 1
GO

INSERT INTO transactions
    (accountID, amount )
VALUES
    (1, 150.00)
GO

SELECT *
FROM accounts
WHERE  ID = 1
GO