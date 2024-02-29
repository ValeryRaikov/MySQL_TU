DROP DATABASE IF EXISTS news_agency;

CREATE DATABASE news_agency;

USE news_agency;

DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(16) NOT NULL CHECK (CHARACTER_LENGTH(password) BETWEEN 8 AND 16),
    email VARCHAR(50) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
);

DROP TABLE IF EXISTS articles CASCADE;

CREATE TABLE articles (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    category_id INT,
    author_id INT,
    date_published TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS images CASCADE;

CREATE TABLE images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT,
    image_url TEXT NOT NULL,
    FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

DROP TABLE IF EXISTS videos CASCADE;

CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT,
    video_url TEXT NOT NULL,
    FOREIGN KEY (article_id) REFERENCES articles(article_id)
);

DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT,
    user_id INT,
    content TEXT NOT NULL,
    date_posted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO categories (name) 
VALUES
    ('Sports'),
    ('Crime'),
    ('Politics');

INSERT INTO users (username, password, email, is_admin) 
VALUES
    ('admin', 'adminpassword', 'admin@example.com', TRUE),
    ('user1', 'user1password', 'user1@example.com', FALSE),
    ('user2', 'user2password', 'user2@example.com', FALSE);

INSERT INTO articles (title, content, category_id, author_id) 
VALUES
    ('Football Championship', 'The latest updates on the football championship.', 1, 2),
    ('Bank Robbery', 'Details about the recent bank robbery.', 2, 3),
    ('Election Results', 'Analysis of the recent election results.', 3, 1);

INSERT INTO images (article_id, image_url) 
VALUES
    (1, 'https://example.com/image1.jpg'),
    (2, 'https://example.com/image2.jpg'),
    (3, 'https://example.com/image3.jpg');

INSERT INTO videos (article_id, video_url) 
VALUES
    (1, 'https://example.com/video1.mp4'),
    (2, 'https://example.com/video2.mp4'),
    (3, 'https://example.com/video3.mp4');

INSERT INTO comments (article_id, user_id, content) 
VALUES
    (1, 2, 'Great coverage of the championship!'),
    (1, 3, 'I disagree with the analysis.'),
    (2, 3, 'Scary situation!'),
    (3, 1, 'Interesting insights.');

-- Additional
SELECT * FROM categories;

SELECT * FROM users;

SELECT 
    a.title, a.content, c.name AS category, u.username AS author
FROM articles a
    JOIN categories c ON a.category_id = c.category_id
        JOIN users u ON a.author_id = u.user_id;

SELECT 
    c.content, u.username AS commenter_username
FROM comments c
    JOIN users u ON c.user_id = u.user_id
WHERE c.article_id = 1;

SELECT 
    c.name AS category, COUNT(a.article_id) AS num_articles
FROM categories c
    LEFT JOIN articles a ON c.category_id = a.category_id
GROUP BY c.category_id;
