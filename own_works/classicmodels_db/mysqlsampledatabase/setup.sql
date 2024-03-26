CREATE TABLE IF NOT EXISTS members (
	member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS committees (
	committee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)	
);

INSERT INTO members(name)
VALUES
	('John'),
    ('Jane'),
    ('Mary'),
    ('David'),
    ('Amelia');

INSERT INTO committees(name)
VALUES
	('John'),
    ('Mary'),
    ('Amelia'),
    ('Joe');