# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View

from .models import UserProfile
from .form import LoginForm

# Create your views here.

# 重写authenticate(),增加功能：用邮箱也可以登录，后续可以在此增加手机登录。
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class LoginView(View):
    def get(self,request):
        return render(request, "login.html", {})
    def post(self,request):
        login_form = LoginForm(request.POST)
        # form验证
        if login_form.is_valid():
            user_name = request.POST.get("username","")
            pass_word = request.POST.get("password","")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                login(request, user)
                return render(request,"index.html")
            else:
                return render(request, "login.html",{"msg":"账户或密码错误"})
        else:
            return render(request, "login.html",{"login_form":login_form})

# 基于函数的登录
# def user_login(request):
#     if request.method == "POST":
#         user_name = request.POST.get("username","")
#         pass_word = request.POST.get("password","")
#         user = authenticate(username=user_name, password=pass_word)
#         if user is not None:
#             login(request, user)
#             print("index")
#             return render(request,"index.html")
#         else:
#             print("login")
#             return render(request, "login.html",{"msg":u"用户名或密码错误"})
#     elif request.method == "GET":
#         print("GET")
#         return render(request,"login.html",{})