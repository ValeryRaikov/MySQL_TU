DROP DATABASE IF EXISTS television_db;

CREATE DATABASE television_db;

USE television_db;

-- Define database table structure 
CREATE TABLE programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image_url TEXT NULL DEFAULT NULL
);

CREATE TABLE shows(
	id INT AUTO_INCREMENT PRIMARY KEY,
    show_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    image_url TEXT NULL DEFAULT NULL,
    program_id INT
);

CREATE TABLE hosts(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE actors(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE votes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT, 
    show_id INT
);

CREATE TABLE show_hosts(
	show_id INT,
    host_id INT
);

CREATE TABLE show_actors(
	show_id INT,
    actor_id INT
);

-- Add foreign key constraints to make relationships between the tables
ALTER TABLE shows
ADD CONSTRAINT 
FOREIGN KEY (program_id)
	REFERENCES programs(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL;
    
ALTER TABLE votes
ADD CONSTRAINT 
FOREIGN KEY (user_id)
	REFERENCES users(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL,
ADD CONSTRAINT 
FOREIGN KEY (show_id)
	REFERENCES shows(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL;
    
ALTER TABLE show_hosts
ADD CONSTRAINT 
FOREIGN KEY (show_id)
	REFERENCES shows(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL,
ADD CONSTRAINT 
FOREIGN KEY (host_id)
	REFERENCES hosts(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL;
    
ALTER TABLE show_actors
ADD CONSTRAINT 
FOREIGN KEY (show_id)
	REFERENCES shows(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL,
ADD CONSTRAINT 
FOREIGN KEY (actor_id)
	REFERENCES actors(id)
    ON UPDATE CASCADE 
    ON DELETE SET NULL;