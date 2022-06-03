from django.test import SimpleTestCase
from django.urls import reverse, resolve
from admins.views import allCourses


class TestUrls(SimpleTestCase):
    def test_url(self):
        url = reverse('allcourses')

        self.assertEqual(resolve(url).func, allCourses)
