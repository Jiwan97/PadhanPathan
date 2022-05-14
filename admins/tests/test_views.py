from django.test import TestCase, Client
from django.urls import reverse, resolve
from admins.models import *
import json


class TestViews(TestCase):
    def setUp(self):
        self.client = Client()
        self.pathanurl = reverse('allcourses')
        self.pathanurl1 = reverse('createcourse')
        self.pathanurl2 = reverse('createcourse')
    def test_Allcourses(self):
        response = self.client.get(self.pathanurl)

        self.assertEquals(response.status_code, 302)

    def test_CourseCreate(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 302)

    def test_CourseReview(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 302)