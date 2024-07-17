from django.shortcuts import render

from django.db.models import Count


from main.models import *
from django.http import HttpResponse, HttpResponseRedirect
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail

from django.db.models import Avg, Count, Min, Sum

from razorpay import Client
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy


# Create your views here.


############################################ START PUBLIC ###################################################

def index(request):
    
    return render(request,'index.html')

def login_form(request):
   

    if request.method=='POST':
        uname=request.POST['uname']
        passw=request.POST['passw']
        print(uname)
        try:
            lg=login.objects.get(username=uname,password=passw)
            print(lg)
            request.session['login_id']=lg.pk
            if lg.usertype == 'admin':
                
                return HttpResponse("<script>alert('Login Success');window.location='/admin_home'</script>")
            elif lg.usertype == 'Teacher':
                uu=teacher.objects.get(login_id=request.session['login_id'])
                print(uu.pk)
                request.session['teacher_id']=uu.pk
                return HttpResponse("<script>alert('Login Success');window.location='/teacher_home'</script>")
            elif lg.usertype == 'Student':
                st=student.objects.get(login_id=request.session['login_id'])
                print(st.pk)
                request.session['student_id']=st.pk
                return HttpResponse("<script>alert('Login Success');window.location='student_home'</script>")
        except:
            return HttpResponse("<script>alert('Invalid Username Or Password');window.location='login'</script>")

    return render(request,'login.html')

############################################## END PUBLIC #################################################

################################################## START ADMIN #############################################



def admin_home(request):
    scount = student.objects.count()
    print(scount)
    tcount = teacher.objects.count()
    print(tcount)

    al_st=student.objects.all()
    al_tc=teacher.objects.all()

    return render(request,'admin_home.html',{'scount':scount,'tcount':tcount,'al_st':al_st,'al_tc':al_tc})



def admin_manage_class(request):
    v_c=class_det.objects.all()
    if 'add_class' in request.POST:
        cname=request.POST['cname']
        a_year=request.POST['a_year']
        cc=class_det(class_det=cname,academic_year=a_year)
        cc.save()
        return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_class'</script>")
    
    
    return render(request,'admin_manage_class.html',{'v_c':v_c})

def admin_edit_class(request,class_id):
    v_c=class_det.objects.all()
    obj1=class_det.objects.get(class_id=class_id)
    if 'update' in request.POST:
        cname=request.POST['cname']
        obj=class_det.objects.get(class_id=class_id)
        obj.class_det=cname
        obj.save()
        return HttpResponse("<script>alert('Successfully Edited');window.location='/admin_manage_class'</script>")
    return render(request,'admin_manage_class.html',{'v_c':v_c,'obj':obj1})

def admin_delete_class(request,class_id):
    obj1=class_det.objects.get(class_id=class_id)
    obj1.delete()
    return HttpResponse("<script>alert('Successfully Deleted');window.location='/admin_manage_class'</script>")
    

def admin_manage_teacher(request):
  
    v_t=teacher.objects.all()
    sub=subject.objects.all()
    if 'add_tc' in request.POST:
     
        fname=request.POST['fname']
        lname=request.POST['lname']
        place=request.POST['place']
        phone=request.POST['phone']
        email=request.POST['email']
        uname=request.POST['uname']
        passw=request.POST['passw']
        sub=request.POST['sub']

        lg=login.objects.filter(username=uname)
        if lg:
            return HttpResponse("<script>alert('Username Already Exist');window.location='/admin_manage_teacher'</script>")
        else:
            lg=login(username=uname,password=passw,usertype='Teacher')
            lg.save()
            tchr=teacher(fname=fname,lname=lname,place=place,phone=phone,email=email,login=lg,subject_id=sub)
            tchr.save()
            send_mail(
            'HI'+fname +lname, 
            'Your user name is: '+uname+" \nPassword is : "+passw,
            'projectsriss2020@gmail.com', 
            [email], 
        fail_silently=False,
    )
            return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_teacher'</script>")
    
    return render(request,'admin_manage_teacher.html',{'v_t':v_t,'sub':sub})

def admin_edit_teachers(request,teacher_id):
    v_t=teacher.objects.all()
    obj1=teacher.objects.get(teacher_id=teacher_id)
    
    sub=subject.objects.all()
    if 'update' in request.POST:
        fname=request.POST['fname']
        lname=request.POST['lname']
        place=request.POST['place']
        phone=request.POST['phone']
        email=request.POST['email']
        obj=teacher.objects.get(teacher_id=teacher_id)
        obj.fname=fname
        obj.lname=lname
        obj.place=place
        obj.phone=phone
        obj.email=email
        obj.save()
        return HttpResponse("<script>alert('Successfully Edited');window.location='/admin_manage_teacher'</script>")
    return render(request,'admin_manage_teacher.html',{'v_t':v_t,'obj1':obj1,'sub':sub})

def admin_delete_teachers(request,teach_id):
    obj1=teacher.objects.get(teacher_id=teach_id)
    obj1.delete()
    return HttpResponse("<script>alert('Successfully Deleted');window.location='/admin_manage_teacher'</script>")


def admin_manage_timetable(request):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")

    v_c=class_det.objects.all()
    v_t=timetable.objects.all()
    subs=subject.objects.all()

    if 'add_time' in request.POST:
        class_id=request.POST['class_id']
        day=request.POST['day']
        sub1=request.POST['sub1']
        sub2=request.POST['sub2']
        sub3=request.POST['sub3']
        sub4=request.POST['sub4']
        sub5=request.POST['sub5']
        obj=timetable(day=day,p1_id=sub1,p2_id=sub2,p3_id=sub3,p4_id=sub4,p5_id=sub5,class_det_id=class_id)
        obj.save()
       
        return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_timetable'</script>")
    
    return render(request,'admin_manage_timetable.html',{'v_c':v_c,'v_t':v_t,'subs':subs})


def admin_edit_timetable(request,time_id):
    v_c=class_det.objects.all()
    v_t=timetable.objects.all()
    subs=subject.objects.all()

    et_time=timetable.objects.get(pk=time_id)

    if 'edit_time' in request.POST:
        class_id=request.POST['class_id']
        day=request.POST['day']
        sub1=request.POST['sub1']
        sub2=request.POST['sub2']
        sub3=request.POST['sub3']
        sub4=request.POST['sub4']
        sub5=request.POST['sub5']
        et_time.day=day
        et_time.p1_id=sub1
        et_time.p2_id=sub2
        et_time.p3_id=sub3
        et_time.p4_id=sub4
        et_time.p5_id=sub5
        et_time.class_det_id=class_id
        et_time.save()
       
        return HttpResponse("<script>alert('Successfully Changed');window.location='/admin_manage_timetable'</script>")
    
    return render(request,'admin_manage_timetable.html',{'v_c':v_c,'v_t':v_t,'subs':subs,'et_time':et_time})
        



def admin_manage_occation(request):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")

    v_c=occation.objects.all()
    
    if 'add_occation' in request.POST:
        occation_d=request.POST['occation']
        date=request.POST['date']
    
        tt=occation(occation_det=occation_d,occation_date=date)
        tt.save()
       
        return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_occation'</script>")
    
    return render(request,'admin_manage_occation.html',{'v_c':v_c,'dd':dd})

def admin_edit_occasion(request,occ_id):
    v_c=occation.objects.all()
    obj=occation.objects.get(occation_id=occ_id)
    if 'update' in request.POST:
        occation_d=request.POST['occation']
        occ=occation.objects.get(occation_id=occ_id)
        occ.occation_det=occation_d
        occ.save()
        return HttpResponse("<script>alert('Successfully Edited');window.location='/admin_manage_occation'</script>")
    return render(request,'admin_manage_occation.html',{'v_c':v_c,'obj':obj})

def admin_delete_occasion(request,occ_id):
    obj=occation.objects.get(occation_id=occ_id)
    obj.delete()
    return HttpResponse("<script>alert('Successfully Deleted');window.location='/admin_manage_occation'</script>")
    




def admin_add_student_fee(request,student_id):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    v_c=fee.objects.filter(student_id=student_id)
    if 'add_fee' in request.POST:
        fee_for=request.POST['fee_for']
        fees=request.POST['fee']
        tt=fee(fees=fees,date=dd,student_id=student_id,fees_title=fee_for,status="Pending")
        tt.save()
        return HttpResponse("<script>alert('Successfully Added');window.location='/teacher_manage_student'</script>")
    return render(request,'admin_add_student_fee.html',{'v_c':v_c})

def admin_view_class(request):
    val=class_det.objects.all()
    if 'search' in request.POST:
        cls=request.POST['cls']
        obj=student.objects.filter(class_det=cls)
        print(obj)
        print("##############################")
        return render(request,'admin_view_class.html',{'obj':obj,'val':val})
    return render(request,'admin_view_class.html',{'val':val})
        


# def admin_view_student_report(request,student_id):
#     import datetime
#     dd=datetime.datetime.now().strftime ("%Y-%m-%d")
#     v_c=fee.objects.filter(student_id=student_id)

#     return render(request,'admin_view_student_report.html',{'v_c':v_c})



def admin_view_student_attendance(request,student_id):
    
    v_c=attendance.objects.filter(student_id=student_id)

    return render(request,'admin_view_student_attendance.html',{'v_c':v_c})

def admin_edit_students(request,student_id):
    v_t=student.objects.all()
    obj1=student.objects.get(student_id=student_id)
    if 'update' in request.POST:
        fname=request.POST['fname']
        lname=request.POST['lname']
        place=request.POST['place']
        phone=request.POST['phone']
        dob=request.POST['dob']
        doa=request.POST['doa']
        obj=student.objects.get(student_id=student_id)
        obj.fname=fname
        obj.lname=lname
        obj.place=place
        obj.phone=phone
        obj.dob=dob
        obj.doa=doa
        obj.save()
        return HttpResponse("<script>alert('Successfully Edited');window.location='/teacher_manage_student'</script>")
    return render(request,'teacher_manage_student.html',{'obj1':obj1,'v_t':v_t})

def admin_delete_student(request,stu_id):
    obj=student.objects.get(student_id=stu_id)
    obj.delete()
    return HttpResponse("<script>alert('Successfully Deleted');window.location='/teacher_manage_student'</script>")

    




def admin_manage_subject(request):
    v_t=subject.objects.all()
    if 'add_sub' in request.POST:
        sub_name=request.POST['sub_name']
        sub=subject(subject_name=sub_name)
        sub.save()

        return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_subject'</script>")
    return render(request,'admin_manage_subject.html',{'v_t':v_t})


def admin_edit_subject(request,subject_id):
    v_t=subject.objects.all()
    esub=subject.objects.get(subject_id=subject_id)

    if 'up_sub' in request.POST:
        sub_name=request.POST['sub_name']
        esub1=subject.objects.get(subject_id=subject_id)
        esub1.subject_name=sub_name
        esub1.save()
        return HttpResponse("<script>alert('Successfully Edited');window.location='/admin_manage_subject'</script>")
   
    return render(request,'admin_manage_subject.html',{'v_t':v_t,'esub':esub})




def admin_remove_subject(request,subject_id):
    rsub=subject.objects.get(subject_id=subject_id)
    rsub.delete()

    return HttpResponse("<script>alert('Successfully Removed');window.location='/admin_manage_subject'</script>")
    



def admin_assign_class_to_teacher(request):
    rsub=class_det.objects.all()
    tchr=teacher.objects.all()
    
    if 'add_assign' in request.POST:
        cls=request.POST['cls']
        tcr=request.POST['tcr']
        try:
            q=class_assign.objects.get(class_det_id=cls,teacher_id=tcr)
            if q:
                return HttpResponse("<script>alert('Already Added');window.location='/admin_assign_class_to_teacher'</script>")
            else:
                qq=class_assign(class_det_id=cls,teacher_id=tcr)
                qq.save()
                return HttpResponse("<script>alert('Successfully Assigned');window.location='/admin_assign_class_to_teacher'</script>")
        except:
            qq=class_assign(class_det_id=cls,teacher_id=tcr)
            qq.save()
            return HttpResponse("<script>alert('Successfully Assigned');window.location='/admin_assign_class_to_teacher'</script>")
        

    v_t=class_assign.objects.all()

    return render(request,'admin_assign_class_to_teacher.html',{'rsub':rsub,'tchr':tchr,'v_t':v_t})
    




def admin_edit_assign(request,class_assign_id):
    rsub=class_det.objects.all()
    tchr=teacher.objects.all()

    v_t=class_assign.objects.all()

    esub1=class_assign.objects.get(pk=class_assign_id)

    if 'update_assign' in request.POST:
        cls=request.POST['cls']
        tcr=request.POST['tcr']
        esub1.class_det_id=cls
        esub1.teacher_id=tcr
        q=class_assign.objects.get(class_det_id=cls,teacher_id=tcr)
        if q:
            return HttpResponse("<script>alert('Already Added');window.location='/admin_assign_class_to_teacher'</script>")
        else:
            esub1.save()
            return HttpResponse("<script>alert('Successfully Edited');window.location='/admin_assign_class_to_teacher'</script>")
   
    return render(request,'admin_assign_class_to_teacher.html',{'rsub':rsub,'tchr':tchr,'esub1':esub1,'v_t':v_t})


def admin_remove_assign(request,class_assign_id):
    rsub=class_assign.objects.get(class_assign_id=class_assign_id)
    rsub.delete()

    return HttpResponse("<script>alert('Successfully Removed');window.location='/admin_assign_class_to_teacher'</script>")




def admin_manage_expense(request):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    expp=expense.objects.all().order_by("-expense_id")
    texp=expense.objects.annotate(Sum('expense_amount'))
    print(texp)
    print(texp.aggregate(total=Sum('expense_amount__sum')))
    tt=texp.aggregate(total=Sum('expense_amount__sum'))
    print(type(tt))
    print(tt["total"])
    total=tt["total"]

    
    if 'add_exp' in request.POST:
        exptitle=request.POST['exptitle']
        amount=request.POST['amount']
        qq=expense(expense_title=exptitle,expense_amount=amount,expense_date=dd)
        qq.save()
        return HttpResponse("<script>alert('Successfully Added');window.location='/admin_manage_expense'</script>")
    return render(request,'admin_manage_expense.html',{'expp':expp,'texp':total})



def admin_edit_exp(request,id):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    expp=expense.objects.all().order_by("-expense_id")
    texp=expense.objects.annotate(Sum('expense_amount'))
    print(texp)
    print(texp.aggregate(total=Sum('expense_amount__sum')))
    tt=texp.aggregate(total=Sum('expense_amount__sum'))
    print(type(tt))
    print(tt["total"])
    total=tt["total"]

    ed_expp=expense.objects.get(pk=id)

    if 'update_exp' in request.POST:
        exptitle=request.POST['exptitle']
        amount=request.POST['amount']
        ed_expp.expense_title=exptitle
        ed_expp.expense_amount=amount
        ed_expp.save()
        return HttpResponse("<script>alert('Successfully Changed');window.location='/admin_manage_expense'</script>")


    
    return render(request,'admin_manage_expense.html',{'ed_expp':ed_expp,'expp':expp,'texp':total})



def admin_delete_exp(request,id):
    rsub=expense.objects.get(pk=id)
    rsub.delete()

    return HttpResponse("<script>alert('Successfully Removed');window.location='/admin_manage_expense'</script>")


############################################## END ADMIN #################################################

############################################## START TEACHER #############################################




def teacher_home(request):
    
    return render(request,'teacher_home.html')



def teacher_manage_student(request):
    v_c=class_det.objects.all()
    v_t=student.objects.all()
    if 'add_tc' in request.POST:
        class_id=request.POST['class_id']
        fname=request.POST['fname']
        lname=request.POST['lname']
        place=request.POST['place']
        phone=request.POST['phone']
        dob=request.POST['dob']
        doa=request.POST['doa']
        uname=request.POST['uname']
        passw=request.POST['passw']
        ac_year=request.POST['ac_year']

        lg=login.objects.filter(username=uname)
        if lg:
            return HttpResponse("<script>alert('Username Already Exist');window.location='/teacher_manage_student'</script>")
        else:
            lg=login(username=uname,password=passw,usertype='Student')
            lg.save()
            tchr=student(fname=fname,lname=lname,place=place,phone=phone,login=lg,class_det_id=class_id,doa=doa,dob=dob,academic_year=ac_year)
            tchr.save()
            
            return HttpResponse("<script>alert('Successfully Added');window.location='/teacher_manage_student'</script>")
    
    return render(request,'teacher_manage_student.html',{'v_c':v_c,'v_t':v_t})




def teacher_view_students(request):
    tt=teacher.objects.get(pk=request.session['teacher_id'])
    v_t=student.objects.all()
    cls=class_det.objects.all()
    if 'v_st' in request.POST:
        cls_id=request.POST['cls_id']
        v_t=student.objects.filter(class_det_id=cls_id)
        return render(request,'teacher_view_students.html',{'v_t':v_t,'cls':cls})
    return render(request,'teacher_view_students.html',{'v_t':v_t,'cls':cls})



def teacher_view_timetable(request):
    tt=teacher.objects.get(pk=request.session['teacher_id'])
    v_t=timetable.objects.all()
    cls=class_det.objects.all()
    if 'v_st' in request.POST:
        cls_id=request.POST['cls_id']
        v_t=timetable.objects.filter(class_det_id=cls_id)
        return render(request,'teacher_view_timetable.html',{'v_t':v_t,'cls':cls})
    
    return render(request,'teacher_view_timetable.html',{'v_t':v_t,'cls':cls})


def teacher_view_occation(request):
    v_t=occation.objects.all()
    return render(request,'teacher_view_occation.html',{'v_t':v_t})

def teacher_add_assignment(request):
    tt=teacher.objects.get(pk=request.session['teacher_id'])
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    cls=class_assign.objects.filter(teacher_id=request.session['teacher_id'])
    subj=subject.objects.all()

    if 'add_ass' in request.POST:
        cls_id=request.POST['cls_id']
        sub=request.POST['sub']
        assign=request.POST['assign']
        det=request.POST['det']
        assing=assignment(subject=sub,assignment=assign,details=det,date=dd,class_det_id=cls_id,teacher_id=request.session['teacher_id'])
        assing.save()
        return HttpResponse("<script>alert('Successfully Added');window.location='/teacher_add_assignment'</script>")
    v_t=assignment.objects.filter(teacher_id=request.session['teacher_id'])
    return render(request,'teacher_add_assignment.html',{'v_t':v_t,'cls':cls,'subj':subj})



def teacher_add_notes(request):
    tt=teacher.objects.get(pk=request.session['teacher_id'])
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    cls=class_assign.objects.filter(teacher_id=request.session['teacher_id'])
    subj=subject.objects.all()

    if 'add_note' in request.POST:
        cls_id=request.POST['cls_id']
        sub=request.POST['sub']
        det=request.POST['det']
        image=request.FILES['image']
        fs=FileSystemStorage()
        fn=fs.save(image.name,image)

        nt=note(subject=sub,notes=det,date=dd,class_det_id=cls_id,teacher_id=request.session['teacher_id'],file=fn)
        nt.save()
        return HttpResponse("<script>alert('Successfully Added');window.location='/teacher_add_notes'</script>")
    v_t=note.objects.filter(teacher_id=request.session['teacher_id'])
    return render(request,'teacher_add_notes.html',{'v_t':v_t,'cls':cls,'subj':subj})


def teacher_view_uploaded_files(request,assignment_id):
    v_t=upload.objects.filter(assignment_id=assignment_id)
    j=0
    for i in range(1,len(v_t)+1):
        print('submit'+str(i))
        if 'submit'+str(i) in request.POST:
            umark=request.POST['umark'+str(i)]
            print(umark)
            print(j)
            print(v_t[j].pk)
            view_cmp_r=upload.objects.get(upload_id=v_t[j].pk)
            view_cmp_r.mark=umark
            view_cmp_r.save()
            
            return HttpResponse("<script>alert('Successfully Send..');window.location='/teacher_add_assignment'</script>")	
        j=j+1
    return render(request,'teacher_view_uploaded_files.html',{'v_t':v_t})



def teacher_add_result(request,student_id):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    sub=subject.objects.all()
    v_t=result.objects.filter(student_id=student_id)
    if 'add_res' in request.POST:
        sub=request.POST['sub']
        resl=request.POST['resl']
        rt=result(result=resl,subject=sub,student_id=student_id,date=dd)
        rt.save()
        return HttpResponse("<script>alert('Successfully Added..');window.location='/teacher_view_students'</script>")	
    
    return render(request,'teacher_add_result.html',{'v_t':v_t,'sub':sub})



def teacher_add_attendance(request):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    tt=teacher.objects.get(pk=request.session['teacher_id'])
    assi=class_assign.objects.filter(teacher_id=request.session['teacher_id'])
    a_t=attendance.objects.all()
    
    if 'v_st' in request.POST:
        cls_id=request.POST['cls_id']
        request.session['cls_id']=cls_id
        v_t=student.objects.filter(class_det_id=cls_id)
        a_t=attendance.objects.filter(class_det_id=cls_id)
        return render(request,'teacher_add_attendance.html',{'v_t':v_t,'a_t':a_t,'assi':assi})

    if 'add_att' in request.POST:
        student_id=request.POST['student_id']
        att=request.POST['att']
        try:
            atten=attendance.objects.get(date=dd,student_id=student_id,class_det_id=request.session['cls_id'])
            if atten:
                return HttpResponse("<script>alert('Already Added..');window.location='/teacher_add_attendance'</script>")	
            else:
                atten=attendance(date=dd,status=att,student_id=student_id,class_det_id=request.session['cls_id'])
                atten.save()
                return HttpResponse("<script>alert('Successfully Added..');window.location='/teacher_add_attendance'</script>")	
        except:
            atten=attendance(date=dd,status=att,student_id=student_id,class_det_id=request.session['cls_id'])
            atten.save()
            return HttpResponse("<script>alert('Successfully Added..');window.location='/teacher_add_attendance'</script>")	
  
    return render(request,'teacher_add_attendance.html',{'a_t':a_t,'assi':assi})


        



############################################## END TEACHER #################################################

############################################### START STUDENT ################################################




def student_home(request):
    
    return render(request,'student_home.html')



def student_view_attendance(request):
    v_t=attendance.objects.filter(student_id=request.session['student_id'])
    print(v_t)
    return render(request,'student_view_attendance.html',{'v_t':v_t})



def student_view_timetable(request):
    tt=student.objects.get(pk=request.session['student_id'])
    v_t=timetable.objects.filter(class_det_id=tt.class_det_id)
    return render(request,'student_view_timetable.html',{'v_t':v_t})



def student_view_occation(request):
    v_t=occation.objects.all()
    return render(request,'student_view_occation.html',{'v_t':v_t})


def student_view_fees(request):
    v_t=fee.objects.filter(student_id=request.session['student_id'])
    return render(request,'student_view_fees.html',{'v_t':v_t})


def student_view_assignments(request):
    tt=student.objects.get(pk=request.session['student_id'])
    v_t=assignment.objects.filter(class_det_id=tt.class_det_id)
    return render(request,'student_view_assignments.html',{'v_t':v_t})


def student_view_notes(request):
    tt=student.objects.get(pk=request.session['student_id'])
    v_t=note.objects.filter(class_det_id=tt.class_det_id)
    return render(request,'student_view_notes.html',{'v_t':v_t})


def student_upload_assignment(request,assignment_id):
    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")
    try:
        v_t=upload.objects.get(assignment_id=assignment_id,student_id=request.session['student_id'])
        return render(request,'student_upload_assignment.html',{'v_t':v_t})
    except:
       
        if 'add_file' in request.POST:
            image=request.FILES['image']
            fs=FileSystemStorage()
            fn=fs.save(image.name,image)
            ff=upload(file=fn,assignment_id=assignment_id,student_id=request.session['student_id'],date=dd,mark='NA')
            ff.save()
            return HttpResponse("<script>alert('Successfully Added');window.location='/student_view_assignments'</script>")   
    return render(request,'student_upload_assignment.html')


def student_view_result(request):
    v_t=result.objects.filter(student_id=request.session['student_id'])
    return render(request,'student_view_result.html',{'v_t':v_t})


########################################## END STUDENT #####################################################






########################################## BOOKING PAYMENT ###################################################



def user_make_payment(request,id,tamount):
    
    import datetime
    today=datetime.datetime.now().strftime ("%Y-%m-%d")
    print(today)
    print(">>>>>>>>>>>>>>>>",tamount)
    tot=float(tamount)
    print(type(tot))
    request.session['id']=id
    request.session['total']=tamount

    if request.method=="POST":
        amount = tot
        currency="INR"

            # Create Razorpay client object

        razorpay_client = Client(auth=("rzp_test_myOF7jDpkIqeD0", "lGAkCY9inaIl4fS1apPqP7Gi"))

            # Create a payment
        order = razorpay_client.order.create({
            "amount": amount,
            "currency": currency,
            'receipt': 'receipt_id'
        })

        # Get the order ID
        order_id = order['id']
        print(order_id)
        # if paytype == "cust_payment":
        s=fee.objects.get(pk=id)
        if s:
            s.status='Paid'
            s.save() 
        obj=payment(amount=amount,date=today,fee_id=id)
        obj.save()
        # if paytype == "booking_ty":
        #     import datetime
        #     dd=datetime.datetime.now().strftime ("%Y-%m-%d")
        #     s=booking.objects.get(booking_id=id)
        #     if s:
        #         s.status='Paid'
        #         s.save() 
             
        #     obj=payment(booking_id=id,booking_type='Booking',amount=amount,date=dd)
        #     obj.save()
        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/student_home';</script>")
   
    ss={}
   
    ss['total']=tot
    return render(request,'user_make_payment.html',{'total':tot,'id':id})



def rpay(request):
    print("Haiiiiiiiii")
    
    return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/user_payment_complete';</script>")
   

def user_payment_complete(request):

    import datetime
    dd=datetime.datetime.now().strftime ("%Y-%m-%d")

    # print(order_id)
    request.session['id']
    request.session['total']
    # if request.session['paytype'] == "cust_payment":
    s=fee.objects.get(pk=request.session['id'])
    if s:
        s.status='Paid'
        # s.order_id=order_id
        s.save()
        obj=payment(amount=request.session['total'],date=dd,fee_id=request.session['id'])
        obj.save()
    # if request.session['paytype'] == "booking_ty":
    #     s=booking.objects.get(booking_id=id)
    #     if s:
    #         s.status='Paid'
    #         # s.order_id=order_id
    #         s.save() 
    #         obj=payment(amount=request.session['total'],date=dd,booking_id=request.session['id'],booking_type='Booking')
    #         obj.save()
   
    return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/student_home';</script>")


################################################### END ####################################################
