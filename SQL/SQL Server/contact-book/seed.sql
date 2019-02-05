SET IDENTITY_INSERT contacts ON
INSERT INTO contacts 
    (ID, fname,      lname,      email,              birthday)
VALUES
    (1, 'Tay',       'Mai',      'the.mai@omega.no', CONVERT(datetime, '1992/07/21 06:23:43', 120))
SET IDENTITY_INSERT contacts OFF
GO

SET IDENTITY_INSERT addresses ON
INSERT INTO addresses
    (ID, contactID,  address1,               address2,   city,           state,  country)
VALUES
    (1,  1,          '1007 Sugardale ct',    NULL,       'Sugar Land',   'TX',   'US')
SET IDENTITY_INSERT addresses OFF
GO

SET IDENTITY_INSERT phoneNumbers ON
INSERT INTO phoneNumbers
    (ID, contactID,  type,   number)
VALUES
    (1,  1,          'home', '469-226-9681')
SET IDENTITY_INSERT phoneNumbers ON
GO