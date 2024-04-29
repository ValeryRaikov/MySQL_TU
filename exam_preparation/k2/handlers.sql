-- 01
DROP DATABASE IF EXISTS users_db;
CREATE DATABASE users_db;
USE users_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) NOT NULL
);

DROP PROCEDURE IF EXISTS insert_user; 

DELIMITER $$

CREATE PROCEDURE insert_user(IN p_username VARCHAR(50), IN p_email VARCHAR(50)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLSTATE '23000'
  BEGIN
    SELECT 'Error: Duplicate username. Please choose a different username.' AS Message;
  END;

  INSERT INTO users (username, email) VALUES (p_username, p_email);

  SELECT 'User inserted successfully' AS Message;

END
$$

DELIMITER ;

CALL insert_user('jane','jane@example.com');
CALL insert_user('jane','jane@example.com'); -- Second time throws an Exception which is handled!