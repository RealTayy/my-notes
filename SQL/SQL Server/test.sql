CREATE TABLE companies (
    ID				INT PRIMARY KEY Identity(1,1),
    company_name	char(32) NOT NULL,
    industry		char(32) NOT NULL
);																													

GO
CREATE TABLE users (
    ID			INT PRIMARY KEY Identity(1,1),
    user_name	char(32) NOT NULL,    
    position	char(32) NOT NULL,
    company_id	INT FOREIGN KEY REFERENCES companies(ID),
    experience	INT NOT NULL,
);
GO
INSERT INTO companies (
    company_name,
    industry
)
VALUES
    ('Omega',		'Software Company'),    
    ('Hogwarts',	'Education'),
    ('Trilogy',		'Education');
GO
INSERT INTO users (
    user_name,
    position,
    company_id,
    experience
)
VALUES
    ('Shane Butts',			'Vice President',	1,		20),
    ('The Mai',				'JR SE',			1,		2),
    ('Dung Young Hoang',	'SR SE',			1,		10),
    ('Severius Snape',		'Professor',		2,		12),
    ('Albus Dumbledore',	'Head Master',		2,		54),
    ('Sirus Black',			'Professor',		2,		8),
    ('Camden Kirkland',		'Professor',		3,		7),
    ('Rachel Thiim',		'Professor',		3,		4),
    ('Michelle Bury',		'SSM',				3,		11),
	('Mystery Man',			'Nobody',			NULL,	50);
GO
SELECT * FROM users;
SELECT * FROM companies;