# Generated by Django 3.2 on 2022-05-29 14:35

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admins', '0002_delete_response'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('PadhanPathan', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Comment',
            new_name='NewsComment',
        ),
        migrations.RemoveField(
            model_name='attempted',
            name='exammodel',
        ),
        migrations.RemoveField(
            model_name='attempted',
            name='user',
        ),
        migrations.DeleteModel(
            name='ContactMessage',
        ),
        migrations.RemoveField(
            model_name='examanswer',
            name='examquestion',
        ),
        migrations.RemoveField(
            model_name='examanswer',
            name='user',
        ),
        migrations.DeleteModel(
            name='Attempted',
        ),
        migrations.DeleteModel(
            name='ExamAnswer',
        ),
    ]