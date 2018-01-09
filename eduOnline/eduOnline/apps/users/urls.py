# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2018/1/9 13:22'

from django.conf.urls import url
from .views import UserInfoView, UploadImageView, UpdatePwdView

urlpatterns = [
    # 用户信息
    url(r'^info/$', UserInfoView.as_view(), name="user_info"),

    # 用户头像上传
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"),

    # 用户个人中心修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name="update_pwd")

]