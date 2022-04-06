+++ 
draft = true
date = 2022-03-17T09:36:33+08:00
title = "学习 Flutter 开发"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

## 一些坑

Could not determine the dependencies of task ':app:compileDebugJavaWithJavac'.

### Could not find xxxxx

原因：镜像站点无法访问

1. 修改项目 Android 目录下的 `build.gradle` 文件

```
buildscript {
    ext.kotlin_version = '1.3.50'
    repositories {
//        google() 无法访问，使用阿里镜像
//        jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
        maven { url 'http://download.flutter.io'}
    }
    ...
```

```
allprojects {
    repositories {
//        google()
//        jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}
```

2. 修改 flutter SDK 中的 `flutter.gradle` 文件

文件目录：`flutter\packages\flutter_tools\gradle\flutter.gradle`

```
buildscript {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
    ...
```

### Failed to find xxxx

原因：未安装相应的东西

打开 `Android SDK`，点击右下角 `Show Package Details`，缺啥补啥即可。