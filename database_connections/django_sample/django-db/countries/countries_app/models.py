from django.db import models
from django.core import validators

# Create your models here.
class University(models.Model):
    class Locations(models.TextChoices):
        Sofia = "Sofia",
        Plovdiv = "Plovdiv",
        Varna = "Varna",
        Pleven = "Pleven",
        Burgas = "Burgas",
    
    name = models.CharField(
        max_length=100,
    )
    
    location = models.CharField(
        choices=Locations.choices,
    )
    
    rating = models.DecimalField(
        max_digits=1,
        decimal_places=1,
    )
    
    def __str__(self) -> str:
        return f"University: {self.name}, location: {self.location}, rating:{self.rating}"
    

class Student(models.Model):
    first_name = models.CharField(
        max_length=100,
    )

    last_name = models.CharField(
        max_length=100,
    )
    
    faculty_number = models.CharField(
        max_length=10,
        unique=True,
    )
    
    year = models.IntegerField(
        default=1,
        validators=[
            validators.MinValueValidator(0),
            validators.MaxValueValidator(6),
        ],
    )
    
    university_id = models.ForeignKey(
        to=University, 
        on_delete=models.CASCADE,
    )
    
    def __str__(self) -> str:
        return f"Student: {self.first_name} {self.last_name}, fac_num: {self.faculty_number}, year: {self.year}"

class Grade(models.Model):
    student_id = models.ForeignKey(
        to=Student, 
        on_delete=models.CASCADE,
    )
    
    subject = models.CharField(
        max_length=100,
    )
    
    grade = models.DecimalField(
        max_digits=1, 
        decimal_places=2,
    )
    
    def __str__(self) -> str:
        return f"Grade: {self.grade}, subject: {self.subject}"