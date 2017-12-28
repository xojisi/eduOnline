# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/28 15:13'


from django.conf.urls import url

from .views import CourseListView



urlpatterns = [
    # 课程列表页
    url(r'^list/$', CourseListView.as_view(), name="course_list"),


]