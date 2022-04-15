+++ 
draft = false
date = 2022-04-15T23:03:48+08:00
title = "LuoguP3379 【模板】最近公共祖先（LCA）"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3379)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73972977)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;

const int N = 5e5 + 10;
const int M = 5e5 + 10;

var read() {
	var s = 0, a = 0, c = getchar();
	while (!isdigit(c)) s |= c == '-', c = getchar();
	while (isdigit(c)) a = a * 10 + c - '0', c = getchar();
	return s ? -a : a;
}

int n, m, s;
int top, fi[N], ne[M << 1], to[M << 1];
int fa[N][21], deep[N];

void add(int u, int v) {
	ne[++top] = fi[u], fi[u] = top, to[top] = v;
}

void getInfo(int t) {
	deep[t] = deep[fa[t][0]] + 1;
	for (int i = 1; i <= 20; ++i)
		fa[t][i] = fa[fa[t][i - 1]][i - 1];
	for (int i = fi[t]; i; i = ne[i]) {
		if (to[i] == fa[t][0]) continue;
		fa[to[i]][0] = t;
		getInfo(to[i]);
	}
}

int Jump(int t, int v) {
	for (int i = 0; i <= 20; ++i) {
		if (v & (1 << i)) {
			t = fa[t][i];
		}
	}
	return t;
}

int Lca(int x, int y) {
	if (deep[x] > deep[y])
		x = Jump(x, deep[x] - deep[y]);
	else 
		y = Jump(y, deep[y] - deep[x]);

	if (x == y) return x;

	for (int i = 20; i >= 0; --i) {
		if (fa[x][i] == fa[y][i]) continue;
		x = fa[x][i], y = fa[y][i];
	}

	return fa[x][0];
}

int main() {
	n = read(), m = read(), s = read();
	for (int i = 1; i < n; ++i) {
		int u = read(), v = read();
		add(u, v), add(v, u);
	}

	getInfo(s);

	for (int i = 1; i <= m; ++i) {
		int a = read(), b = read();
		printf("%d\n", Lca(a, b));
	}
}
```
