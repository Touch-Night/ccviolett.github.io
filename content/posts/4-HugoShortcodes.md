+++ 
draft = false
date = 2022-02-26T21:46:10+08:00
title = "如何使用 Hugo Shortcodes 来复用代码或嵌入 HTML？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

官方学习链接：https://gohugo.io/templates/shortcode-templates/

### 一、新建 Shortcode

假设要新建的 Shortcode 名称为 `test`。

在博客文件夹下的 `layouts/shortcodes/` 文件夹（不存在则新建）中创建文件 `test.html`，在文件中写入 Shortcode 片段即可。

### 二、调用与传参

由于渲染的原因，无法在文章里完整演示，需要自行在以下标签之外添加两层大括号，

- 单标签调用：`<test>`。

- 变量名传参调用：`<test name1="arg1" name2="arg2">`；引用参数：` .Get "name1"` 得到 `arg1`，` .Get "name2"` 得到 `arg2`。

- 顺序传参调用：`<test arg1 arg2>`；引用参数：` .Get 0 ` 得到 `arg1`，` .Get 1 ` 得到 `arg2`。

- 双标签内部文本调用：`<test> xxxxx </test>`；引用参数：`.Inner` 得到纯文本 `xxxxx`。

- 双标签内部渲染调用：`%test% xxxxx %/test%`；引用参数：`.Inner` 得到经过 Markdown 渲染后的 `xxxxx`。
