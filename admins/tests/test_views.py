from django.test import TestCase, Client
from django.urls import reverse, resolve
from admins.models import *
import json


class TestViews(TestCase):
    def setUp(self):
        self.client = Client()
        self.pathanurl = reverse('allcourses')
        self.pathanurl1 = reverse('createcourse')
        self.pathanurl2 = reverse('allnews')
        self.pathanurl3 = reverse('newspost')

    def test_Allcourses(self):
        response = self.client.get(self.pathanurl)

        self.assertEquals(response.status_code, 302)

    def test_CourseCreate(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 302)

    def test_CourseReview(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 302)

    def test_CreateExam(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CreateTest(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CreateNewsPost(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_ProfileUpdate(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_Edit_NewPortal(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_newcourses(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_edittest(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_reportCourse(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CourseComment(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CreateNEWSTAG(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_HideCourse(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_ReplyMessage(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_DeleteNews(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_ReportFakeNews(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_addComent(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)
    def test_HideCourse2(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)
    def test_HideQuestion(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CreateQuestion(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_CommentQuestion(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)

    def test_DeleteQuestion(self):
        response = self.client.get(self.pathanurl3)

        self.assertEquals(response.status_code, 302)