# -*- coding:utf-8 -*-
__author__ = 'xojisi'
__date__ = '2017/12/20 16:20'
from random import Random
from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from django.conf import settings

def random_str(randomlength=8):
    Str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars)-1
    random = Random()
    for i in range(randomlength):
        Str+=chars[random.randint(0,length)]
    return Str


def send_register_eamil(email, send_type="register"):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ""
    eamil_body = ""

    if send_type == "register":
        email_title = "暮学在线网注册激活链接"
        email_body = "请点击下面的链接激活你的帐号: http://127.0.0.1:8000/active/{0}".format(code)

        send_status = send_mail(email_title,email_body,settings.EMAIL_FROM,[email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "暮学在线网密码重置链接"
        email_body = "请点击下面的链接重置密码: http://127.0.0.1:8000/reset/{0}".format(code)

        send_status = send_mail(email_title, email_body, settings.EMAIL_FROM, [email])
        if send_status:
            pass