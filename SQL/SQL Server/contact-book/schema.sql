USE CONTACTBOOK;
GO

DROP TABLE phoneBook;
DROP TABLE addressBook;
DROP TABLE contacts;
GO

CREATE TABLE contacts (
	ID INT PRIMARY KEY IDENTITY,
	fname VARCHAR(192) NOT NULL,
	lname VARCHAR(192) NOT NULL,
	email VARCHAR(192),
	birthday DATETIME
);
GO

CREATE TABLE addressBook (
	ID INT PRIMARY KEY IDENTITY,
	contactID INT NOT NULL REFERENCES contacts(ID),
	address1 VARCHAR(192) NOT NULL,
	address2 VARCHAR(192),
	city VARCHAR(192),
	state CHAR(2),
	country CHAR(2)
);
GO

CREATE TABLE phoneBook (
	ID INT PRIMARY KEY IDENTITY,
	contactID INT NOT NULL REFERENCES contacts(ID),
	type VARCHAR(200),
	number INT NOT NULL,
);
GO