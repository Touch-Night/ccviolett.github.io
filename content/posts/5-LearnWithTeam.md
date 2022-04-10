+++ 
draft = false
date = 2022-02-27T22:38:37+08:00
title = "创新实验班 Web 开发教学计划"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

{{<toc>}}

## 一、Git入门

视频教程：[Git + GitHub 10分钟完全入门](https://www.bilibili.com/video/BV1KD4y1S7FL)

1. 配置基本用户信息

```bash
git config --global user.name <你的用户名>
git config --global user.email <你的邮箱地址>
```

2. 初始化本地仓库 `git init`
3. 关联远程仓库 `git remote add <自定义仓库名> <远程仓库地址>`
4. 从远程服务器克隆一个仓库 `git clone <远程仓库的url>`
5. 显示当前工作目录下的提交状态 `git status`
6. 将指定文件Stage（标记为将要被提交的文件） `git add <文件路径>`
7. 将指定文件Unstage（取消标记） `git reset <文件路径>`
8. 创建一个提交并附上提交信息 `git commit -m "提交信息"`
9. 显示提交历史 `git log`
10. 向远程仓库推送（Push） `git push`
11. 从远程仓库拉取（Pull） `git pull`
12. 分支（branch）
    - master是主分支（默认），分支在不合并的情况下是相互独立的
    - `git branch` 查看所有分支
    - `git branch <分支名字>` 新建分支
    - `git checkout <分支名字>` 切换分支
    - `git branch -m <旧名字> <新名字>` 修改分支名
    - `git branch -d <分支名字>` 删除分支
13. 签出（check out） `git checkout <提交的hash>`

如果一开始不太熟悉命令行操作，建议使用 [GitKraken](https://www.gitkraken.com/)，第一次启动会提示登录，然后填写签名信息（随便填，不一定要真实），就可以点左上角的`文件夹->Init`创建代码仓库（Repository）了。

## 二、HCJ（HTML + CSS + Javascript) 快速入门

推荐一个Web IDE ：[Hbuilder](https://www.dcloud.io/hbuilderx.html)

用vscode或WebStorm也行，看个人喜好。

### （一）HTML

- `<!DOCTYPE html>` html5标准网页声明，是命令，不是标签
- `<html>` 根标签
- `<head>` 头标签，描述了文档的各种属性和信息
- `<body>` 定义网页正文，构成显示的主要内容
- `<h1> <h2> <h3> <h4> <h5> <h6>` 标题标签，跟word里面的标题差不多，由1到6字体依次减小
- `<p>` 段落标签，表示一个段落，段与段间有空行，可通过align属性设置对齐方式
- `<br>` 换行标签
- `<hr/>` 画一条水平线，有width、size、color等属性
- `<div>` 块标签，表面上没什么用，其实大大方便了布局
- `<font>` 字体标签，定义标签内的字体，有size、color、face等属性。
- `<img />` 图片标签，有src(图片地址)、width、height、align等属性
- `<a>` 链接标签，有href(后跟跳转地址，若是其他网址需带协议)、target(\_blank表示新窗口打开，\_self表示原窗口打开，默认为新窗口打开)等属性
- `<table> <tr> <th> <td>` table是表格的根标签，tr定义行，th定义列名，td定义列内容
- `<form> <input>` 表单标签，form主要需要设置action、method、enctype属性

> \<form> 的属性
>
> action属性定义了表单上传的地址
>
> method属性定义了上传方法，有get和post两种，get效率高但不安全、请求大小有限，post安全、请求大小无限但效率低。
>
> enctype属性定义了表单的提交类型，默认值是application/x-www-form-urlencoded（普通表单），当需要上传文件时会用multipart/form-data（多部分表单）。（目前了解即可）

> \<input> 的属性
>
> 主要是type属性，定义了~~emmmm控件的类型？~~，看演示吧

### （二）CSS

CSS全称Cascading Style Sheets层叠样式表。

可以对HTML标签进行修饰，美化html页面

外部CSS文件可以提高代码复用性，让html内容与样式分离，便于后期维护。

下面简单介绍一下

用法一：内嵌进html标签

```html
<div style="color:blue;font-size:50px">H e l l o</div>
```

用法二：在head中加样式表

```html
<head>
	balabala...
	<style type="text/css">
		div{color:red;font-size:50px}
	</style>
	balabala...
</head>
```

用法三：CSS另存一个文件，head中引用

```html
<link rel="stylesheet" type="text/css" href="div.css" />
```

用法四：@import

```html
<style type="text/css">
	@import url("div.css");
</style>
```

### （三）JavaScript

一种脚本语言，功能强大。

浏览器内置JavaScript引擎

简单例子：

```html
<body>
	balabala...
	<script type="text/javascript">
		var a = 1, b = 5;
		document.write(a*b);
		alert("你好");
	</script>
	balabala...
</body>
```

前端需要精通，需要很大精力投入。

## 三、安装mysql和php

```shell
apt install mysql-server mysql-client    #安装mysql(MariaDB)
mysql   #默认无密码，直接进入mysql命令行
UPDATE mysql.user SET authentication_string = PASSWORD('你的密码'), plugin = 'mysql_native_password' WHERE User = 'root' AND Host = 'localhost';
FLUSH PRIVILEGES;
exit    #退出mysql
service mysql restart   #重启mysql

# 因为Debian的阿里仓库里只有php7.0，下面添加sury软件源
# 四个命令
apt -y install software-properties-common apt-transport-https lsb-release ca-certificates
wget -O /etc/apt/trusted.gpg.d/php.gpg https://mirror.xtom.com.hk/sury/php/apt.gpg
sh -c 'echo "deb https://mirror.xtom.com.hk/sury/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'   
apt-get update #更新软件源缓存
# 下面安装php7.3
apt install php7.3-fpm php7.3-mysql php7.3-curl php7.3-gd php7.3-mbstring php7.3-xml php7.3-xmlrpc php7.3-zip php7.3-opcache -y
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.3/fpm/php.ini  #出于安全考虑
```

配置nginx：

注释掉默认的服务器配置，添加自定义内容：

```nginx
server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        # 这里是本机IP，也可以写你绑定的域名
        server_name  localhost;

        # 定义网站根目录
        root         /var/www;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location / {
            # 定义首页索引文件的名称
            index index.php index.html index.htm;
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }

        # PHP 脚本请求全部转发到 FastCGI处理. 使用FastCGI协议默认配置.
        # Fastcgi服务器和程序(PHP,Python)沟通的协议.
        location ~ \.php$ {
            # 设置监听端口
            fastcgi_pass   127.0.0.1:9000;
            # 设置脚本文件请求的路径
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            # 引入fastcgi的配置文件
            include        fastcgi_params;
        }
    }
```

上面设置好了fastcgi去监听9000端口的php内容，下面修改php的配置文件：

> 编辑/etc/php/7.3/fpm/pool.d目录下的www.conf文件
>
> 将listen = balabala 换成 listen = 127.0.0.1:9000

然后重新加载nginx配置文件：`nginx -s reload`

重新启动php-fpm：`service php7.3-fpm restart`

下面测试一下：

在nginx设置好的根目录/var/www下，新建一个php文件，内容是：`<?php phpinfo(); ?>`

到浏览器访问一下

这样LNMP环境就搭建好了

## 四、岗位了解

课程链接：[5分钟带你了解互联网岗位职责和关系](https://www.bilibili.com/video/BV1Ng4y167Ya?from=search&seid=5991464712572853506&spm_id_from=333.337.0.0)

## 五、前期知识

HTML:
- [黑马程序员pink老师前端入门教程](https://www.bilibili.com/video/av80149248)
- [HTML+CSS 前端入门视频教程](https://www.bilibili.com/video/BV1CK411G7m4)

Java：
- [零基础学Java语言](https://www.icourse163.org/course/ZJU-1001541001)
- [Java核心技术](https://www.icourse163.org/course/ECNU-1002842004)
- [Java核心技术(进阶)](https://www.icourse163.org/course/ECNU-1003718005)
- [Java核心技术(高阶)](https://www.icourse163.org/course/ECNU-1206500807)

## 六、分流

- [王道计算机考研 计算机网络](https://www.bilibili.com/video/BV19E411D78Q)
- 

### 1. 前端：
- [web前端零基础html5+css3+前端项目视频教程](https://www.bilibili.com/video/BV1Kg411T7t9)
- [黑马程序员 Javascript 全套教程](https://www.bilibili.com/video/BV1ux411d75J)
- [黑马程序员JavaScript核心教程，前端基础教程，JS必会的DOM BOM操作](https://www.bilibili.com/video/BV1k4411w7sV)

### 2. 后端：
- [JavaWeb从入门到项目实战](https://www.bilibili.com/video/BV1qv4y1o79t)
- [MySQL 数据库简介](http://www.imooc.com/wiki/mysqllesson/mysqlinfo.html)

### 3. Android:
- [Android（安卓）开发零基础入门课程](https://www.bilibili.com/video/BV13y4y1E7pF)
- [Android 入门教程](http://www.imooc.com/wiki/androidlesson)

### 4. 产品经理
- [2022最新版产品经理入门到精通](https://www.bilibili.com/video/BV1hZ4y1A7GG)
- [产品经理C端内容项目设计实战教程](https://www.bilibili.com/video/BV1i4411Y7H6)

### 5. UI
- [传智教育墨刀教程全套，高保真交互式原型设计教程](https://www.bilibili.com/video/BV1Q54y1b7DP)