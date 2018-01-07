# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from pure_pagination import Paginator, PageNotAnInteger
import random

from .models import Course, CourseResource
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin
# Create your views here.

class CourseListView(View):
    def get(self,request):
        all_courses = Course.objects.all().order_by("-add_time")
        hot_courses = Course.objects.all().order_by("-click_nums")[:3]

        # 课程排序
        sort = request.GET.get("sort", '')
        if sort:
            if sort == "students":
                all_courses = all_courses.order_by("-students")
            elif sort == "hot":
                all_courses = all_courses.order_by("-click_nums")

        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_courses, 9, request=request)
        courses = p.page(page)


        return render(request,'course-list.html',{
            "all_courses": courses,
            "sort": sort,
            "hot_courses": hot_courses
        })



# 课程详情页
class CourseDetailView(View):
    def get(self,request, course_id):
        course = Course.objects.get(id=int(course_id))

        #增加课程点击数
        course.click_nums += 1
        course.save()

        has_fav_course = False
        has_fav_org = False

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True


        # 相关课程推荐
        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:1]
        else:
            relate_courses = []

        return render(request, "course-detail.html", {
            "course": course,
            "relate_courses": relate_courses,
            "has_fav_course": has_fav_course,
            "has_fav_org": has_fav_org
        })

# 课程章节信息
class CourseInfoView(LoginRequiredMixin, View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))

        # 查询用户是否已经关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_courses = UserCourse(user=request.user,course=course)
            user_courses.save()

        all_resources = CourseResource.objects.filter(course=course)

        # 随机在所有课表内取
        sample = random.sample(xrange(Course.objects.count()), 3)
        if course_id in sample:
            sample.remove(course_id)
        relate_courses = [Course.objects.all()[i] for i in sample]

        return render(request, "course-video.html", {
            "course": course,
            "course_resources":all_resources,
            "relate_courses": relate_courses
        })


class CourseCommentsView(LoginRequiredMixin, View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))

        # 随机在所有课表内取
        sample = random.sample(xrange(Course.objects.count()), 3)
        if course_id in sample:
            sample.remove(course_id)
        relate_courses = [Course.objects.all()[i] for i in sample]

        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.filter(course_id=course_id)

        return render(request, "course-comment.html", {
            "course": course,
            "course_resources": all_resources,
            "all_comments": all_comments,
            "relate_courses": relate_courses
        })

# 增加课程评论
class AddCommentsView(View):
    def post(self,request):
        # 判断用户登录状态d
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type="application/json")

        course_id = request.POST.get('course_id','')
        comments = request.POST.get('comments','')
        if course_id > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}', content_type="application/json")
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}', content_type="application/json")