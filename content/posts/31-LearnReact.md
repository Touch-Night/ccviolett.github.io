+++ 
draft = false
date = 2022-03-25T19:48:19+08:00
title = "学习 React"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

### 一些问题

1. 无法使用 JSX，报错 `Unexpected token '<'`

https://react.docschina.org/docs/add-react-to-a-website.html#add-jsx-to-a-project

2. 将 HTML 代码复制到 JSX 中报错

记得删掉 `style` 属性，并将 HTML 代码中标签的 `class` 改为 `className`。

3. onClick 自动触发

将 `onClick = {func()}` 改为 `onClick = {() => {func()}}` 即可。