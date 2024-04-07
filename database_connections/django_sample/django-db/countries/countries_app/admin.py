from django.contrib import admin

# Register your models here.
from .models import Student, University, Grade


admin.site.register(Student)
admin.site.register(University)
admin.site.register(Grade)
