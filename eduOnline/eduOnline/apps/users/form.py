# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/18 17:02'

from django import forms

class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)
