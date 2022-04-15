+++ 
draft = false
date = 2022-04-15T22:56:13+08:00
title = "LuoguP1226 【模板】快速幂||取余运算"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P1226)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73962566)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;

var qpow(var x, var y, var p) {
	var res = 1;
	while (y) {
		if (y & 1) (res *= x) %= p;
		(x *= x) %= p;
		y >>= 1;
	}
	return res;
}

int main() {
	int a, b, p;
	scanf("%d%d%d", &a, &b, &p);
	printf("%d^%d mod %d=%lld\n", a, b, p, qpow(a, b, p));
	return 0;
}
```
