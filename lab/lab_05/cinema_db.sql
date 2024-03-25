DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema;

USE cinema;

CREATE TABLE cinemas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE cinema_rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cinema_id INT,
    room_number INT,
    capacity INT,
    room_type ENUM('Standard', 'VIP', 'Deluxe'),
    FOREIGN KEY (cinema_id) 
        REFERENCES cinemas(id)
);

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    year INT,
    country VARCHAR(50)
);

CREATE TABLE movie_projections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cinema_id INT,
    cinema_room_id INT,
    movie_id INT,
    projection_time DATETIME,
    audience_count INT,
    FOREIGN KEY (cinema_id) 
        REFERENCES cinemas(id),
    FOREIGN KEY (cinema_room_id) 
        REFERENCES cinema_rooms(id),
    FOREIGN KEY (movie_id) 
        REFERENCES movies(id)
);

INSERT INTO cinemas (name) 
VALUES 
    ('Arena Mladost'), 
    ('Cinema City'), 
    ('Cine Grand');

INSERT INTO cinema_rooms (cinema_id, room_number, capacity, room_type) 
VALUES 
    (1, 1, 100, 'Standard'),
    (1, 2, 50, 'VIP'),
    (2, 1, 120, 'Standard'),
    (2, 2, 60, 'Deluxe'),
    (3, 1, 80, 'VIP');

INSERT INTO movies (name, year, country) 
VALUES 
    ('Final Destination 7', 2024, 'USA'),
    ('Fast and Furious 10', 2023, 'USA');

INSERT INTO movie_projections (cinema_id, cinema_room_id, movie_id, projection_time, audience_count) 
VALUES 
    (1, 1, 1, '2024-03-20 18:00:00', 50),
    (1, 2, 1, '2024-03-20 20:30:00', 60),
    (2, 1, 1, '2024-03-20 19:00:00', 40),
    (3, 1, 1, '2024-03-20 21:00:00', 70);

SELECT c.name AS cinema_name, cr.room_number AS hall_number, mp.projection_time
FROM cinemas c
INNER JOIN cinema_rooms cr ON c.id = cr.cinema_id
INNER JOIN movie_projections mp ON cr.id = mp.cinema_room_id
INNER JOIN movies m ON mp.movie_id = m.id
WHERE m.name = 'Final Destination 7'
AND c.name = 'Arena Mladost'
ORDER BY c.name, cr.room_number;

SELECT SUM(mp.audience_count) AS total_audience
FROM cinemas c
INNER JOIN cinema_rooms cr ON c.id = cr.cinema_id
INNER JOIN movie_projections mp ON cr.id = mp.cinema_room_id
INNER JOIN movies m ON mp.movie_id = m.id
WHERE m.name = 'Final Destination 7'
AND c.name = 'Arena Mladost';