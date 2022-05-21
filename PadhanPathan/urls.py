from django.urls import path, include
from django.http import HttpResponse
from . import views


def index(request):
    return HttpResponse("This is test")


urlpatterns = [
    path('test/', index),
    path('home/', views.home, ),
    path('posts/', views.post_page, ),
    path('', views.home, ),
    path('courses/', views.courses),
    path('likedCourses/', views.Likedcourses),
    path('courseEnrolled/', views.enrolledCourse),
    path('courses/courseDesk/<int:course_id>/', views.courseDesk, name='courseDesk'),
    path('courseEnroll/<int:course_id>/', views.courseEnrollment),
    path('courseLike/', views.courseLike, name='courseLike'),
    path('delReviews/<int:course_id>/', views.DeleteReview, name='del-rev'),
    path('editReviews/<int:course_id>/', views.editReview, name='edit-rev'),
    path('contact/', views.contactmessages, name='contact'),
    path('newsPortal/', views.newsPortal, name='news-portal'),
    path('newsPortal/category/<slug:slug>', views.tagView),
    path('newsPortal/post-by/<str:username>', views.UserView),
    path('newsPortal/<int:id>/', views.newsView, name='news-view'),
    path('delComments/<int:news_id>/', views.DeleteComments, name='del-com'),
    path('courses/courseDesk/exam/<int:course_id>/<int:exam_id>/', views.Exam, name='exam-rev'),
    path('examResult', views.ExamScore, name='exam-result'),
    path('courses/courseDesk/exam2/<int:course_id>/<int:exam_id>/', views.Exam2),
    path("post_question/", views.Post_question, name="post_question"),
    path("question/<str:pk>/", views.question_details, name="question_details"),
    path("updatequestions/<str:pk>/", views.Update_question, name="updatequestions"),
    path("deletequestions/<str:pk>/", views.Delete_question, name="deletequestions"),
    path("hidequestions/<str:pk>/", views.Hide_question, name="hidequestions"),
    # path('timelapse', views.timeLapse, name='timeLapse')

]

