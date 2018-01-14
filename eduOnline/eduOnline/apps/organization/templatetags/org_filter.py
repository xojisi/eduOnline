# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2018/1/14 19:53'

from django import template
register = template.Library()

# 根据老师的ID,提取关于这个老师的最新课程
def get_teacher_new_class(key):
    from courses.models import Course
    new_class = Course.objects.filter(teacher=key).order_by('-add_time')[:1]
    if new_class.exists():
        return new_class[0].name
    else:
        return u'暂无课程'

def get_teacher_new_class_add_time(key):
    from courses.models import Course
    new_class = Course.objects.filter(teacher=key).order_by('-add_time')[:1]
    if new_class.exists():
        return new_class[0].add_time
    else:
        return u"ヽ(･ω･｡)ﾉ找不到呢...."

def get_teacher_new_class_desc(key):
    from courses.models import Course
    new_class = Course.objects.filter(teacher=key).order_by('-add_time')[:1]
    if new_class.exists():
        return new_class[0].desc
    else:
        return u"ヽ(*´Д｀*)ﾉ还是找不到呢...."


register.filter('get_teacher_new_class', get_teacher_new_class)
register.filter('get_teacher_new_class_add_time', get_teacher_new_class_add_time)
register.filter('get_teacher_new_class_desc', get_teacher_new_class_desc)