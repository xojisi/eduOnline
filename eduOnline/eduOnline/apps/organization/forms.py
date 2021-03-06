# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/26 11:47'

from django import forms
import re

from operation.models import UserAsk


class UserAskForm(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        # 验证手机号码是否合法
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号码非法", code="mobile_invalid")
