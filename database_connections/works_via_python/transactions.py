import mysql.connector

CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'password',
    'database': 'transaction_test',
}

connection = mysql.connector.connect(**CONFIG)

try:
    with connection.cursor() as cursor:
        cursor.execute("SELECT VERSION()")
        version = cursor.fetchone()
        print(f"Database version: {version[0]}")
except Exception as e:
    print(f"An error was raised: {e.args[0]}")

# Select database
def select_database():
    try:
        with connection.cursor() as cursor:
            cursor.execute("USE transaction_test;")
            print('Ok.')
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
        
        
# Simple MySQl transaction demo
def transaction1():
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                BEGIN; 
                USE transaction_test;
                UPDATE customer_accounts 
                SET amount = amount - 50 
                WHERE id = 1;

                UPDATE customer_accounts
                SET amount = amount + 50 
                WHERE id = 2;

                COMMIT;          
            """)
            
            print("Success!")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    
       
# Transaction with Errors and Exceptions 
def transaction2():
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                BEGIN;
                USE transaction_test;
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                START TRANSACTION
                    ROLLBACK;
                    RESIGNAL;
                END;
                UPDATE customer_accounts 
                SET amount = amount - 50 WHERE id = 1;
                
                UPDATE customer_accounts
                SET amount = amount + 50 
                WHERE id = 2;
                
                IF (SELECT amount FROM customer_accounts WHERE id = 1) < 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
                END IF;
                
                COMMIT;
            """)
            
            print("Succes!")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
 
 
# Transaction with savepoint
def transaction3():
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                BEGIN;
                USE transaction_test;
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                START TRANSACTION
                    ROLLBACK TO SAVEPOINT my_savepoint;
                    RESIGNAL;
                END;
                UPDATE customer_accounts 
                SET amount = amount - 50 WHERE id = 1;
                
                UPDATE customer_accounts
                SET amount = amount + 50 
                WHERE id = 2;
                
                IF (SELECT amount FROM customer_accounts WHERE id = 1) < 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
                END IF;
                
                COMMIT;
            """)
            
            print("Succes!")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
        
        
def show_table():
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM customer_acounts;")
            
            [print(row) for row in cursor.fetchall()]
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
 
        
if __name__ == "__main__":
    select_database()
    transaction1()
    transaction2()
    transaction3()
    show_table()