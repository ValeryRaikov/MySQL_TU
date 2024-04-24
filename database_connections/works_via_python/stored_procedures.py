import mysql.connector

CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'password',
    'database': 'school_sport_clubs',
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
            cursor.execute("USE school_sport_clubs;")
            print('Ok.')
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
        
        
def getAllSportGroupsWithSports():
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                DELIMITER $
                DROP PROCEDURE IF EXISTS getAllSportGroupsWithSports;
                CREATE PROCEDURE getAllSportGroupsWithSports()
                BEGIN
                SELECT sg.location AS locationOfGroup,
                sg.dayOfWeek AS trainingDay,
                sg.hourOfTraining AS trainingHour,
                sp.name AS sportName
                FROM sportgroups AS sg JOIN sports AS sp
                ON sg.sport_id = sp.id;
                END
                $
                DELIMITER ;
            """)  
            
            cursor.callproc("getAllSportGroupsWithSports")
            
            for result in cursor.stored_results():
                [print(row) for row in result.fetchall()]
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
        
        
def sql_variables():
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                set @customer_number = 'A454647';
                select @customer_number;

                SET @coach_name = 'Ivan Todorov Petkov';
                
                SELECT *
                FROM coaches
                WHERE name = @coach_name;   
            """)
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
      
      
if __name__ == "__main__":
    getAllSportGroupsWithSports()
    sql_variables()