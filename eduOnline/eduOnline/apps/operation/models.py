# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from datetime import datetime

from django.db import models

from users.models import UserProfile
from courses.models import Course

# Create your models here.

class UserAsk(models.Model):
    name = models.CharField(max_length=20,verbose_name=u"姓名")
    mobile = models.CharField(max_length=11,verbose_name=u"手机")
    course_name = models.CharField(max_length=50,verbose_name=u"课程名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"用户咨询"
        verbose_name_plural = verbose_name



class CourseComments(models.Model):
    user = models.ForeignKey(UserProfile,verbose_name=u"用户")
    course = models.ForeignKey(Course,verbose_name=u"课程")
    comments = models.CharField(max_length=200,verbose_name=u"评论")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程评论"
        verbose_name_plural = verbose_name



class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    # 根据类型与ID，筛选出所有的收藏信息
    fav_id = models.IntegerField(default=0,verbose_name=u"数据id")
    fav_type = models.IntegerField(choices=((1,u"课程"),(2,u"课程机构"),(3,u"讲师")),default=1,verbose_name=u"收藏类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"收藏时间")

    class Meta:
        verbose_name = u"用户收藏"
        verbose_name_plural = verbose_name



class UserMessage(models.Model):
    # 如果是0，则是发给全部人，如果不是0，则表示该用户的ID
    user = models.IntegerField(default=0,verbose_name=u"接受用户")
    message = models.CharField(max_length=500,verbose_name=u"消息内容")
    has_read = models.BooleanField(default=False,verbose_name=u"是否已读")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"发送时间")

    class Meta:
        verbose_name = u"用户消息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return u'用户消息'


class UserCourse(models.Model):
    user = models.ForeignKey(UserProfile,verbose_name=u"用户")
    course = models.ForeignKey(Course,verbose_name=u"课程")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"学习时间")

    class Meta:
        verbose_name = u"用户课程"
        verbose_name_plural = verbose_name

