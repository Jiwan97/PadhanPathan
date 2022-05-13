from django.test import SimpleTestCase
from django.urls import reverse, resolve
from accounts.views import register


class TestUrls(SimpleTestCase):
    def test_url(self):
        url = reverse('signup')

        self.assertEqual(resolve(url).func, register)

