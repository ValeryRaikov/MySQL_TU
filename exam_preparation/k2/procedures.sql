USE television_db;

-- 01 (IN param)
DROP PROCEDURE IF EXISTS get_shows_by_host_name_proc;

DELIMITER $$

CREATE PROCEDURE get_shows_by_host_name_proc(IN host_full_name VARCHAR(150))
BEGIN 
	SELECT 
		s.show_name,
        p.program_name
	FROM shows s
    JOIN programs p ON s.program_id = p.id
    JOIN show_hosts sh ON s.id = sh.show_id
    JOIN hosts h ON  sh.host_id = h.id
    WHERE 
		CONCAT(h.first_name, ' ', h.last_name) = host_full_name;
END
$$

DELIMITER ;

CALL get_shows_by_host_name_proc('Ruby Ricioppo');

SET @test_name = 'Filippo Knappen';
CALL get_shows_by_host_name_proc(@test_name);
-- 02 (OUT param)
DROP PROCEDURE IF EXISTS get_actor_shows_count_proc;

DELIMITER $$

CREATE PROCEDURE get_actor_shows_count_proc(IN actor_full_name VARCHAR(150), OUT show_count INT)
BEGIN
	SELECT COUNT(s.id) INTO show_count
    FROM shows s 
    JOIN show_actors sa ON s.id = sa.show_id
    JOIN actors a ON sa.actor_id = a.id
    WHERE 
		CONCAT(a.first_name, ' ', a.last_name) = actor_full_name;
END
$$

DELIMITER $$

-- SET @show_count = 0; (Not necessary!)

CALL get_actor_shows_count_proc('Glenna Fain', @show_count);

SELECT @show_count AS 'Show Count';

-- 03 (OUT param)
DROP PROCEDURE IF EXISTS get_max_votes_count_proc;

DELIMITER $$

CREATE PROCEDURE get_max_votes_count_proc(OUT max_votes INT)
BEGIN
	SELECT MAX(vote_count) INTO max_votes
	FROM (
		SELECT COUNT(show_id) AS vote_count
		FROM votes
		GROUP BY show_id
	) AS vote_counts;
END
$$

DELIMITER ;

CALL get_max_votes_count_proc(@max_votes);

SELECT @max_votes AS 'Max Votes Count';

-- 04 (INOUT param)
DROP PROCEDURE IF EXISTS to_square_number_proc;

DELIMITER $$

CREATE PROCEDURE to_square_number_proc(INOUT number INT)
BEGIN
	SET number = number * number;
END
$$

DELIMITER ;

SET @test_num = 10;
CALL to_square_number_proc(@test_num);

SELECT @test_num AS 'Square number';

-- 05 (IF-ELSE)
DROP PROCEDURE IF EXISTS check_show_logo_proc;

DELIMITER $$

CREATE PROCEDURE check_show_logo_proc(IN show_id INT)
BEGIN 
	DECLARE result VARCHAR(30);
    
    IF ((SELECT 
			image_url
		FROM
			shows 
		WHERE 
			id = show_id) IS NOT NULL)
	THEN 
		SET result = 'Show has a provided logo!';
	ELSE 
		SET result = 'No show logo provided!';
	END IF;
    
    SELECT result AS 'Does show have logo?';
END
$$

DELIMITER ;

CALL check_show_logo_proc(10);
CALL check_show_logo_proc(20);

-- 06 (CASE)
DROP PROCEDURE IF EXISTS determine_day_proc;

DELIMITER $$

CREATE PROCEDURE determine_day(IN day_number INT)
BEGIN 
	DECLARE day_name VARCHAR(10);
    
    CASE day_number
		WHEN 1 THEN SELECT 'Monday' INTO day_name;
        WHEN 2 THEN SELECT 'Tuesday' INTO day_name;
        WHEN 3 THEN SELECT 'Wednesday' INTO day_name;
        WHEN 4 THEN SELECT 'Thursday' INTO day_name;
        WHEN 5 THEN SELECT 'Friday' INTO day_name;
        WHEN 6 THEN SELECT 'Saturday' INTO day_name;
        WHEN 7 THEN SELECT 'Sunday' INTO day_name;
	ELSE 
		SELECT 'Invalid input!' INTO day_name;
	END CASE;
    
    SELECT day_name AS 'Name of day';
END
$$

DELIMITER ;

CALL determine_day(2);
CALL determine_day(5);

-- 07 (LOOP)
DROP PROCEDURE IF EXISTS show_programs_in_range_proc;

DELIMITER $$

CREATE PROCEDURE show_programs_in_range_proc(IN start_num INT, IN end_num INT)
BEGIN
    DECLARE message_text VARCHAR(50); 
    DECLARE showName VARCHAR(50);
    DECLARE programName VARCHAR(50);
    DECLARE iterator INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET message_text = 'Invalid user input!';
    END;
    
    IF (start_num >= end_num) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid user input!';
    END IF;
    
    SET iterator = start_num;
    WHILE (iterator <= end_num) DO
        SELECT 
			s.show_name, p.program_name 
		INTO 
			showName, programName
        FROM shows s 
        JOIN programs p ON s.program_id = p.id
        WHERE s.id = iterator;
        
        SELECT CONCAT('Show Name: ', showName, ', Program Name: ', programName) AS 'Program Info';
        
        SET iterator = iterator + 1;
    END WHILE;
END $$

DELIMITER ;

CALL show_programs_in_range_proc(5, 15);
