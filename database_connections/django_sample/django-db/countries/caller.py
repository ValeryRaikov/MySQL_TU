import os
import django
from datetime import date

# Set up Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "countries.settings")
django.setup()

from countries.countries_app.models import University, Student, Grade


# Insert data into tables
def add_universities():
    UNIVERSITIES = [
        {
            "name": "TU-Sofia",
            "location": "Sofia",
            "rating": "4.4",
        },
        {
            "name": "MU-Sofia",
            "location": "Sofia",
            "rating": "4.8",
        },
        {
            "name": "UNWE",
            "location": "Sofia",
            "rating": "4.1",
        },
        {
            "name": "PU",
            "location": "Plovdiv",
            "rating": "3.7",
        },
        {
            "name": "MU-Pleven",
            "location": "Pleven",
            "rating": "4.2",
        },
        {
            "name": "Burgaski Svoboden Universitet",
            "location": "Burgas",
            "rating": "3.8",
        },
    ]
    
    for university in UNIVERSITIES:
        University.objects.create(**university)
        

def add_students():
    STUDENTS = [
        {
            "first_name": "Valery",
            "last_name": "Raikov",
            "faculty_number": "1212221390",
            "year": 2,
            "university_id": "1",
        },
        {
            "first_name": "Maria",
            "last_name": "Motovska",
            "faculty_number": "1234567890",
            "year": 4,
            "university_id": "3",
        },
        {
            "first_name": "Magdalena",
            "last_name": "Hristova",
            "faculty_number": "1098765432",
            "year": 1,
            "university_id": "4",
        },
        {
            "first_name": "Ivan",
            "last_name": "Ivanov",
            "faculty_number": "1212331424",
            "year": 3,
            "university_id": "6",
        },
    ]
    
    for student in STUDENTS:
        Student.objects.create(**student)
        

def add_grades():
    GRADES = [
        {
            "student_id": "1",
            "subject": "Java Programming",
            "grade": 5.5,    
        },
        {
            "student_id": "1",
            "subject": "Relational Databases",
            "grade": 5.25,    
        },
        {
            "student_id": "2",
            "subject": "Business strategies",
            "grade": 4.79,    
        },
        {
            "student_id": "3",
            "subject": "Design basics",
            "grade": 4.95,    
        },
    ]
    
    for grade in GRADES:
        Grade.objects.create(**grade)
        
        
# Retrieve information from table
def get_university_data():
    university_data = [
        str(uni) for uni in Student.objects.all()
    ]
    
    return ", ".join(university_data)

# print(get_university_data())


def get_students_data():
    students_data = [
        str(student) for student in Student.objects.all()
    ]
    
    return ", ".join(students_data)

# print(get_students_data())
        
        
# Update tables
def update_student():
    try:
        student = Student.objects.get(first_name="Valery")
        student.faculty_number = "1010101010"
        student.save()
    except Student.DoesNotExist as e:
        return f"Error: {e.args[0]}"
    
#update_student()


# Expect to raise error
def update_grade():
    try:
        grade = Grade.objects.get(student_id=4)
        grade.subject = "Biology"
        grade.grade = 3.75
        grade.save()
    except Student.DoesNotExist as e:
        return f"Error: {e.args[0]}"


# Truncate table
def truncate_universities():
    University.objects.all().delete()
    
# truncate_universities()