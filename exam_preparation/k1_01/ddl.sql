DROP DATABASE IF EXISTS library_system;

CREATE DATABASE library_system;

USE library_system;

CREATE TABLE userRole (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(100) NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    egn VARCHAR(10) NOT NULL UNIQUE,
    pass VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    userRoleId INT,
    CONSTRAINT FOREIGN KEY (userRoleId)
        REFERENCES userRole(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE publishers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100)
);

CREATE TABLE loanBooks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    info TEXT
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publisher_id INT,
    description TEXT,
    CONSTRAINT FOREIGN KEY (publisher_id)
        REFERENCES publishers(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE booksGenres (
    book_id INT,
    genre_id INT,
    CONSTRAINT FOREIGN KEY (book_id)
        REFERENCES books(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT FOREIGN KEY (genre_id)
        REFERENCES genres(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE authorsBooks (
    book_id INT,
    author_id INT,
    CONSTRAINT FOREIGN KEY (book_id)
        REFERENCES books(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
