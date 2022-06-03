from django.urls import path, include
from django.http import HttpResponse
from . import views


def index(request):
    return HttpResponse("This is test")


urlpatterns = [
    path('test/', index),
    path('home/', views.home, name='home'),
    path('', views.home, ),
    path('courses/', views.courses, name='courses'),
    path('likedCourses/', views.Likedcourses),
    path('courseEnrolled/', views.enrolledCourse),
    path('courses/courseDesk/<int:course_id>/', views.courseDesk, name='courseDesk'),
    path('courseEnroll/<int:course_id>/', views.courseEnrollment),
    path('courseLike/', views.courseLike, name='courseLike'),
    path('delReviews/<int:course_id>/', views.DeleteReview, name='del-rev'),
    path('editReviews/<int:course_id>/', views.editReview, name='edit-rev'),
    # path('timelapse', views.timeLapse, name='timeLapse')

]

