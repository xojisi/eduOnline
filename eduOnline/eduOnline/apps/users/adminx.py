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
            {'title': '用户关系',
             'icon': 'fa fa-user-circle-o',
             'menus': (
                {'title': '用户信息',
                 'url': self.get_model_url(UserProfile, 'changelist'),
                 'perm': self.get_model_perm(UserProfile, 'change')
                 },

                {'title': '组',
                 'url': self.get_model_url(Group, 'changelist'),
                 'perm': self.get_model_perm(Group, 'change'),
                 'icon':'fa fa-group'
                 },

                {'title': '权限',
                 'url': self.get_model_url(Permission, 'changelist'),
                 'perm': self.get_model_perm(Permission, 'change')
                 },
            )},

            {'title': '课程管理',
             'menus': (
                {'title': '课程',
                 'url': self.get_model_url(Course, 'changelist'),
                 'perm': self.get_model_perm(Course, 'change')
                 },

                {'title': '章节',
                 'url': self.get_model_url(Lesson, 'changelist'),
                 'perm': self.get_model_perm(Lesson, 'change')
                 },

                {'title': '视频', 'url': self.get_model_url(Video, 'changelist'),
                 'perm': self.get_model_perm(Video, 'change')
                 },

                {'title': '课件', 'url': self.get_model_url(CourseResource, 'changelist'),
                 'perm': self.get_model_perm(CourseResource, 'change')
                 },
            )},

            {'title': '机构管理',
             'menus': (
                {'title': '城市',
                 'url': self.get_model_url(CityDict, 'changelist'),
                 'perm': self.get_model_perm(CityDict, 'change')
                 },

                {'title': '机构',
                 'url': self.get_model_url(CourseOrg, 'changelist'),
                 'perm': self.get_model_perm(CourseOrg, 'change')
                 },

                {'title': '教师',
                 'url': self.get_model_url(Teacher, 'changelist'),
                 'perm': self.get_model_perm(Teacher, 'change')
                 },
            )},

            {'title': '用户操作',
             'menus': (
                {'title': '用户咨询',
                 'url': self.get_model_url(UserAsk, 'changelist'),
                 'perm': self.get_model_perm(UserAsk, 'change')
                 },

                {'title': '用户课程',
                 'url': self.get_model_url(UserCourse, 'changelist'),
                 'perm': self.get_model_perm(UserCourse, 'change')
                 },

                {'title': '用户消息',
                 'url': self.get_model_url(UserMessage, 'changelist'),
                 'perm': self.get_model_perm(UserMessage, 'change')
                 },

                {'title': '课程评论',
                 'url': self.get_model_url(CourseComments, 'changelist'),
                 'perm': self.get_model_perm(CourseComments, 'change')
                 },

                {'title': '用户收藏',
                 'url': self.get_model_url(UserFavorite, 'changelist'),
                 'perm': self.get_model_perm(UserFavorite, 'change')
                 },
            )},
        )


class EmailVerifyRecordAdmin(object):
    list_display = ['email','code','send_type','send_time']
    search_fields = ['email','code']
    list_filter = ['email','code','send_type','send_time']
    model_icon = 'fa fa-tags'

class BannerAdmin(object):
    list_display = ['title','image','url','index','add_time']
    search_fields = ['title','image','url','index']
    list_filter = ['title','image','url','index','add_time']



xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(Banner,BannerAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSettings)