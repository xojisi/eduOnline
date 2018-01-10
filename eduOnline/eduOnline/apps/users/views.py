# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
import json
from datetime import datetime,timedelta
from django.http import HttpResponse

from .models import UserProfile,EmailVerifyRecord
from .form import LoginForm,RegisterForm,ForgetForm,ModifyPwdForm, UploadImageForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin

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
                    return render(request, "login.html", {"msg": "用户未激活","user_name":user_name})
            else:
                return render(request, "login.html",{"msg":"账户或密码错误","user_name":user_name})
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
            send_register_email(user_name,"register")
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
                send_register_email(email, "forget")
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

# 修改用户密码
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


# 用户个人信息
class UserInfoView(LoginRequiredMixin, View):
    def get(self, request):
        return render(request, "usercenter-info.html", {
        })

# 用户修改头像
class UploadImageView(LoginRequiredMixin, View):
    def post(self,request):
        image_form = UploadImageForm(request.POST, request.FILES,instance=request.user)
        if image_form.is_valid():
            image = image_form.cleaned_data['image']
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse('{"status":"fail"}', content_type="application/json")

# 在个人用心修改用户密码
class UpdatePwdView(LoginRequiredMixin, View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)

        if modify_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2","")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}', content_type="application/json")
            user = request.user
            user.password = make_password(pwd1)
            user.save()

            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type="application/json")

# 发送邮箱验证码
class SendEmailCodeView(LoginRequiredMixin,View):
    def get(self,request):
        email = request.GET.get("email","")

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type="application/json")
        send_register_email(email,"update_email")
        return HttpResponse('{"status":"success"}', content_type="application/json")

# 修改个人邮箱
class UpdateEmailView(LoginRequiredMixin, View):
    def post(self,request):
        email = request.POST.get("email","")
        code = request.POST.get('code',"")

        existed_records = EmailVerifyRecord.objects.filter(email=email,code=code,send_type='update_email')
        if existed_records:
            if existed_records[0].send_time + timedelta(hours=2) > datetime.now():
                user = request.user
                user.email = email
                user.username = email
                user.save()
                return HttpResponse('{"status":"success"}', content_type="application/json")
            else:
                return HttpResponse('{"email":"验证码过期"}', content_type="application/json")
        else:
            return HttpResponse('{"email":"验证码出错"}', content_type="application/json")
