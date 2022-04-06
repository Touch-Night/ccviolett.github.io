+++ 
draft = false
date = 2022-03-09T08:31:03+08:00
title = "跟着 JetBrains Academy 学习 Java"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

学习地址：[JetBrains Academy](https://hyperskill.org/)，通过 edu 邮箱验证后，可获得 3 个月免费使用时间，通过第一个项目后可额外获得 2 个月免费使用时间。

一个好用的在线 Java 编辑器：[Json.cn 在线运行 Java](https://www.json.cn/runcode/run_java/)

### 一、命令行输入输出

输入：创建 Scanner 对象，接受从控制台的输入，通过 `next()` 获取下一个字符串（由空格或回车隔开），通过 `nextLine()` 读入一行数据。

```java
Scanner input = new Scanner(System.in);
String str1 = input.next();
String str2 = input.nextLine();
int val1 = input.nextInt();
int val2 = Interger.parseInt(input.next());
```

输出：

```java
System.out.println(str);
System.out.println(val);
System.out.printf("%d", val);
```

### 二、字符串处理

注意，Java 中字符串下标从 0 开始。

字符串长度：`int length()`

字符串匹配：

- `int indexOf(String str, int startIndex = 0)`：从指定的索引处开始，返回第一次出现的指定子字符串在此字符串中的索引。 

- `int lastIndexOf(String str, int startIndex = 0)` ：从指定的索引处开始向后搜索，返回在此字符串中最后一次出现的指定子字符串的索引。

字符串分割：

- `String[] split(String str, int limit = 0)`：按指定的分割符对目标字符串进行分割，分割后的内容存放在字符串数组中，限制生成字符串个数为 limit