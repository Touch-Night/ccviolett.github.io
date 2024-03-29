+++ 
draft = false
date = 2022-03-28T22:57:37+08:00
title = "如何用 JS 写一个 JS 解释器？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

> #### 为什么在程序中可以修改变量名而不能修改关键字？
> 
> 因为变量名定义在程序内，而关键字定义在编译器解释器内。
> 
> 我们无法在程序中去维护关键字的相同、不同关系。

## AST 简介

AST 和代码是同一种东西的两种不同表示方式，代码方便人看的，AST 方便电脑看的。所以两个东西相互转换的时候不会丢失信息，会一一对应。

AST 实际存在于内存之中，但是为了方便人们理解，常常使用 JSON 格式来表示。

JS AST 在线浏览工具：https://astexplorer.net/
JS 语法树标准 ESTree：https://github.com/estree/estree

转换工具：
acronjs 代码 -> AST
https://github.com/acornjs/acorn
astring AST -> 代码
https://github.com/davidbonnet/astring

## 编译的分类

编译分为编译前端和编译后端，其中前端一般负责解析和转换，后端负责执行和编译到目标平台。

其间存在一个中间表示叫 AR，还需要中间优化。

后端技术：JIT

### 编译中的悖论

当你能够理解编译原理的时候，说明你已经掌握基本知识了，你是去研究一门编程语言的，研究其是如何解释、如何解析、如何分析、如何生成代码、最后如何执行的，所以首先就要对编程语言这个东西有足够多的理解。

而深入理解编程语言又需要有足够的编译原理知识。

推荐书籍《计算的本质》《计算机程序的构造和解释》，属于偏理论方面的书籍，而不是像其他编译原理的书籍偏向于工程。

可以去尝试写写 lisp 解释器，lisp 作为一门语法极其简单的早期编程语言，很好实现。
