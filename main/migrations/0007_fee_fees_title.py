# Generated by Django 3.2.16 on 2023-03-04 09:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_expense'),
    ]

    operations = [
        migrations.AddField(
            model_name='fee',
            name='fees_title',
            field=models.CharField(default=1, max_length=225),
            preserve_default=False,
        ),
    ]
