# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
import json
from datetime import datetime,timedelta

from .models import UserProfile,EmailVerifyRecord
from .form import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm
from untils.email_send import send_register_eamil

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

# 登录
class LoginView(View):
    def get(self,request):
        return render(request, "login.html", {})
    def post(self,request):
        print request.POST
        login_form = LoginForm(request.POST)
        # form验证
        if login_form.is_valid():
            user_name = request.POST.get("username","")
            pass_word = request.POST.get("password","")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return render(request,"index.html")
                else:
                    return render(request, "login.html", {"msg": "用户未激活"})
            else:
                return render(request, "login.html",{"msg":"账户或密码错误"})
        else:
            return render(request, "login.html",{"login_form":login_form})


# 邮箱注册
class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request,"register.html",{'register_form':register_form})

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            try:
                Input_email = register_form.cleaned_data['email']
            except Exception as e :
                Input_email = ''
            try:
                Input_password = register_form.cleaned_data['password']
            except Exception as e :
                Input_password = ''

            user_name = request.POST.get("email","")
            if UserProfile.objects.filter(email=user_name):
                msg = "用户已经存在"
                return render(request, "register.html", locals())
            pass_word = request.POST.get("password","")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()

            # 放送邮件
            send_register_eamil(user_name,"register")
            return render(request, "login.html")
        else:
            errors_list = {}
            transform = json.loads(register_form.errors.as_json())
            for key,value in transform.items():
                errors_list[key] = value[0]['message']

            try:
                Input_email = register_form.cleaned_data['email']
            except Exception as e :
                Input_email = ''
            try:
                Input_password = register_form.cleaned_data['password']
            except Exception as e :
                Input_password = ''

            return render(request, "register.html", locals())

# 帐号激活
class ActiveUserView(View):
    def get(self, request ,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request,"active_fail.html")
        return render(request, "login.html")

# 忘记密码
class ForgetPWdView(View):
    def get(self,request):
        forget_form = ForgetForm()
        return render(request,"forgetpwd.html" ,{"forget_form":forget_form})

    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email","")
            if EmailVerifyRecord.objects.filter(email=email):
                send_register_eamil(email, "forget")
                return render(request, "send_success.html")
            else:
                return render(request, "forgetpwd.html", {"forget_form": forget_form,"msg":"用户不存在"})
        else:
            return render(request, "forgetpwd.html", {"forget_form": forget_form})


class ResetView(View):
    def get(self, request ,active_code):
        try:
            record = EmailVerifyRecord.objects.get(code=active_code)
            if record:
                email = record.email
                # 邮箱验证码有限时间判断
                if record.send_time + timedelta(hours=2) > datetime.now():
                    return render(request, "password_reset.html",{"email": email,"code":active_code})
                else:
                    return render(request, "active_fail.html")
            else:
                return render(request,"active_fail.html")
        except:
            return render(request, "active_fail.html")


class ModifyPwdView(View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        email = request.POST.get("email", "")
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2","")

            if pwd1 != pwd2:
                return render(request, "password_reset.html", {"email": email,"msg":"密码不一致"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            # 修改密码后链接时失效
            code = request.POST.get("code", "")
            EmailVerifyRecord.objects.filter(code=code).delete()


            return render(request,"login.html")
        else:
            return render(request, "password_reset.html", {"email": email,"modify_form":modify_form})