-- Simple queries to display general data:
SELECT 
	program_name
FROM
	programs
WHERE 
	program_name LIKE'L%';
    
SELECT 
	s.show_name,
    p.program_name 
FROM 
	shows s 
JOIN programs p ON
	s.program_id = p.id
WHERE 
	s.show_name LIKE 'A%' OR 
    p.program_name LIKE 'A%';
    
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS full_name
FROM
	hosts
ORDER BY 
	full_name
LIMIT
	50;
    
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS full_name
FROM
	actors
WHERE
	LENGTH(CONCAT_WS(' ', first_name, last_name)) > 15
ORDER BY 
	full_name DESC;

SELECT 
	*
FROM 
	users
ORDER BY 
	full_name;
    
SELECT 
	s.show_name,
	COUNT(v.show_id) AS show_votes
FROM
	shows s
JOIN votes v ON 
	s.id = v.show_id
GROUP BY 
	s.show_name
ORDER BY 
	show_votes DESC;
    
SELECT 
	GROUP_CONCAT(CONCAT_WS(' ', h.first_name, h.last_name)) AS hosts_names,
    s.show_name,
    GROUP_CONCAT(CONCAT_WS(' ', a.first_name, a.last_name)) AS actors_names
FROM
	hosts h 
LEFT JOIN show_hosts sh ON 
	h.id = sh.host_id
JOIN shows s ON
	sh.show_id = s.id
JOIN show_actors sa ON
	s.id = sa.show_id
RIGHT JOIN actors a ON 
	sa.actor_id = a.id
GROUP BY 
	s.show_name
HAVING 
	COUNT(DISTINCT sa.actor_id) > 1;

-- Specific queries:
-- 02
SELECT 
	show_name,
    description,
	IFNULL(image_url, 'not provided') AS image_url
FROM 
	shows 
WHERE 
	program_id = 10;

-- 03
SELECT 
	program_id, 
    COUNT(*) AS show_count 
FROM 
	shows 
GROUP BY 
	program_id
ORDER BY 
	show_count DESC;

-- 04
SELECT 
	s.show_name, 
	GROUP_CONCAT(CONCAT_WS(' ', h.first_name, h.last_name)) AS hosts_names
FROM 
	shows s
JOIN show_hosts sh ON 
	s.id = sh.show_id
JOIN hosts h ON 
	sh.host_id = h.id
GROUP BY 
	s.show_name
ORDER BY
	s.show_name;

-- 05
SELECT 
	s.show_name,
    GROUP_CONCAT(CONCAT_WS(' ', h.first_name, h.last_name)) AS hosts_names
FROM 
	shows s
LEFT JOIN show_hosts sh ON 
	s.id = sh.show_id
LEFT JOIN hosts h ON 
	sh.host_id = h.id
GROUP BY 
	s.show_name;

-- 06
SELECT 
	show_name,
    description
FROM 
	shows 
WHERE 
	program_id IN (
		SELECT 
			id
		FROM 
			programs 
		WHERE 
			program_name = 'Boyle-Douglas' OR
			program_id = '10'
		);

-- 07
SELECT
	p.program_name, 
	COUNT(s.id) AS show_count
FROM 
	programs p
LEFT JOIN shows s ON 
	p.id = s.program_id
GROUP BY 
	p.program_name
HAVING 
	show_count > 1
ORDER BY
	show_count DESC;

-- 08
DELIMITER $

DROP TRIGGER IF EXISTS after_show_update $
CREATE TRIGGER after_show_update
AFTER UPDATE ON shows
FOR EACH ROW

BEGIN

DECLARE program_id INT;

SET program_id = NEW.program_id;

IF NEW.image_url IS NULL THEN
    UPDATE programs
    SET image_url = 'https://example.com/default_image.jpg'
    WHERE id = program_id;
END IF;

END $

DELIMITER ;

UPDATE shows
SET image_url = NULL
WHERE id = 1;

-- 09
-- without cursor
DELIMITER $

DROP PROCEDURE IF EXISTS get_show_votes $
CREATE PROCEDURE get_show_votes(IN show_name VARCHAR(100))

BEGIN

    DECLARE votes_count INT DEFAULT 0;
    
    SELECT 
		COUNT(*) INTO votes_count
    FROM 
		votes v
    JOIN shows s ON 
		v.show_id = s.id
    WHERE 
		s.show_name = show_name;
    
    SELECT votes_count AS votes_for_show;
END $

DELIMITER ;

-- with cursor
DELIMITER $

DROP PROCEDURE IF EXISTS get_show_votes $
CREATE PROCEDURE get_show_votes(IN show_name VARCHAR(100))

BEGIN

    DECLARE votes_count INT DEFAULT 0;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_votes CURSOR FOR
        SELECT 
			COUNT(*) AS votes_count
        FROM 
			votes v
        JOIN shows s ON 
			v.show_id = s.id
        WHERE 
			s.show_name = show_name;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_votes;
    
    read_loop: LOOP
        FETCH cur_votes INTO votes_count;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT votes_count AS votes_for_show;
    END LOOP;

    CLOSE cur_votes;

END $

DELIMITER ;

CALL get_show_votes('Padberg LLC');

-- another
DELIMITER $

DROP PROCEDURE IF EXISTS get_show_details_by_id $
CREATE PROCEDURE get_show_details_by_id(IN show_id_param INT)

BEGIN

DECLARE show_name_val, host_names VARCHAR(100);

SELECT 
	s.show_name, 
    GROUP_CONCAT(CONCAT_WS(' ', h.first_name, ' ', h.last_name)) 
INTO 
	show_name_val, 
    host_names
FROM 
	shows s
LEFT JOIN show_hosts sh ON 
	s.id = sh.show_id
LEFT JOIN hosts h ON 
	sh.host_id = h.id
WHERE 
	s.id = show_id_param
GROUP BY 
	s.id, s.show_name;

SELECT CONCAT('Show ID: ', show_id_param, ', Show Name: ', show_name_val, ', Hosts: ', host_names) AS Show_Details;

END $

DELIMITER ;

CALL get_show_details_by_id(107);