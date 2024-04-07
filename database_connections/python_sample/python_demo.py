# Simple project to demonstrate test connection to MySQL database using pure python:

import mysql.connector


def version():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT VERSION()")
            version = cursor.fetchone()
            print(f"Database version: {version}")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


# The functions below use an already created table named cities to perform different operations:
def select():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM cities")
            rows = cursor.fetchall()
            
            for row in rows:
                print(f"Id: {row[0]}, Name:{row[1]}, population:{row[2]}")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


def select_dict():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor(dictionary=True) as cursor:
            cursor.execute("SELECT * FROM cities")
            rows = cursor.fetchall()
            
            for row in rows:
                print(f"{row['id']} {row['name']}")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


def select_description():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM cities")
            rows = cursor.fetchall()
            desc = cursor.description
            print(f"{desc[0][0]:<8} {desc[1][0]:<15}{desc[2][0]:>10}")
            
            for row in rows:
                print(f"{row[0]:<8} {row[1]:<15} {row[2]:>10}")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


def select_params():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    # user input
    myid = 4

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM cities WHERE ID=%s", (myid,))
            id, name, population = cursor.fetchone()
            print(f"{id} {name} {population}")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


def select_rows():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM cities WHERE id IN (1,2,3)")
            print(f"The query returns {cursor.rowcount} rows")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


def insert_row():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    city = (9, 'Kiev', 2887000)

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO cities VALUES(%s,%s,%s)", city)
            connection.commit()
            print("New city was inserted")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()
        
        
def update_row():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }
    
    id = 1
    name = "Sofia"
    population = 1900000
    
    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """UPDATE cities
                    SET name = %s, population = %s
                    WHERE id = %s;
                """, 
                (name, population, id)
            )
            
            connection.commit()
            print("Update table row")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()
        
        
# This functions creates a new table:
def create_table():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }

    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                """CREATE TABLE IF NOT EXISTS countries(
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        capital VARCHAR(100) NOT NULL,
                        population INT,
                        language VARCHAR(100)
                    );"""
            )
            
            connection.commit()
            print("Created table")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()
        
        
# This function deletes the previously created table:
def drop_table():
    CONFIG = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'test_user',
        'password': 'secret_pass',
        'database': 'python_test_db',
    }
    
    connection = mysql.connector.connect(**CONFIG)
    try:
        with connection.cursor() as cursor:
            cursor.execute("DROP TABLE IF EXISTS countries")
            connection.commit()
            print("Drop table")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
    finally:
        connection.close()


if __name__ == "__main__":
    version()
    select()
    select_dict()
    select_description()
    select_params()
    select_rows()
    insert_row()
    update_row()
    create_table()
    drop_table()