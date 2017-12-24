# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/17 19:23'

import xadmin

from .models import CourseOrg,CityDict,Teacher

class CourseOrgAdmin(object):
    list_display = ['name','click_num','fav_num','city']
    search_fields = ['name','desc','click_nums','fav_nums']
    list_filter = ['name','click_num','fav_num','city__name']

class CityDictAdmin(object):
    list_display = ['name', 'desc']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc']

class TeacherAdmin(object):
    list_display = ['org', 'name', 'work_years','work_company']
    search_fields = ['org','name', 'work_years','work_company']
    list_filter = ['org__name', 'name', 'work_years','work_company']


xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(Teacher,TeacherAdmin)

