USE FAKEBANK
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers
(
    ID INT PRIMARY KEY IDENTITY,
    firstName VARCHAR(200) NOT NULL,
    lastName VARCHAR(200) NOT NULL,
    madeAt DATETIME DEFAULT GETDATE()
)

CREATE TABLE accounts
(
    ID INT PRIMARY KEY IDENTITY,
    customerID INT REFERENCES customers(ID),
    balance DECIMAL(18,4) NOT NULL DEFAULT 0,
    accountType VARCHAR(200) NOT NULL,
    madeAt DATETIME DEFAULT GETDATE()
)

CREATE TABLE transactions
(
    ID INT PRIMARY KEY IDENTITY,
    accountID INT REFERENCES accounts(ID),
    amount DECIMAL(18,4) NOT NULL,
    madeAt DATETIME DEFAULT GETDATE()
)

-- Create Audit Tables
DROP TABLE IF EXISTS customersAudit;
DROP TABLE IF EXISTS accountsAudit;
DROP TABLE IF EXISTS transactionsAudit;

CREATE TABLE customersAudit
(
    ID INT PRIMARY KEY IDENTITY,
    customerID INT,
    customerFirstName NVARCHAR(200),
    customerLastName NVARCHAR(200),
    userID NVARCHAR(200),
    action NVARCHAR(20),
    actionTime DATETIME DEFAULT GETDATE()
);

CREATE TABLE accountsAudit
(
    ID INT PRIMARY KEY IDENTITY,
    accountID INT,
    accountType NVARCHAR(200),
    userID NVARCHAR(200),
    action NVARCHAR(20),
    actionTime DATETIME DEFAULT GETDATE()
);


CREATE TABLE transactionsAudit
(
    ID INT PRIMARY KEY IDENTITY,
    transactionID INT,
    transactionAmount DECIMAL(18,4),
    accountID INT,
    userID NVARCHAR(200),
    action NVARCHAR(20),
    actionTime DATETIME DEFAULT GETDATE()
);