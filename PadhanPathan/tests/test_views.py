from django.test import TestCase, Client
from django.urls import reverse, resolve
from accounts.models import *
import json



class TestViews(TestCase):
    def setUp(self):
        self.client = Client()
        self.pathanurl = reverse('home')
        self.pathanurl1 = reverse('courses')
        self.pathanurl2 = reverse('courseLike')

    def test_home(self):
        response = self.client.get(self.pathanurl)

        self.assertEquals(response.status_code, 200)

    def test_courses(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 302)

    def test_courseLike(self):
        response = self.client.get(self.pathanurl2)

        self.assertEquals(response.status_code, 302)
