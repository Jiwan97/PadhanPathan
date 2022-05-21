from django.contrib import admin
from .models import *

admin.site.register(Course)
admin.site.register(CourseModule)
admin.site.register(News)
admin.site.register(ContactMessage)
admin.site.register(ExamModel)
admin.site.register(ExamQNA)
admin.site.register(ExamQuestion)


@admin.register(ReportCourses)
class ReportCourseAdmin(admin.ModelAdmin):
    list_display = ("comment", "report_choice", "reported_by", "date_reported")


@admin.register(ReportNews)
class ReportNewsAdmin(admin.ModelAdmin):
    list_display = ("comment", "report_choice", "reported_by", "date_reported")
