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

