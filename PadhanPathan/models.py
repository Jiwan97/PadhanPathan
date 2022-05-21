from django.db import models
from django.core import validators
from accounts.models import User
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
import readtime
from django.db.models import Avg

Report_Choice = [
    (1, 'Racist Question'),
    (2, 'Sexual Harassment'),
    (3, 'Harmful and Dangerous'),
    (4, 'Child Abuse'),
    (5, 'Spam or Misleading'),
    (6, 'Violent or Repulsive Content'),
    (7, 'Hateful or Abusive Content'),
]


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
    hide = models.BooleanField(default=False)
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

    def Exam(self):
        statement = ExamModel.objects.filter(course_id=self.pk).exists()
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


class News(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    heading = models.CharField("Title", max_length=200, null=True, default="Not Updated",
                               validators=[validators.MinLengthValidator(4)])
    content = RichTextUploadingField("Put Your Content Here", null=True, default="Not Updated",
                                     validators=[validators.MinLengthValidator(4)])

    news_pic = models.ImageField("News Pic", max_length=500, upload_to='static/uploads',
                                 default='static/images/newsDefault.jpg')
    date_posted = models.DateTimeField(auto_now_add=True)

    Tags = TaggableManager()

    def __str__(self):
        return self.heading

    def getComments(self):
        comment = NewsComment.objects.filter(news_id=self.pk).count()
        return comment


class ReportNews(models.Model):
    News = models.ForeignKey(News, on_delete=models.CASCADE)
    reported_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    date_reported = models.DateTimeField(auto_now_add=True)
    reported = models.BooleanField(default=False)
    report_choice = models.PositiveSmallIntegerField("Reported As", choices=Report_Choice)
    comment = models.CharField(max_length=50000, null=True, default="Not Updated")

    def __str__(self):
        return self.comment


class NewsComment(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    news = models.ForeignKey(News, null=True, on_delete=models.CASCADE)
    comment = models.CharField(max_length=200, null=True, default="Not Updated",
                               validators=[validators.MinLengthValidator(4)])

    date_commented = models.DateTimeField(auto_now_add=True)


class ExamModel(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    course = models.ForeignKey(Course, null=True, on_delete=models.CASCADE)
    ExamNumber = models.PositiveSmallIntegerField('Exam Number', null=True
                                                  )
    ExamTitle = models.CharField('Title', max_length=500, null=True, default="Not Updated",
                                 )
    date = models.DateTimeField(auto_now_add=True)

    def MCQ(self):
        statement = ExamQNA.objects.filter(exammodel_id=self.pk).exists()
        return statement

    def ExamQ(self):
        statement = ExamQuestion.objects.filter(exammodel_id=self.pk).exists()
        return statement


class ExamQNA(models.Model):
    exammodel = models.ForeignKey(ExamModel, null=True, on_delete=models.CASCADE)
    numb = models.PositiveSmallIntegerField("Number", default=0)
    question = models.CharField(max_length=5000, null=True)
    option1 = models.CharField("Option 1", max_length=5000, null=True)
    option2 = models.CharField("Option 2", max_length=5000, null=True)
    option3 = models.CharField("Option 3", max_length=5000, null=True)
    option4 = models.CharField("Option 4", max_length=5000, null=True)
    answer = models.CharField("Answer", max_length=5000, null=True)


class ExamQuestion(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    exammodel = models.OneToOneField(ExamModel, null=True, on_delete=models.CASCADE)
    question = RichTextUploadingField(max_length=5000, default="Paste Your Question in PDF Format HERE", null=True)
    date = models.DateTimeField(auto_now_add=True)


class ContactMessage(models.Model):
    firstname = models.CharField(max_length=100, null=True)
    lastname = models.CharField(max_length=100, null=True)
    email = models.EmailField(null=True)
    phonenumber = models.CharField(max_length=100, null=True)
    subject = models.CharField(max_length=100, null=True)
    query = models.CharField(max_length=1000, null=True)
    date = models.DateField(auto_now_add=True, null=True)
    responded = models.BooleanField(default=False)

    def __str__(self):
        return self.firstname


class ReportCourses(models.Model):
    Course = models.ForeignKey(Course, on_delete=models.CASCADE)
    reported_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    date_reported = models.DateTimeField(auto_now_add=True)
    reported = models.BooleanField(default=False)
    report_choice = models.PositiveSmallIntegerField("Reported As", choices=Report_Choice)
    comment = models.CharField(max_length=50000, null=True, default="Not Updated")

    def __str__(self):
        return self.comment


class Attempted(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    exammodel = models.ForeignKey(ExamModel, null=True, on_delete=models.CASCADE)
    date_attempted = models.DateTimeField(auto_now_add=True)
    attempted = models.BooleanField(default=False)
    user_score = models.PositiveSmallIntegerField("Score", default=0)


class ExamAnswer(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    examquestion = models.ForeignKey(ExamQuestion, null=True, on_delete=models.CASCADE)
    time = models.PositiveIntegerField(default=600)
    attempted = models.BooleanField(default=False)
    answer = RichTextUploadingField(max_length=5000, default="Paste Your Answer in PDF format here", null=True)
    date = models.DateTimeField(auto_now_add=True)


class Questions(models.Model):
    question = RichTextUploadingField()
    # question_type = models.ForeignKey(QuestionType, on_delete=models.SET_NULL, null=True)
    # question_category = models.ForeignKey(QuestionCategory, on_delete=models.SET_NULL, null=True)
    language = models.CharField(max_length=255)
    Posted_by = models.ForeignKey(User, on_delete=models.CASCADE)
    Posted_date = models.DateTimeField(auto_now_add=True)
    views = models.PositiveIntegerField(default=0)
    Upadte_date = models.DateTimeField(auto_now=True)
    reported_times = models.PositiveIntegerField(default=0)
    hidden = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = "Questions"

    def __str__(self):
        return self.question


class Answer(models.Model):
    main_question = models.ForeignKey(Questions, on_delete=models.CASCADE)
    description = models.TextField()
    like_count = models.PositiveIntegerField(default=0)
    dislike_count = models.PositiveIntegerField(default=0)
    views = models.PositiveIntegerField(default=0)
    Posted_by = models.ForeignKey(User, on_delete=models.CASCADE)
    posted_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "Answers"

    def __str__(self):
        return self.description
