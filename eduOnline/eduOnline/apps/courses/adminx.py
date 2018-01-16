# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/17 18:41'

import xadmin

from .models import Course,Lesson,Video,CourseResource

class CourseAdmin(object):
    list_display = ['name','desc','degree','learn_times','students','teacher']
    search_fields = ['name','desc','degree','students']
    list_filter = ['name','desc','degree','learn_times','students','teacher__name']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums']
    exclude = ['fav_nums']
    relfield_style = 'fk-ajax'  # 本身无意义,但LessonAdmin加了,这里不加,LessonAdmin的这句话就不起作用.



class LessonAdmin(object):
    list_display = ['course','name']
    search_fields = ['course__name','name']
    list_filter = ['course__name','name']
    relfield_style = 'fk-ajax' # 关联的外键(course), 如CourseAdmin不加这段, 这里加了无效.

class VideoAdmin(object):
    list_display = ['lesson','name']
    search_fields = ['lesson__name','name']
    list_filter = ['lesson__name','name']
    relfield_style = 'fk-ajax'

class CourseResourceAdmin(object):
    list_display = ['course','name']
    search_fields = ['course__name','name']
    list_filter = ['course__name','name']
    relfield_style = 'fk-ajax'



xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)


