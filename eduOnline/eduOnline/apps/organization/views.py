# -*- coding:utf-8 -*-
from django.shortcuts import render
from django.views.generic import View

from .models import CourseOrg,CityDict
# Create your views here.

# 课程机构列表功能
class OrgView(View):
    def get(self,request):
        # 课程机构
        all_orgs = CourseOrg.objects.all()
        org_nums = all_orgs.count()
        # 城市
        all_citys = CityDict.objects.all()

        return render(request,"org-list.html",locals())