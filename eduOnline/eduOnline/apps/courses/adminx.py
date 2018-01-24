# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/17 18:41'

import xadmin

from .models import Course, Lesson, Video, CourseResource, BannnerCourse
from organization.models import CourseOrg

class LessonInline(object):
    model = Lesson
    extra = 0

class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name','desc','degree','learn_times','students','teacher','get_zj_nums','go_to']
    search_fields = ['name','desc','degree','students']
    list_filter = ['name','desc','degree','learn_times','students','teacher__name']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums']   # 只读
    exclude = ['fav_nums']  # 隐藏
    list_editable = ['degree'] # 在列表页直接编辑
    relfield_style = 'fk-ajax'  # 本身无意义,但LessonAdmin加了,这里不加,LessonAdmin的这行就不起作用.
    inlines = [LessonInline, CourseResourceInline]  # 一个表链接另一个表
    # refresh_times = [5,10] # 刷新频率
    style_fields = {"detail": "ueditor"}   # 设置样式
    import_excel = True   # excel导入功能加载

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    # 保存课程的时候统计课程机构的课程书
    def save_models(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
                course_org = obj.course_org
                course_org.course_nums = Course.objects.filter(course_org=course_org).count()
                course_org.save()

    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            pass
        return super(CourseAdmin, self).post(request, args, kwargs)


class BannerCourseAdmin(object):
    list_display = ['name','desc','degree','learn_times','students','teacher']
    search_fields = ['name','desc','degree','students']
    list_filter = ['name','desc','degree','learn_times','students','teacher__name']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums']
    exclude = ['fav_nums']
    relfield_style = 'fk-ajax'  # 本身无意义,但LessonAdmin加了,这里不加,LessonAdmin的这句话就不起作用.
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


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
xadmin.site.register(BannnerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)


