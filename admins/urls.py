from django.urls import path
from admins import views

urlpatterns = [
    path('', views.admin_dashboard),

    path('allCourses/', views.allCourses, name="allcourses"),
    path('CourseCreate/', views.CourseCreate, name="createcourse"),
    path('editCourse/<int:course_id>/', views.editCourse),
    path('allModules/<int:course_id>', views.allModules),
    path('addModule/<int:course_id>', views.ModuleCreate),
    path('editModule/<int:course_id>/<int:module_id>/', views.editModule),
    path('delCourse/<int:course_id>/', views.DeleteCourse),
    path('delModule/<int:course_id>/<int:module_id>/', views.DeleteModule),
]
