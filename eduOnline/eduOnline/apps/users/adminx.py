# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/15 16:03'

import xadmin

from .models import EmailVerifyRecord,Banner

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
