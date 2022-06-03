from django.test import SimpleTestCase
from django.urls import reverse, resolve
from admins.views import allCourses, allNews


class TestUrls(SimpleTestCase):
    def test_url(self):
        url = reverse('allcourses')

        self.assertEqual(resolve(url).func, allCourses)


class TestUrls1(SimpleTestCase):
    def test_url1(self):
        url = reverse('allnews')
        self.assertEqual(resolve(url).func, allNews)
