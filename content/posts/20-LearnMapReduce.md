+++ 
draft = false
date = 2022-03-16T12:01:51+08:00
title = "迅速掌握 MapReduce"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

为什么 MapReduce 的思想朴素，而意义重大？

MapReduce 为分布式计算解决了以下几个问题：
1. 如何解决单个计算机计算失败或系统异常，导致结果不准确？
2. 如何解决同步问题，不让单个计算机拖慢整个计算过程？
3. 如何解决分布式内存不共享的问题？

MapReduce 的设计，从一开始就是要让其可以运行在 Commodity Server 上面，允许程序运行时出现单点任务错误并且能够自动重启相应的任务。合理定义了各细小任务之间的同步或者称作数据交互的时点。抽象出来的 mapper 和 reducer 足够简单（起码在 Spark 出来之前如此），让分布式计算的门槛被大大降低。这才是整个 MapReduce 框架重要的意义所在。