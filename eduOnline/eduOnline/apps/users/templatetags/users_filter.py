# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2018/1/14 21:52'

from django import template
register = template.Library()

def excess_use_point(key):
        if len(key) >= 10:
            return key[:11]+' ...'
        else:
            return


register.filter('excess_use_point',excess_use_point)