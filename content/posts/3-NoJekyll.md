+++ 
draft = false
date = 2022-02-26T20:05:05+08:00
title = "如何解决 Github Page 仓库更新后页面无变化的问题？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = ["solution"]
categories = []
externalLink = ""
series = []
+++

我们可以在仓库页面上看见最近一次地 `push` 左边有个红叉，右侧边栏 `Environments` 中显示 `github-pages (Failure)`。

这是因为 `Github Page` 不会直接展示上传的裸的静态文件，而会默认使用 Jekyll 渲染一次，这样在 `Build` 环节就会出现问题，后续的 `Deploy` 环节也就会出问题，于是无论怎么往仓库 Push 都不能改变页面。

需要在仓库中新建一个 `.nojekyll` 的空文件来指明不需要 Github 自作主张地用 Jekyll 渲染。

相关链接：[Static site generators](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#static-site-generators)