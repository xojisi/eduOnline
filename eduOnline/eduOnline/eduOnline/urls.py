# -*- coding:utf-8 -*-
"""eduOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url,include
from django.views.static import serve
# from django.contrib import admin
import xadmin

from users.views import LoginView, LogoutView, RegisterView, ActiveUserView
from users.views import ForgetPWdView, ResetView, ModifyPwdView, IndexView
from .settings import MEDIA_ROOT  

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    # url(r'^admin/', admin.site.urls),
    url('^$', IndexView.as_view(), name="index"),
    url('^login/$', LoginView.as_view() , name="login"),
    url('^logout/$', LogoutView.as_view(), name="logout"),
    url('^register/$', RegisterView.as_view() , name="register"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(),name="user_active"),
    url(r'^forget/$', ForgetPWdView.as_view(), name="forget_pwd"),
    url(r'^reset/(?P<active_code>.*)/$', ResetView.as_view(), name="reset_pwd"),
    url(r'^modify/$', ModifyPwdView.as_view(), name="modify_pwd"),

    # 课程机构URL配置
    url(r'^org/', include('organization.urls', namespace="org")),

    # 课程相关URL配置
    url(r'^course/', include('courses.urls', namespace="course")),

    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)$', serve, {"document_root":MEDIA_ROOT}),

    #  Debug为False 时，找不到static的处理
    # url(r'^static/(?P<path>.*)$', serve, {"document_root":STATIC_ROOT}),

    # 课程相关URL配置
    url(r'^users/', include('users.urls', namespace="users")),

    # 富文本相关URL
    url(r'^ueditor/',include('DjangoUeditor.urls' )),


]
# 全局404页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
