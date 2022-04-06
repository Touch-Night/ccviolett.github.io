+++ 
draft = false
date = 2022-03-23T20:46:47+08:00
title = "跟着大学课程学习 C++"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 静态变量

问题：请问下列程序会输出什么？

```cpp
#include <iostream>

using namespace std;

int fun() {
	static int x = 1;
	x *= 2;
	return x;
}

int main() {
	int i, s = 1;
	for (i = 1; i <= 3; ++i)
		s *= fun();
	cout << s << endl;
}

```

答案：64

