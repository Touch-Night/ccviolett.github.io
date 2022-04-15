+++ 
draft = false
date = 2022-04-15T21:33:24+08:00
title = "LuoguP3367 【模板】并查集"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3367)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73962242)

```cpp
#include <bits/stdc++.h>

using namespace std;

const int N = 1e4 + 1;
const int M = 2e5 + 1;

int n, m;
int fa[N];

int Find(int t) {
	if (t != fa[t]) 
		fa[t] = Find(fa[t]);
	return fa[t];
}

int Check(int x, int y) {
	x = Find(x), y = Find(y);
	return x == y;
}

void Link(int x, int y) {
	x = Find(x), y = Find(y);
	fa[x] = y;
}

int main() {
	scanf("%d%d", &n, &m);
	for (int i = 1; i <= n; ++i) fa[i] = i;
	for (int i = 1; i <= m; ++i) {
		int z, x, y;
		scanf("%d%d%d", &z, &x, &y);
		if (z == 1) {
			if (!Check(x, y)) Link(x, y);
		}
		if (z == 2) {
			if (Check(x, y)) puts("Y");
			else puts("N");
		}
	}
	return 0;
}

```
