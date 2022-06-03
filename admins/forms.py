from django.forms import ModelForm, Textarea
from django import forms
from PadhanPathan.models import *

from taggit.forms import TagWidget


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
