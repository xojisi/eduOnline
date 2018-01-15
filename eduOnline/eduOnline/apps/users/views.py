# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import authenticate,login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
import json
from datetime import datetime,timedelta
from django.http import HttpResponse, HttpResponseRedirect
from pure_pagination import Paginator, PageNotAnInteger
from django.core.urlresolvers import reverse

from .models import UserProfile,EmailVerifyRecord
from .form import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm
from .form import UploadImageForm, UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from courses.models import Course
from .models import Banner

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
                    return HttpResponseRedirect(reverse("index"))
                else:
                    return render(request, "login.html", {"msg": "用户未激活","user_name":user_name})
            else:
                return render(request, "login.html",{"msg":"账户或密码错误","user_name":user_name})
        else:
            return render(request, "login.html",{"login_form":login_form})


# 用户登出
class LogoutView(View):
    def get(self,request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))



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

            # 写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message= '欢迎注册暮学在线网'
            user_message.save()


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
        return render(request, "usercenter-info.html", {})

    def post(self,request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type="application/json")


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


# 我的课程
class MyCourseView(LoginRequiredMixin, View):
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request, 'usercenter-mycourse.html',{
            "user_courses": user_courses,
        })


# 我收藏的课程机构
class MyFavOrgView(LoginRequiredMixin, View):
    def get(self,request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)

        return render(request, 'usercenter-fav-org.html',{
            "org_list": org_list,
        })


# 我收藏的授课讲师
class MyFavTeacherView(LoginRequiredMixin, View):
    def get(self,request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)

        return render(request, 'usercenter-fav-teacher.html',{
            "teacher_list": teacher_list,
        })


# 我收藏的磕碜
class MyFavCourseView(LoginRequiredMixin, View):
    def get(self,request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            teacher = Course.objects.get(id=course_id)
            course_list.append(teacher)

        return render(request, 'usercenter-fav-course.html',{
            "course_list": course_list,
        })

# 我的消息
class MyMessageView(LoginRequiredMixin,View):
    def get(self,request):
        all_messages = UserMessage.objects.filter(user=request.user.id)
        # 打开后,设置为全部已读
        all_messages.update(has_read=True)
        # 对个人消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, 5, request=request)
        messages = p.page(page)

        return render(request, 'usercenter-message.html',{
            "messages": messages,
        })


# 首页
class IndexView(View):
    def get(self,request):
        # 取出轮播图
        all_banners = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=True).order_by('-add_time')[:3]
        course_orgs = CourseOrg.objects.all()[:15]
        return render(request, 'index.html', {
            "all_banners": all_banners,
            "courses": courses,
            "banner_courses": banner_courses,
            "course_orgs": course_orgs
        })


# 全局404处理函数
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


# 全局500处理函数
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response