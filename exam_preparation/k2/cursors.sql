-- 01
DROP PROCEDURE IF EXISTS cursor_sample_proc;

DELIMITER $$

CREATE PROCEDURE cursor_sample_proc()
BEGIN
	DECLARE finished INT;
	DECLARE showName VARCHAR(50);
    DECLARE showDesc TEXT;
    DECLARE programId INT;
    
    DECLARE show_cursor CURSOR FOR
    SELECT 
		show_name,
        description,
        program_id
	FROM 
		shows
	WHERE image_url IS NULL; -- More precise custom logic
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    SET finished = 0;
    
    OPEN show_cursor;
    show_loop: WHILE (finished = 0) DO
    FETCH show_cursor INTO 
		showName,
		showDesc,
        programId;
	IF (finished = 1)
    THEN 
        LEAVE show_loop;
    END IF;
    SELECT showName, showDesc, programId AS 'Show Info';
    END WHILE;
    CLOSE show_cursor;
    SET finished = 0;
	SELECT 'Finished!';
    
END
$$

DELIMITER ;

CALL cursor_sample_proc();

-- 02
DROP PROCEDURE IF EXISTS cursor_sample_proc2;

DELIMITER $$

CREATE PROCEDURE cursor_sample_proc2()
BEGIN
	DECLARE finished INT;
	DECLARE temp_full_name VARCHAR(150);
    DECLARE temp_email VARCHAR(100);
    DECLARE temp_password VARCHAR(20);
    
    DECLARE user_cursor CURSOR FOR
    SELECT 
		full_name,
        email,
        password
	FROM 
		users
	WHERE 
		email LIKE '%.net';
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    SET finished = 0;
    
    OPEN user_cursor;
    user_loop: WHILE (finished = 0) DO
	FETCH user_cursor INTO 
		temp_full_name,
        temp_email,
        temp_password;
	IF (finished = 1)
    THEN 
		LEAVE user_loop;
	END IF;
    SELECT temp_full_name, temp_email, temp_password AS 'User Info';
    END WHILE;
    CLOSE user_cursor;
    SET finished = 0;
	SELECT 'Finished!';
END 
$$

DELIMITER ;

CALL cursor_sample_proc2();