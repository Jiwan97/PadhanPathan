# Generated by Django 3.2 on 2022-06-26 08:39

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('PadhanPathan', '0008_examanswer'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReportNews',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_reported', models.DateTimeField(auto_now_add=True)),
                ('reported', models.BooleanField(default=False)),
                ('report_choice', models.PositiveSmallIntegerField(choices=[(1, 'Racist Question'), (2, 'Sexual Harassment'), (3, 'Harmful and Dangerous'), (4, 'Child Abuse'), (5, 'Spam or Misleading'), (6, 'Violent or Repulsive Content'), (7, 'Hateful or Abusive Content')], verbose_name='Reported As')),
                ('comment', models.CharField(default='Not Updated', max_length=50000, null=True)),
                ('News', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='PadhanPathan.news')),
                ('reported_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
