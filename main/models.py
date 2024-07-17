from django.db import models

# Create your models here.


class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=225)
    password=models.CharField(max_length=225)
    usertype=models.CharField(max_length=225)

class class_det(models.Model):
    class_id=models.AutoField(primary_key=True)
    class_det=models.CharField(max_length=225)
    academic_year=models.CharField(max_length=225)
    
class subject(models.Model):
    subject_id=models.AutoField(primary_key=True)
    subject_name=models.CharField(max_length=225)


class teacher(models.Model):
    teacher_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    fname=models.CharField(max_length=225)
    lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    email=models.CharField(max_length=225)
    subject=models.ForeignKey(subject,on_delete=models.CASCADE)

class class_assign(models.Model):
    class_assign_id=models.AutoField(primary_key=True)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)
    teacher=models.ForeignKey(teacher,on_delete=models.CASCADE)

class timetable(models.Model):
    timetable_id=models.AutoField(primary_key=True)
    day=models.CharField(max_length=225)
    p1_id=models.CharField(max_length=225)
    p2_id=models.CharField(max_length=225)
    p3_id=models.CharField(max_length=225)
    p4_id=models.CharField(max_length=225)
    p5_id=models.CharField(max_length=225)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)

class student(models.Model):
    student_id=models.AutoField(primary_key=True)
    login=models.ForeignKey(login,on_delete=models.CASCADE)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)
    fname=models.CharField(max_length=225)
    lname=models.CharField(max_length=225)
    place=models.CharField(max_length=225)
    phone=models.CharField(max_length=225)
    dob=models.CharField(max_length=225)
    doa=models.CharField(max_length=225)
    academic_year=models.CharField(max_length=225)


class fee(models.Model):
    fee_id=models.AutoField(primary_key=True)
    student=models.ForeignKey(student,on_delete=models.CASCADE)
    fees_title=models.CharField(max_length=225)
    fees=models.CharField(max_length=225)
    date =models.CharField(max_length=225)
    status =models.CharField(max_length=225)

class attendance(models.Model):
    attendance_id=models.AutoField(primary_key=True)
    student=models.ForeignKey(student,on_delete=models.CASCADE)
    date =models.CharField(max_length=225)
    status =models.CharField(max_length=225)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)

class result(models.Model):
    result_id=models.AutoField(primary_key=True)
    subject =models.CharField(max_length=225)
    result =models.CharField(max_length=225)
    date  =models.CharField(max_length=225)
    student=models.ForeignKey(student,on_delete=models.CASCADE)
    

class assignment(models.Model):
    assignment_id=models.AutoField(primary_key=True)
    subject =models.CharField(max_length=225)
    assignment =models.CharField(max_length=225)
    details  =models.CharField(max_length=225)
    date   =models.CharField(max_length=225)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)
    teacher=models.ForeignKey(teacher,on_delete=models.CASCADE)

class upload(models.Model):
    upload_id=models.AutoField(primary_key=True)
    assignment=models.ForeignKey(class_det,on_delete=models.CASCADE)
    file=models.ImageField(upload_to='static/media')
    date =models.CharField(max_length=225)
    student=models.ForeignKey(student,on_delete=models.CASCADE)
    mark=models.CharField(max_length=225)

class note(models.Model):
    note_id=models.AutoField(primary_key=True)
    subject =models.CharField(max_length=225)
    notes  =models.CharField(max_length=225)
    file=models.ImageField(upload_to='static/media')
    date   =models.CharField(max_length=225)
    class_det=models.ForeignKey(class_det,on_delete=models.CASCADE)
    teacher=models.ForeignKey(teacher,on_delete=models.CASCADE)

class payment(models.Model):
    payment_id=models.AutoField(primary_key=True)
    fee =models.ForeignKey(fee,on_delete=models.CASCADE)
    amount  =models.CharField(max_length=225)
    date   =models.CharField(max_length=225)

class occation(models.Model):
    occation_id=models.AutoField(primary_key=True)
    occation_det=models.CharField(max_length=225)
    occation_date=models.CharField(max_length=225)
    
class expense(models.Model):
    expense_id=models.AutoField(primary_key=True)
    expense_title=models.CharField(max_length=225)
    expense_amount=models.CharField(max_length=225)
    expense_date=models.CharField(max_length=225)
