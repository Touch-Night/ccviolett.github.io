+++ 
draft = false
date = 2022-05-03T16:40:12+08:00
title = "学习如何写 Chrome 插件"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

为了完成[稀土掘金编程挑战赛](https://hackathon2022.juejin.cn/)

首先对插件有个简单的印象 [10分钟入门chrome(谷歌)浏览器插件开发](https://juejin.cn/post/6904797929056239630)，但是完全按照这个来并不能写出一个能运行的插件，因为其并没有配置 `browser_action`。

大概知道插件的概念后，结合 [手把手教你开发chrome扩展](https://www.cnblogs.com/walkingp/archive/2011/03/31/2001628.html) 完成自己的第一个插件。

我们发现上述插件都是在 MV2（Manifest V2) 下开发的，而目前 Google 正在全力推行 MV3，我们可以通过这篇文章[Chrome Manifest V3 - 披着羊皮的狼？](https://zhuanlan.zhihu.com/p/451197423)大概了解一切情况。

选择继续在 MV2 下开发。

通过 [一篇文章教你顺利入门和开发chrome扩展程序（插件）](https://juejin.cn/post/6844903740646899720) 大概理清整个插件的框架，顺便了解各个部分之间的通信。

随后可以通过 [Chrome插件(扩展)开发全攻略](https://www.bookstack.cn/read/chrome-plugin-develop/spilt.1.8bdb1aac68bbdc44.md) 系统了解  Chrome 的插件开发，更推荐的方法是开始写插件然后去查需要的东西。


有了这些基础你应该就能够成功的开发一个自己的插件了。

下面是一些可以遇到的问题：

- 关于如何调试三个部分（`content_scripts.js`、`background.js`、`popup.js`）：[chrome插件开发之调试](https://blog.csdn.net/zzstack/article/details/62226249)
- background 无法与 content_scripts 建立连接可能是页面没刷新或者浏览器没有重启，最大的可能还是 content_scripts 在建立连接前就报错了。
