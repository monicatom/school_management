# Generated by Django 3.2.16 on 2023-03-03 14:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_note_teacher'),
    ]

    operations = [
        migrations.AddField(
            model_name='note',
            name='file',
            field=models.ImageField(default=1, upload_to='static/media'),
            preserve_default=False,
        ),
    ]
