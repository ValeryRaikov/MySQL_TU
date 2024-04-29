-- 01
DELIMITER $$

CREATE EVENT delete_shows_without_logo
ON SCHEDULE EVERY 1 DAY
STARTS '2024-04-29 22:00:00'
DO
BEGIN
	DELETE FROM shows
    WHERE image_url IS NULL;
END 
$$

DELIMITER ;

-- 02
USE shop_db;

DELIMITER $$

CREATE EVENT expire_old_orders_event
ON SCHEDULE EVERY 1 WEEK
DO
BEGIN
    DECLARE today DATE;
    
    SET today = CURDATE();
    
    UPDATE orders 
    SET order_status = 'Expired' 
    WHERE order_date < DATE_SUB(today, INTERVAL 30 DAY);
END $$

DELIMITER ;