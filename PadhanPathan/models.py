from django.db import models
from django.core import validators
from accounts.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
import readtime
from django.db.models import Avg


class Course(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    course_name = models.CharField("Course Name", max_length=200, null=True, default="Not Updated",
                                   )
    course_summary = models.CharField("Course Summary", max_length=200, null=True, default="Not Updated",
                                      )
    to_learn = RichTextField("What students needs to learn before joining this course", max_length=50000, null=True,
                             default="You can join this course right away",
                             )
    course_pic = models.ImageField("Course Pic", max_length=500, upload_to='static/uploads',
                                   default='static/images/slider-01.jpg')
    date = models.DateTimeField(auto_now_add=True, null=True)
    category = TaggableManager()

    def __str__(self):
        return self.course_name

    def getStars(self):
        total = CourseReview.objects.filter(course_id=self.pk).aggregate(Avg('rate'))
        loop = total['rate__avg']
        if loop is not None:
            dec = str(loop - int(loop))[2:]
            if '0' == dec:
                loop = int(loop)
                list = ['', '', '', '', '']
                for i in range(0, loop):
                    list[i] = i
                return list
            else:
                loop = int(loop)
                list = ['', '', '', '', '']
                for i in range(0, loop):
                    list[i] = i
                list[loop] = 'half'
                return list

        else:
            return loop

    def getEnroll(self):
        enrollcount = CourseEnrollement.objects.filter(course_id=self.pk).count()
        return enrollcount

    def getLikes(self):
        likes = CourseLike.objects.filter(course_id=self.pk).count()
        return likes

    def getReview(self):
        count = CourseReview.objects.filter(course_id=self.pk).count()
        return count

    def getModule(self):
        statement = CourseModule.objects.filter(course_id=self.pk).exists()
        return statement


class CourseEnrollement(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, null=True, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True, null=True)
    enrolled = models.BooleanField(default=False)


class CourseLike(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, null=True, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True, null=True)
    like = models.BooleanField(default=False)


class CourseModule(models.Model):
    course = models.ForeignKey(Course, null=True, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True, null=True)
    modulenumber = models.IntegerField('Lecture Number', null=True
                                       )
    module = models.CharField('Module Name', max_length=200, null=True,
                              )

    ModuleLecture = RichTextUploadingField('Module Lecture', max_length=50000, null=True,
                                           )

    def __str__(self):
        return self.module

    class Meta:
        ordering = ('modulenumber',)

    def get_readtime(self):
        result = readtime.of_text(self.ModuleLecture)
        return result.text


Rate_Choice = [
    (1, '1-Star'),
    (2, '2-Star'),
    (3, '3-Star'),
    (4, '4-Star'),
    (5, '5-Star'),
]


class CourseReview(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, null=True, on_delete=models.CASCADE)
    comment = models.CharField(max_length=50000, null=True, default="Not Updated",
                               )
    rate = models.PositiveSmallIntegerField("Choose Your Rating", choices=Rate_Choice)
    edited = models.BooleanField(default=False)
    date_commented = models.DateTimeField(auto_now_add=True)

    def stars(self):
        list = ['', '', '', '', '']
        for i in range(0, self.rate):
            list[i] = i
        return list
