+++ 
draft = false
date = 2022-03-22T19:01:42+08:00
title = "Powershell 中会遇到的一些问题"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

##  无法加载文件 XXX，因为在此系统上禁止运行脚本。

在计算机上启动 Windows PowerShell 时，执行策略很可能是 Restricted（默认设置）。

> Restricted 执行策略不允许任何脚本运行。
>
> AllSigned 和 RemoteSigned 执行策略可防止 Windows PowerShell 运行没有数字签名的脚本。
>
> 本主题说明如何运行所选未签名脚本（即使在执行策略为 RemoteSigned 的情况下），还说明如何对  脚本进行签名以便您自己使用。
>
> 有关 Windows PowerShell 执行策略的详细信息，请参阅 about_Execution_Policy。

以管理员身份打开PowerShell 输入 set-executionpolicy remotesigned