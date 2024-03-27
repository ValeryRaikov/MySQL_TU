DROP DATABASE IF EXISTS cinema_db;

CREATE DATABASE cinema_db;

USE cinema_db;

CREATE TABLE studios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    bulstat VARCHAR(20) NOT NULL
);

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    length INT NOT NULL,
    budget DECIMAL(10, 2) NOT NULL,
    studio_id INT,
    producer VARCHAR(100) NOT NULL,
    FOREIGN KEY (studio_id) 
		REFERENCES studios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE actors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    FOREIGN KEY (movie_id) 
		REFERENCES movies(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (actor_id) 
		REFERENCES actors(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY (movie_id, actor_id)
);
