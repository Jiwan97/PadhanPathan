from django.test import TestCase, Client
from django.urls import reverse, resolve
from accounts.models import *
import json


class TestViews(TestCase):
    def setUp(self):
        self.client = Client()
        self.pathanurl = reverse('signup')
        self.pathanurl1 = reverse('login')


    def test_Signup(self):
        response = self.client.get(self.pathanurl)

        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/register.html')

    def test_Login(self):
        response = self.client.get(self.pathanurl1)

        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'accounts/login.html')

    def test_Profile(self):
        user = User.objects.create(username="Jason", email='Jiwan@email.com')
        user.set_password("password")
        user.save()
        # print()
        # # print(userCreate.password)
        # Profile.objects.create(user=user, username='Jiwan123', email='jiwan11@gmail.com')


