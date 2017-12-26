# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/15 16:03'

import xadmin
from xadmin import views

from .models import EmailVerifyRecord,Banner,UserProfile
from courses.models import Course,Lesson,Video,CourseResource
from organization.models import CityDict,CourseOrg,Teacher
from operation.models import UserAsk,CourseComments,UserFavorite,UserMessage,UserCourse
from django.contrib.auth.models import Permission,Group


# XAdmin 全局配置
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "暮学后台管理系统"
    site_footer = '暮学在线教育'
    # 将左边的APP导航，全部收起来
    menu_style = 'accordion'

    def get_site_menu(self):
        return (
            {'title': '用户关系', 'menus': (
                {'title': '用户信息', 'url': self.get_model_url(UserProfile, 'changelist')},
                {'title': '组', 'url': self.get_model_url(Group, 'changelist')},
                {'title': '权限', 'url': self.get_model_url(Permission, 'changelist')},
            )},
            {'title': '课程管理', 'menus': (
                {'title': '课程', 'url': self.get_model_url(Course, 'changelist')},
                {'title': '章节', 'url': self.get_model_url(Lesson, 'changelist')},
                {'title': '视频', 'url': self.get_model_url(Video, 'changelist')},
                {'title': '课件', 'url': self.get_model_url(CourseResource, 'changelist')},
            )},
            {'title': '机构管理', 'menus': (
                {'title': '城市', 'url': self.get_model_url(CityDict, 'changelist')},
                {'title': '机构', 'url': self.get_model_url(CourseOrg, 'changelist')},
                {'title': '教师', 'url': self.get_model_url(Teacher, 'changelist')},
            )},
            {'title': '用户操作', 'menus': (
                {'title': '用户咨询', 'url': self.get_model_url(UserAsk, 'changelist')},
                {'title': '用户课程', 'url': self.get_model_url(CourseComments, 'changelist')},
                {'title': '用户消息', 'url': self.get_model_url(UserFavorite, 'changelist')},
                {'title': '课程评论', 'url': self.get_model_url(UserMessage, 'changelist')},
                {'title': '用户收藏', 'url': self.get_model_url(UserCourse, 'changelist')},

            )},
        )

class EmailVerifyRecordAdmin(object):
    list_display = ['email','code','send_type','send_time']
    search_fields = ['email','code']
    list_filter = ['email','code','send_type','send_time']

class BannerAdmin(object):
    list_display = ['title','image','url','index','add_time']
    search_fields = ['title','image','url','index']
    list_filter = ['title','image','url','index','add_time']

xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(Banner,BannerAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSettings)