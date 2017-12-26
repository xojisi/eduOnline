# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/26 13:04'

from django.conf.urls import url

from .views import OrgView,AddUserAskView

urlpatterns = [
    # 课程机构列表页
    url(r'^list/$', OrgView.as_view(), name="org_list"),
    url(r'add_ask/$', AddUserAskView.as_view(), name='add_ask')
]