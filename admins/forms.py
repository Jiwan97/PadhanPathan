from django.forms import ModelForm, Textarea
from django import forms
from PadhanPathan.models import *

from taggit.forms import TagWidget

from admins.models import Response


class NewsForm(ModelForm):
    class Meta:
        model = News
        fields = "__all__"
        exclude = ['user']
        widgets = {
            'Tags': TagWidget(attrs={'data-role': 'tagsinput', })
        }

class CourseForm(ModelForm):
    class Meta:
        model = Course
        fields = "__all__"
        exclude = ['user']
        widgets = {
            'category': TagWidget(attrs={'data-role': 'tagsinput', })
        }


class ModuleForm(ModelForm):
    class Meta:
        model = CourseModule
        fields = "__all__"
        exclude = ['course']


class ExamForm(ModelForm):
    class Meta:
        model = ExamModel
        fields = "__all__"
        exclude = ['course', 'user']


class QnA(ModelForm):
    class Meta:
        model = ExamQNA
        fields = "__all__"
        exclude = ['exammodel', 'answer']


class MainExamForm(ModelForm):
    class Meta:
        model = ExamQuestion
        fields = ['question']

class ResponseForm(ModelForm):
    class Meta:
        model = Response
        fields = "__all__"
        exclude = ['user', 'contactMessage']
