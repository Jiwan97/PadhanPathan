# Generated by Django 3.2 on 2022-06-11 08:33

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('PadhanPathan', '0003_contactmessage_reportquestion'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='ReportQuestion',
            new_name='ReportCourses',
        ),
    ]
