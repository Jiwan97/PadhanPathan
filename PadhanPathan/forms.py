from django.forms import ModelForm, Textarea
from .models import *
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget

class RateForm(ModelForm):
    class Meta:
        model = CourseReview
        fields = ['rate']


class AnswerForm(ModelForm):
    class Meta:
        model = ExamAnswer
        fields = ['answer']


class AddQuestionForm(forms.ModelForm):
    question = forms.CharField(required=True,
                               widget=CKEditorUploadingWidget()
                               )

    language = forms.CharField(max_length=255, required=True,
                               widget=forms.TextInput(attrs={
                                   'class': 'form-control',
                                   'placeholder': 'Please input question languages'
                               })
                               )

    class Meta:
        model = Questions
        fields = ['question', 'language']


class AddAnswersForm(forms.ModelForm):
    description = forms.CharField(required=True,
                                  widget=CKEditorUploadingWidget()
                                  )

    class Meta:
        model = Answer
        fields = ['description', ]
