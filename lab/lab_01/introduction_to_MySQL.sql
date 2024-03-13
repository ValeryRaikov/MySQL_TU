-- Delete database 
DROP DATABASE IF EXISTS school_sport_clubs;
 
-- Create database
CREATE DATABASE school_sport_clubs;
 
-- Use database
USE school_sport_clubs;
 
-- Create table students
CREATE TABLE IF NOT EXISTS students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    egn VARCHAR(10) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(10) DEFAULT NULL,
    class VARCHAR(10) DEFAULT NULL
);
 
-- Create table sport_groups
CREATE TABLE IF NOT EXISTS sport_groups(
    id INT AUTO_iNCREMENT PRIMARY KEY,
    location VARCHAR(50) NOT NULL,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday'),
    hour_of_training TIME NOT NULL,
    UNIQUE KEY (location, day_of_week, hour_of_training)
);
 
-- Create table student_sport
CREATE TABLE IF NOT EXISTS student_sport(
    student_id INT NOT NULL,
    CONSTRAINT 
        FOREIGN KEY(student_id)
        REFERENCES students(id),
    sport_group_id INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY(sport_group_id)
        REFERENCES sport_groups(id)
);
 
-- Create table sport
CREATE TABLE IF NOT EXISTS sport(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
 
-- Create table coaches
CREATE TABLE IF NOT EXISTS coaches(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    egn VARCHAR(10) NOT NULL UNIQUE
);
 
-- Insert data into tables
INSERT INTO students (name, egn, address, phone, class)
VALUES
    ('Ivelin Milanov Chakurov', '7546118701', 'Sofia, zh.k. Mladost 4, bl. 470A', '0887111889'),
    ('Samuil Tsonev Manev', '0147128811', 'Sofia, zh.k. Mladost 1, bl. 52', '0887123889'),
    ('Ivana Yaneva Madoleva', '9546118701', 'Sofia, zh.k. Lylin 4, bl. 10', '0899171870'),
    ('Petra Ruskova Makova', '9946128701', 'Sofia, zh.k. Poduene, bl. 123', '0887159189'),
    ('Martin Veselinov Velchev', '7746171395', 'Sofia, zh.k. Mladost 3, bl. 350', '0896138880'),
    ('Kristian Borisov Vlahov', '0246126401', 'Sofia, zh.k. Zona B-5, bl. 47', '0877111910');  
 
INSERT INTO sport_groups (location, day_of_week, hour_of_training) 
VALUES
    ('Pulse Fitness Ring Mall', 'Monday', '09:00:00'),
    ('Next Level Residential Park', 'Wednesday', '19:15:00'),
    ('Pulse Fitness Mladost 4', 'Wednesday', '17:00:00'),
    ('Flais Sport Depot Mladost 4', 'Tuesday', '12:30:00'),
    ('Titanium Mladost 3', 'Monday', '17:30:00');
 
INSERT INTO student_sport
VALUES 
    (1, 1), 
    (2, 2), 
    (3, 1), 
    (4, 2),
    (5, 3);
 
-- Insert with null default
INSERT INTO sport
VALUES 
    (NULL, 'Football'),
    (NULL, 'Voleyball'),
    (NULL, 'Tennis');
 
INSERT INTO coaches
VALUES
    (NULL, 'Ivan Metodiev Todorov', '7546117810'),
    (NULL, 'Petar Ivanov Lachkov', '8741416039'),
    (NULL, 'Maria Angelova Mitova', '8352106996'),
    (NULL, 'Mario Marinov Topuzakov', '7944628741'),
    (NULL, 'Viktoria Todorova Mudeva', '9446125495'),
    (NULL, 'Ivaylo Vasilev Yofkov', '9050107702');