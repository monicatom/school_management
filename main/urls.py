"""school_management URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .import views

urlpatterns = [
    path('', views.index,name='index'),
    path('login', views.login_form,name='login'),

    path('admin_home', views.admin_home,name='admin_home'),
    path('admin_manage_class', views.admin_manage_class,name='admin_manage_class'),
    path('admin_manage_teacher', views.admin_manage_teacher,name='admin_manage_teacher'),
    path('admin_manage_timetable', views.admin_manage_timetable,name='admin_manage_timetable'),
    path('admin_manage_occation', views.admin_manage_occation,name='admin_manage_occation'),
    path('admin_delete_occasion/<occ_id>',views.admin_delete_occasion,name='admin_delete_occasion'),
    path('admin_add_student_fee/<student_id>', views.admin_add_student_fee,name='admin_add_student_fee'),
    # path('admin_view_student_report/<student_id>', views.admin_view_student_report,name='admin_view_student_report'),
    path('admin_view_student_attendance/<student_id>', views.admin_view_student_attendance,name='admin_view_student_attendance'),
    path('teacher_manage_student', views.teacher_manage_student,name='teacher_manage_student'),
    path('admin_edit_class/<class_id>',views.admin_edit_class,name='admin_edit_class'),
    path('admin_delete_class/<class_id>',views.admin_delete_class,name='admin_delete_class'),
    path('admin_view_class',views.admin_view_class,name='admin_view_class'),

    path('admin_edit_teachers/<teacher_id>',views.admin_edit_teachers,name='admin_edit_teachers'),
    path('admin_edit_timetable/<time_id>',views.admin_edit_timetable,name='admin_edit_timetable'),
    path('admin_edit_students/<student_id>',views.admin_edit_students,name='admin_edit_students'),
    path('admin_edit_occasion/<occ_id>',views.admin_edit_occasion,name='admin_edit_occasion'),
    path('admin_manage_subject',views.admin_manage_subject,name='admin_manage_subject'),
    path('admin_edit_subject/<subject_id>',views.admin_edit_subject,name='admin_edit_subject'),
    path('admin_remove_subject/<subject_id>',views.admin_remove_subject,name='admin_remove_subject'),
    path('admin_delete_student/<stu_id>',views.admin_delete_student,name='admin_delete_student'),

    path('admin_assign_class_to_teacher',views.admin_assign_class_to_teacher,name='admin_assign_class_to_teacher'),
    path('admin_edit_assign/<class_assign_id>',views.admin_edit_assign,name='admin_edit_assign'),
    path('admin_remove_assign/<class_assign_id>',views.admin_remove_assign,name='admin_remove_assign'),
    path('admin_manage_expense',views.admin_manage_expense,name='admin_manage_expense'),
    path('admin_edit_exp/<id>',views.admin_edit_exp,name='admin_edit_exp'),
    path('admin_delete_exp/<id>',views.admin_delete_exp,name='admin_delete_exp'),
    

    
    
    
    
    
    
    
    path('teacher_home', views.teacher_home,name='teacher_home'),
    path('teacher_view_students', views.teacher_view_students,name='teacher_view_students'),
    path('teacher_view_timetable', views.teacher_view_timetable,name='teacher_view_timetable'),
    path('teacher_view_occation', views.teacher_view_occation,name='teacher_view_occation'),
    path('teacher_add_assignment', views.teacher_add_assignment,name='teacher_add_assignment'),
    path('teacher_add_notes', views.teacher_add_notes,name='teacher_add_notes'),
    path('teacher_view_uploaded_files/<assignment_id>', views.teacher_view_uploaded_files,name='teacher_view_uploaded_files'),
    path('teacher_add_result/<student_id>', views.teacher_add_result,name='teacher_add_result'),
    path('teacher_add_attendance', views.teacher_add_attendance,name='teacher_add_attendance'),




    path('student_home', views.student_home,name='student_home'),
    path('student_view_attendance', views.student_view_attendance,name='student_view_attendance'),
    path('student_view_timetable', views.student_view_timetable,name='student_view_timetable'),
    path('student_view_occation', views.student_view_occation,name='student_view_occation'),
    path('student_view_fees', views.student_view_fees,name='student_view_fees'),
    path('student_view_assignments', views.student_view_assignments,name='student_view_assignments'),
    path('student_view_notes', views.student_view_notes,name='student_view_notes'),
    path('student_upload_assignment/<assignment_id>', views.student_upload_assignment,name='student_upload_assignment'),
    path('student_view_result', views.student_view_result,name='student_view_result'),
    
    
    path('user_make_payment/<id>/<tamount>',views.user_make_payment,name='user_make_payment'),
    path('rpay', views.rpay,name='rpay'),
    path('user_payment_complete', views.user_payment_complete,name='user_payment_complete'),
    
    
    
    


    
]
