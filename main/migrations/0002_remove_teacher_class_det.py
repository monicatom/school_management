# Generated by Django 3.2.16 on 2023-03-03 11:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='teacher',
            name='class_det',
        ),
    ]
