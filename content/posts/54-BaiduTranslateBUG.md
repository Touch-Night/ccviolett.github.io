+++ 
draft = false
date = 2022-05-27T13:48:17+08:00
title = "我发现了百度翻译的一个 BUG！"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

我们来只是想正常地查一下这道题：

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205271348100.png)

结果发现出现了乱码：

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205271349581.png)

随后我又在其他的几个翻译软件中尝试了一下，发现都没有问题，又在手机上试了一下、请几个朋友试了一下，都出现了一样的乱码。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205271426692.png)

基本可以断定是百度翻译出了 BUG。

经过实验，以下的内容都能够触发 BUG：

```
Certain types of birds often develop the skill of ____ and sound like they can speak.
```

```
develop the skill of ____ and sound like
```

```
kill of ____ and sound like
```

我发现是 `____` 的问题，于是我又以此为基础构建了一些小一点的串，比如 `a ____ b`，就能够简单地看到这个 BUG 的效果。


我已经于北京时间 2022 年 5 月 27 日 14 时向百度翻译发送邮件反馈，不知道什么时候会修复。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205271425539.png)
