# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-01-16 14:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0007_courseorg_tag'),
    ]

    operations = [
        migrations.RenameField(
            model_name='courseorg',
            old_name='click_nums',
            new_name='click_num',
        ),
    ]
