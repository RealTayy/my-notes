CREATE TABLE companies (
    ID INT PRIMARY KEY Identity(1,1),
    company_name char(32) NOT NULL,
    industry char(32) NOT NULL
);
GO
CREATE TABLE users (
    ID INT PRIMARY KEY Identity(1,1),
    user_name char(32) NOT NULL,    
    position char(32) NOT NULL,
    company_id INT FOREIGN KEY REFERENCES companies(ID),
);
GO
INSERT INTO companies (
    company_name,
    industry
)
VALUES
    ('Omega Project Solutions', 'Software Company'),    
    ('Hogwarts', 'Education'),
    ('Trilogy', 'Education');
GO
INSERT INTO users (
    user_name,
    position,
    company_id
)
VALUES
    ('Shane Butts', 'Vice President', 1),
    ('The Mai', 'JR Systems Engineer', 1),
    ('Dung Hoang', 'SR Systems Engineer', 1),
    ('Severius Snape', 'Professor', 2),
    ('Albus Dumbledore', 'Head Master', 2),
    ('Sirus Black', 'Professor', 2),
    ('Camden Kirkland', 'Professor', 3),
    ('Rachel Thiim', 'Professor', 3),
    ('Michelle Bury', 'Student Success Manager', 3);
GO
 
SELECT * FROM companies

SELECT * FROM users