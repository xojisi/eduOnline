在线教育平台

使用环境：python 3/ Django 1.11/ mysql 5.7

使用说明:

1. 安装依赖库requirements.txt

2. 新建一个数据库 eduonline

3. 在 settings.py 配置数据库连接

3. 同步数据库 

        python manage.py makemigrations
        python manage.py migrate

4. 导入sql —— eduonline.sql

5. 启动 python manage.py runserver
