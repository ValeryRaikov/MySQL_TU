USE transaction_test;

DELIMITER $

DROP PROCEDURE IF EXISTS TransferMoney $
CREATE PROCEDURE TransferMoney(
    IN sender_account_id INT, 
    IN receiver_account_id INT, 
    IN amount DOUBLE
)
BEGIN

    DECLARE sender_balance DOUBLE;

    SELECT amount INTO sender_balance
    FROM customer_accounts
    WHERE id = sender_account_id;
    
    IF sender_balance >= amount THEN
        START TRANSACTION;
        
        UPDATE customer_accounts
        SET amount = amount - amount
        WHERE id = sender_account_id;
        
        UPDATE customer_accounts
        SET amount = amount + amount
        WHERE id = receiver_account_id;
        
        COMMIT;
        
        SELECT 'Transaction successful' AS Message;
    ELSE
        SELECT 'Insufficient balance' AS Message;
    END IF;
    
END $

DELIMITER ;

CALL TransferMoney(1, 2, 1000);