from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.views.generic import ListView, DetailView

from admins.filters import VFilter1
from .models import *
from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from django.contrib import messages
from django.core.paginator import Paginator

from .forms import *
from taggit.models import Tag
from django.contrib.auth.decorators import login_required
from django.db.models import Avg
from json import dumps
import math
# from background_task import background
# from background_task.models import CompletedTask


def home(request):
    context = {
        'activate_h': 'active'}
    return render(request, 'PadhanPathan/home.html', context)

@login_required()
def courses(request):
    form = Course.objects.all().order_by('-date')
    V_filter = VFilter1(request.GET, queryset=form)
    V_final = V_filter.qs
    p = Paginator(V_final, 6)
    page_no = request.GET.get('page', 1)
    page = p.page(page_no)
    context = {
        'courses': page,
        'activate_cou': 'active',
        'url_next': '?next=/newsPortal',
    }
    return render(request, 'PadhanPathan/courses.html', context)


@login_required()
def Likedcourses(request):
    likedcourse = Course.objects.filter(courselike__user=request.user).order_by('-date')
    V_filter = VFilter1(request.GET, queryset=likedcourse)
    V_final = V_filter.qs
    p = Paginator(V_final, 6)
    page_no = request.GET.get('page', 1)
    page = p.page(page_no)
    context = {
        'courses': page,
        'activate_cou': 'active',
        'url_next': '?next=/newsPortal',
    }
    return render(request, 'PadhanPathan/courseLike.html', context)


@login_required()
def enrolledCourse(request):
    enrolledcourse = Course.objects.filter(courseenrollement__user=request.user).order_by('-date')
    V_filter = VFilter1(request.GET, queryset=enrolledcourse)
    V_final = V_filter.qs
    p = Paginator(V_final, 6)
    page_no = request.GET.get('page', 1)
    page = p.page(page_no)
    context = {
        'courses': page,
        'activate_cou': 'active',
        'url_next': '?next=/newsPortal',
    }
    return render(request, 'PadhanPathan/courses.html', context)


@login_required()
def courseEnrollment(request, course_id):
    if CourseEnrollement.objects.filter(course_id=course_id, user=request.user).exists():
        messages.add_message(request, messages.SUCCESS,
                             'You are already enrolled to this course')
        return redirect(f'/courses/courseDesk/{course_id}')
    else:
        enroll = CourseEnrollement()
        enroll.user = request.user
        enroll.course_id = course_id
        enroll.enrolled = True
        enroll.save()
        messages.add_message(request, messages.SUCCESS,
                             'You have successfully enrolled to this course')
        return redirect(f'/courses/courseDesk/{course_id}')


@login_required()
def courseLike(request):
    course_id = request.GET.get('id', None)
    if CourseLike.objects.filter(course_id=course_id, user=request.user).exists():
        liked = CourseLike.objects.filter(course_id=course_id, user=request.user)
        liked.delete()
        messages.add_message(request, messages.SUCCESS,
                             'This course has been removed from your wishlist')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        liked = CourseLike()
        liked.user = request.user
        liked.course_id = course_id
        liked.like = True
        liked.save()
        messages.add_message(request, messages.SUCCESS,
                             'You have saved this course for later')
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


@login_required()
def courseDesk(request, course_id):
    if request.method == 'POST':
        if CourseReview.objects.filter(course_id=course_id, user=request.user).exists():
            pass
        else:
            data = CourseReview()
            try:
                rate = int(request.POST.get('rate'))
            except:
                rate = 1
            data.rate = rate
            data.comment = request.POST.get('comment-message')
            data.user = request.user
            data.course_id = course_id
            data.save()
            # return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
            count = CourseReview.objects.filter(course_id=course_id).count()
            if count == 0 or count == 1:
                review = "Review"
            else:
                review = "Reviews"
            comment_data = CourseReview.objects.values().get(id=data.pk)
            admin = ['']
            if data.user.is_staff:
                admin[0] = ['<b style="background-color:#da0b4e;" class="badge badge-info ml-2">Admin</b>']
            Avg_data = CourseReview.objects.filter(course_id=course_id).aggregate(Avg('rate'))
            loop = Avg_data['rate__avg']
            dec = str(loop - int(loop))[2:]
            star = '<li><i style="color: #ffc600;" class="fa fa-star-o"></i></li>'
            if '0' == dec:
                total_star = ['', star, star, star, star]
                for i in range(0, int(loop)):
                    total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
            else:
                total_star = ['', star, star, star, star]
                for i in range(0, int(loop)):
                    total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
                total_star[int(loop)] = '<li><i style="color: #ffc600;" class="fa fa-star-half-o"></i></li>'

            star1 = '<li><i style="font-size:12px; color:#d1d1d1;" class="fa fa-star"></i></li>'
            tagstar = ['', star1, star1, star1, star1]
            for i in range(0, comment_data['rate']):
                tagstar[i] = '<li><i style="font-size:12px;" class="fa fa-star"></i></li>'

            poststar_rate = []
            for i in range(0, 5):
                stars = f'<i style="padding-right:5px;" class="fa fa-star  my-btn" id="{i}"></i>'
                poststar_rate.append(stars)
            for i in range(0, comment_data['rate']):
                poststar_rate[i] = f'<i style="padding-right:5px;" class="fa fa-star checked my-btn" id="{i}"></i>'

            return JsonResponse(
                {'data': comment_data, 'review': review, 'count': count,
                 'tagstar': tagstar, 'poststar_rate': poststar_rate, 'total_star': total_star},
                safe=False)

    enrollment = CourseEnrollement.objects.filter(course_id=course_id, user=request.user).exists()
    enrollcount = CourseEnrollement.objects.filter(course_id=course_id).count()
    modulecount = CourseModule.objects.filter(course_id=course_id).count()
    maylike = Course.objects.all().order_by('date')[:3]
    form = Course.objects.get(id=course_id)
    tags = form.category.last()
    related = Course.objects.filter(category=tags).exclude(id=course_id).order_by('-date')[:2]
    lesson = CourseModule.objects.filter(course_id=course_id)

    review_comment = CourseReview.objects.filter(course_id=course_id).order_by('-date_commented')
    can_review = CourseReview.objects.filter(user=request.user, course_id=course_id).exists()
    tagstars = []
    if can_review:
        data = CourseReview.objects.get(user=request.user, course_id=course_id)
        for i in range(0, 5):
            stars = f'<i style="padding-right:5px;" class="fa fa-star  my-btn" id="{i}"></i>'
            tagstars.append(stars)

        for i in range(0, data.rate):
            tagstars[i] = f'<i style="padding-right:5px;" class="fa fa-star checked my-btn" id="{i}"></i>'

    context = {
        'course': form,
        'lesson': lesson,
        'category': tags,
        'enrollment': enrollment,
        'related': related,
        'courselike': maylike,
        'enrollcount': enrollcount,
        'modulecount': modulecount,
        'activate_cou': 'active',
        'url_next': f'?next=/courses/courseDesk/{course_id}',
        'activate_couD': 'active',
        'comments': review_comment,
        'can_review': can_review,
        'tagstars': tagstars,

    }

    return render(request, 'PadhanPathan/coursesDescription.html', context)


def editReview(request, course_id):
    comment_edit_data = request.GET.get('commented_data', None)
    try:
        edited_rate = int(request.GET.get('edited_rate'))
    except:
        edited_rate = 1
    review = CourseReview.objects.get(course_id=course_id, user=request.user)
    review.comment = comment_edit_data
    review.rate = edited_rate
    review.edited = True
    review.save()
    data = CourseReview.objects.values().get(course_id=course_id, user=request.user)
    count = CourseReview.objects.filter(course_id=course_id).count()
    if count == 0 or count == 1:
        review = "Review"
    else:
        review = "Reviews"
    Avg_data = CourseReview.objects.filter(course_id=course_id).aggregate(Avg('rate'))
    loop = Avg_data['rate__avg']
    dec = str(loop - int(loop))[2:]
    star = '<li><i style="color: #ffc600;" class="fa fa-star-o"></i></li>'
    if '0' == dec:
        total_star = ['', star, star, star, star]
        for i in range(0, int(loop)):
            total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
    else:
        total_star = ['', star, star, star, star]
        for i in range(0, int(loop)):
            total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
        total_star[int(loop)] = '<li><i style="color: #ffc600;" class="fa fa-star-half-o"></i></li>'

    star1 = '<li><i style="font-size:12px; color:#d1d1d1;" class="fa fa-star"></i></li>'
    tagstar = ['', star1, star1, star1, star1]
    for i in range(0, data['rate']):
        tagstar[i] = '<li><i style="font-size:12px;" class="fa fa-star"></i></li>'

    return JsonResponse(
        {'data': data, 'tagstar': tagstar, 'total_star': total_star, 'count': count, 'review': review,
         },
        safe=False)


def DeleteReview(request, course_id):
    id = request.GET.get('id', None)
    delete = CourseReview.objects.get(id=id)
    delete.delete()
    star = '<li><i style="color: #ffc600;" class="fa fa-star-o"></i></li>'
    try:
        Avg_data = CourseReview.objects.filter(course_id=course_id).aggregate(Avg('rate'))
        loop = Avg_data['rate__avg']
        dec = str(loop - int(loop))[2:]
        if '0' == dec:
            total_star = ['', star, star, star, star]
            for i in range(0, int(loop)):
                total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
        else:
            total_star = ['', star, star, star, star]
            for i in range(0, int(loop)):
                total_star[i] = '<li><i style="color: #ffc600;" class="fa fa-star"></i></li>'
            total_star[int(loop)] = '<li><i style="color: #ffc600;" class="fa fa-star-half-o"></i></li>'

    except Exception:
        total_star = [star, star, star, star, star]
    count = CourseReview.objects.filter(course_id=course_id).count()
    if count == 0 or count == 1:
        review = "Review"
    else:
        review = "Reviews"
    return JsonResponse({'count': count, 'review': review, 'total_star': total_star}, safe=False)
