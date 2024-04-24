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
      
        
def footballGroupsView():
    try:
        with connection.cursor() as cursor:
            cursor.execute(""" 
                CREATE OR REPLACE VIEW footbalGroupsOfIvPetrov 
                AS
                SELECT students.name, students.class, sportgroups.id
                FROM students JOIN sportgroups
                ON students.id IN (
                    SELECT student_id
                    FROM student_sport
                    WHERE student_sport.sportGroup_id = sportgroups.id
                )
                WHERE sportgroups.id IN(
                    SELECT sportgroup_id
                    FROM student_sport
                    WHERE sportGroup_id IN(
                        SELECT id
                        FROM sportgroups
                        WHERE dayOfWeek = 'Monday'
                        AND hourOfTraining = '08:00:00'
                        AND coach_id IN(
                            SELECT id
                            FROM coaches
                            WHERE name = 'Иван Тодоров Петров'
                        )
                        AND sport_id =(
                            SELECT id
                            FROM sports
                            WHERE name = 'Football'
                        )
                    )
                );
            """)
            
            cursor.execute("SELECT * FROM footbalGroupsOfIvPetrov")
            
            [print(row) for row in cursor.fetchall()]
                
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")
 
        
def drop_footballGroupsView():
    try:
        with connection.cursor() as cursor:
            cursor.execute("DROP VIEW IF EXISTS footballGroupsView;")
            print("Successfully dropped view footballGroupsView.")
    except Exception as e:
        print(f"An error was raised: {e.args[0]}")


if __name__ == "__main__":
    footballGroupsView()
    drop_footballGroupsView()
    