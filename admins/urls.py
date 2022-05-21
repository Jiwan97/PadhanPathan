from django.urls import path
from admins import views

urlpatterns = [
    path('', views.admin_dashboard),

    path('allCourses/', views.allCourses, name='allcourses'),
    path('CourseCreate/', views.CourseCreate, name='createcourse'),
    path('editCourse/<int:course_id>/', views.editCourse),
    path('allModules/<int:course_id>', views.allModules),
    path('addModule/<int:course_id>', views.ModuleCreate),
    path('editModule/<int:course_id>/<int:module_id>/', views.editModule),
    path('delCourse/<int:course_id>/', views.DeleteCourse),
    path('delModule/<int:course_id>/<int:module_id>/', views.DeleteModule),
    path('allNews/', views.allNews, name='allnews'),
    path('newsPost/', views.newsPost, name='newspost'),
    path('allExams/<int:course_id>', views.allExams),
    path('examCreate/<int:course_id>/', views.ExamCreate, name='exam-create'),
    path('allQNA/<int:exam_id>', views.allQNA),
    path('qnaCreate/<int:exam_id>/', views.QNA),
    path('QsnCreate/<int:exam_id>', views.MainExam),
    path('ViewQsn/<int:exam_id>', views.ViewQsn),

]
