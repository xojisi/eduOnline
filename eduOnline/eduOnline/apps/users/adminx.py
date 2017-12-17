# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/15 16:03'

import xadmin
from xadmin import views

from .models import EmailVerifyRecord,Banner

# XAdmin 全局配置
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "暮学后台管理系统"
    site_footer = '暮学在线教育'
    # 将左边的APP导航，全部收起来
    menu_style = 'accordion'

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