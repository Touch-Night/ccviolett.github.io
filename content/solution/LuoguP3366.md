+++ 
draft = false
date = 2022-04-15T23:00:14+08:00
title = "LuoguP3366 【模板】最小生成树"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3366)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73964019)

```cpp
#include <bits/stdc++.h>

using namespace std;

const int N = 5e3 + 100;
const int M = 2e5 + 100;

struct Edge {
	int u, v, w;
};

int n, m;
int fa[N];
Edge edge[M];

int Find(int t) {
	if (fa[t] != t) fa[t] = Find(fa[t]);
	return fa[t];
}

bool Check(int x, int y) {
	return Find(x) == Find(y);
}

int Link(int x, int y) {
	fa[Find(x)] = Find(y);
}

int main() {
	scanf("%d%d", &n, &m);
	for (int i = 1; i <= n; ++i) fa[i] = i;
	for (int i = 1; i <= m; ++i) {
		int x, y, z;
		scanf("%d%d%d", &x, &y, &z);
		edge[i] = (Edge) {x, y, z};
	}
	sort(edge + 1, edge + m + 1, [=] (Edge a, Edge b) {
			return a.w < b.w;
			});
	int res = 0;
	for (int i = 1; i <= m; ++i) {
		int u = edge[i].u, v = edge[i].v, w = edge[i].w;
		if (Check(u, v)) continue;
		Link(u, v);
		res += w;
	}
	for (int i = 2; i <= n; ++i) {
		if (Find(i) != Find(1)) {
			puts("orz");
			return 0;
		}
	}
	printf("%d\n", res);
	return 0;
}
```
