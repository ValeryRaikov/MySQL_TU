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

UPDATE shows
SET image_url = NULL
WHERE id = 1;

SELECT * FROM programs WHERE id = (SELECT program_id FROM shows WHERE id = 1);

-- 09
DELIMITER $

DROP PROCEDURE IF EXISTS get_show_votes $
CREATE PROCEDURE get_show_votes(IN show_name VARCHAR(100), OUT votes_for_show INT)

BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE votes_count INT DEFAULT 0;

    DECLARE cur_votes CURSOR FOR
        SELECT COUNT(*) AS votes_count
        FROM votes v
        JOIN shows s ON v.show_id = s.id
        WHERE s.show_name = show_name;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_votes;

    read_loop: LOOP
        FETCH cur_votes INTO votes_count;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET votes_for_show = votes_count;
    END LOOP;

    CLOSE cur_votes;
END $

DELIMITER ;

SET @votes_for_show_result = 0;

CALL get_show_votes('Kutch-Zulauf', @votes_for_show_result);

SELECT @votes_for_show_result AS votes_for_show;