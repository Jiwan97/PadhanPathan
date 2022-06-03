from django.shortcuts import render, redirect, get_object_or_404
from accounts.auth import admin_only
from django.contrib import messages
from django.contrib.auth.decorators import login_required
# from accounts.views import send_response_email
from accounts.models import User
from .forms import *
from PadhanPathan.models import *
import os
from accounts.error_render import errors


@login_required()
@admin_only
def admin_dashboard(request):
    totalNews = News.objects.all().count()
    users = User.objects.filter(is_staff=False)

    totalcourse = Course.objects.all().count()
    context = {'users': users,
               'totalcourse': totalcourse}
    return render(request, 'admins/adminDashboard.html', context)









@login_required()
@admin_only
def allCourses(request):
    total_courses = Course.objects.all().order_by('-id')
    context = {'courses': total_courses}
    return render(request, 'admins/allCourses.html', context)


@login_required()
@admin_only
def CourseCreate(request):
    form = CourseForm()
    if request.method == "POST":
        form = CourseForm(request.POST, request.FILES)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.user = request.user
            instance.save()
            form.save_m2m()
            messages.success(request, 'Course added successfully.')
            return redirect('/admins-dashboard/allCourses')
        else:
            errors(request, form)
    context = {'form': form}
    return render(request, 'admins/CreateAdd.html', context)


def editCourse(request, course_id):
    course = Course.objects.get(id=course_id)
    form = CourseForm(instance=course)
    if course.user_id == request.user.id:
        if request.method == 'POST':
            form = CourseForm(request.POST, request.FILES, instance=course)
            if form.is_valid():
                form.save()
                messages.success(request, 'Course updated successfully.')
                return redirect('/admins-dashboard/allCourses')
            else:
                errors(request, form)
    else:
        messages.warning(request, 'You do not have permission to edit this course.')
        return redirect('/admins-dashboard/allCourses')

    context = {
        'form': form,
    }
    return render(request, 'admins/updateEdit.html', context)


@login_required
@admin_only
def DeleteCourse(request, course_id):
    delete = Course.objects.get(id=course_id)
    if delete.user_id == request.user.id:
        if delete.course_pic == 'static/images/slider-01.jpg':
            delete.delete()
        else:
            os.remove(delete.course_pic.path)
            delete.delete()
        messages.success(request, 'Course Successfully Deleted')
        return redirect('/admins-dashboard/allCourses')
    else:
        messages.warning(request, 'You do not have permission to delete this course.')
        return redirect('/admins-dashboard/allCourses')


@login_required()
@admin_only
def allModules(request, course_id):
    total_modules = CourseModule.objects.filter(course_id=course_id)
    context = {'modules': total_modules,
               'course_id': course_id}
    return render(request, 'admins/allModules.html', context)


@login_required()
@admin_only
def ModuleCreate(request, course_id):
    form = ModuleForm()
    course = Course.objects.get(id=course_id)
    if course.user_id == request.user.id:
        if request.method == "POST":
            form = ModuleForm(request.POST)
            context = {'form': form}
            if form.is_valid():
                number = form.cleaned_data['modulenumber']
                if CourseModule.objects.filter(course_id=course_id, modulenumber=number).exists():
                    messages.add_message(request, messages.ERROR,
                                         'Lecture no. already exits')
                    return render(request, 'admins/CreateAdd.html', context)
                instance = form.save(commit=False)
                instance.course = course
                instance.save()
                messages.success(request, 'Module added successfully.')
                return redirect(f'/admins-dashboard/allModules/{course_id}')
            else:
                errors(request, form)
    else:
        messages.warning(request, 'You do not have permission to add module to this course.')
        return redirect('/admins-dashboard/allCourses')
    context = {'form': form}
    return render(request, 'admins/CreateAdd.html', context)


@login_required
@admin_only
def editModule(request, course_id, module_id):
    Module = CourseModule.objects.get(id=module_id)
    form = ModuleForm(instance=Module)
    if request.method == 'POST':
        form = ModuleForm(request.POST, instance=Module)
        context = {'form': form}
        if form.is_valid():
            number = form.cleaned_data['modulenumber']
            # try:
            #     delete = CourseModule.objects.get(course_id=course_id, id=module_id)
            #     delete.modulenumber = 0
            #     delete.save()
            # except Exception:
            #     pass
            if CourseModule.objects.filter(course_id=course_id, modulenumber=number).exclude(id=module_id).exists():
                messages.add_message(request, messages.ERROR,
                                     'Lecture no. already exits')
                return render(request, 'admins/updateEdit.html', context)
            form.save()
            messages.success(request, 'Module updated successfully.')
            return redirect(f'/admins-dashboard/allModules/{course_id}')
        else:
            errors(request, form)
    context = {
        'form': form,
    }
    return render(request, 'admins/updateEdit.html', context)


@login_required
@admin_only
def DeleteModule(request, course_id, module_id):
    delete = CourseModule.objects.get(id=module_id)
    delete.delete()
    return redirect(f'/admins-dashboard/allModules/{course_id}')


@login_required()
@admin_only
def allNews(request):
    totalNews = News.objects.all().order_by('-id')
    context = {'news': totalNews}
    return render(request, 'admins/allNews.html', context)


@login_required()
@admin_only
def newsPost(request):
    form = NewsForm()
    if request.method == "POST":
        form = NewsForm(request.POST, request.FILES)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.user = request.user
            instance.save()
            form.save_m2m()
            messages.success(request, 'News added successfully.')
            return redirect('/admins-dashboard/allNews')

    context = {'form': form}
    return render(request, 'admins/CreateAdd.html', context)


@login_required()
@admin_only
def allExams(request, course_id):
    total_Exams = ExamModel.objects.filter(course_id=course_id)
    context = {'exams': total_Exams,
               'course_id': course_id}
    return render(request, 'admins/allExams.html', context)


@login_required()
@admin_only
def ExamCreate(request, course_id):
    form = ExamForm()
    course = Course.objects.get(id=course_id)
    if course.user_id == request.user.id:
        if request.method == "POST":
            form = ExamForm(request.POST)
            context = {'form': form}
            if form.is_valid():
                number = form.cleaned_data['ExamNumber']
                if ExamModel.objects.filter(course_id=course_id, ExamNumber=number).exists():
                    messages.add_message(request, messages.ERROR,
                                         'Exam no. already exits')
                    return render(request, 'admins/CreateAdd.html', context)
                instance = form.save(commit=False)
                instance.course = course
                instance.user = request.user
                instance.save()
                messages.success(request, 'Exam Details added successfully.')
                return redirect(f'/admins-dashboard/allExams/{course_id}')
            else:
                errors(request, form)
            # else:
            #     messages.add_message(request, messages.ERROR,
            #                          "Please don't leave anything blank")
            # return render(request, 'admins/CreateAdd.html', context)
    else:
        messages.warning(request, 'You do not have permission to add module to this course.')
        return redirect('/admins-dashboard/allCourses')
    context = {'form': form}
    return render(request, 'admins/CreateAdd.html', context)

@login_required()
@admin_only
def allQNA(request, exam_id):
    total_QNA = ExamQNA.objects.filter(exammodel_id=exam_id)
    context = {'total': total_QNA,
               'exam_id': exam_id}
    return render(request, 'admins/allQNA.html', context)


@login_required()
@admin_only
def QNA(request, exam_id):
    form = QnA()
    Exam = ExamModel.objects.get(id=exam_id)
    if Exam.user_id == request.user.id:
        if request.method == "POST":
            form = QnA(request.POST)
            answer = request.POST.get('answer')
            context = {'form': form}
            if form.is_valid():
                number = form.cleaned_data['numb']
                option1 = form.cleaned_data['option1']
                option2 = form.cleaned_data['option2']
                option3 = form.cleaned_data['option3']
                option4 = form.cleaned_data['option4']

                if ExamQNA.objects.filter(exammodel=exam_id, numb=number).exists():
                    messages.add_message(request, messages.ERROR,
                                         'Question no. already exits')
                    return render(request, 'admins/addMCQ.html', context)
                elif option1 in (option2, option3, option4) or option2 in (option1, option3, option4) or option3 in (
                        option1, option2, option4) or option4 in (option1, option3, option2):
                    messages.add_message(request, messages.ERROR,
                                         'Options must be different')
                    return render(request, 'admins/addMCQ.html', context)

                instance = form.save(commit=False)
                instance.exammodel = Exam
                instance.answer = answer
                instance.save()
                messages.success(request, 'MCQ added successfully.')
                return redirect(f'/admins-dashboard/allQNA/{exam_id}')
            else:
                errors(request, form)
    else:
        messages.warning(request, 'You do not have permission.')
        return redirect('/admins-dashboard/allCourses')
    context = {'form': form}
    return render(request, 'admins/addMCQ.html', context)


@login_required()
@admin_only
def MainExam(request, exam_id):
    form = MainExamForm()
    Exam = ExamModel.objects.get(id=exam_id)
    if Exam.user_id == request.user.id:
        if request.method == "POST":
            form = MainExamForm(request.POST)
            context = {'form': form}
            if form.is_valid():
                instance = form.save(commit=False)
                instance.exammodel = Exam
                instance.user = request.user
                instance.save()
                messages.success(request, f'Question for {Exam.ExamTitle} added successfully.')
                return redirect(f'/admins-dashboard/ViewQsn/{exam_id}')
            else:
                errors(request, form)
    else:
        messages.warning(request, 'You do not have permission.')
        return redirect('/admins-dashboard/allCourses')
    context = {'form': form}
    return render(request, 'admins/CreateAdd.html', context)

@login_required()
@admin_only
def ViewQsn(request, exam_id):
    Exam_Qsn = ExamQuestion.objects.filter(exammodel_id=exam_id)
    context = {'total': Exam_Qsn,
               'exam_id': exam_id}
    return render(request, 'admins/viewQsn.html', context)
