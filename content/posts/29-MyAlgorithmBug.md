+++ 
draft = false
date = 2022-03-24T22:07:50+08:00
title = "算法中有那种容易写错但是不易发现的 BUG？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

## 1. 默认 $t * 2$ 和 $t * 2 + 1$ 建二叉树

在链的情况下，空间会被卡到 $2^n$。

解决方法：使用 lson 和 rson 来存储

例题：通过先序遍历和中序遍历，输出层序遍历。