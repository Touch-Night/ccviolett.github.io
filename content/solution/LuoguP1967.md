+++ 
draft = false
date = 2022-04-12T18:48:16+08:00
title = "LuoguP1967 [NOIP2013 提高组] 货车运输"
description = ""
slug = ""
authors = []
tags = ["优质模板题"]
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P1967)

### 二、题解

首先是一个最大生成树，随后是一个树上路径最小值查询。

是一个锻炼 Kruskal/Prim + 树剖/倍增 的板子。

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73791244)

```cpp
#include <bits/stdc++.h>

using namespace std;

int read() {
	int a;
	scanf("%d", &a);
	return a;
}

struct Edge {
	int u, v, w;
};

const int N = 1e5 + 100;
const int M = 1e5 + 100;

int n, m;
Edge edge[M];
int fa[N];
int top, fi[N], ne[M << 1], to[M << 1], co[M << 1];

int Find(int t) {
	if (fa[t] != t)
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

bool camp(Edge a, Edge b) {
	return a.w > b.w;
}

void add(int u, int v, int w) {
	ne[++top] = fi[u], fi[u] = top, to[top] = v, co[top] = w;
}

bool arrive[N];
int deep[N];
int up[N][21], val[N][21];
int minv;

int Jump(int t, int v) {
	for (int i = 0; i <= 20; ++i) {
		if (v & (1 << i)) {
			minv = min(minv, val[t][i]);
			t = up[t][i];
		}
	}
	return t;
}

int Lca(int x, int y) {
	if (deep[x] < deep[y])
		swap(x, y);
	x = Jump(x, deep[x] - deep[y]);

	if (x == y) return x;

	for (int i = 20; i >= 0; --i) {
		if (up[x][i] == up[y][i]) continue;
		minv = min(minv, val[x][i]);
		minv = min(minv, val[y][i]);
		x = up[x][i], y = up[y][i];
	}

	minv = min(minv, val[x][0]);
	minv = min(minv, val[y][0]);
	return up[x][0];
}

void DFS(int t) {
	arrive[t] = true;
	deep[t] = deep[up[t][0]] + 1;
	for (int i = 1; i <= 20; ++i) {
		up[t][i] = up[ up[t][i - 1] ][i - 1];
		val[t][i] = min(val[t][i - 1], val[ up[t][i - 1] ][i - 1]);
	}

	for (int i = fi[t]; i; i = ne[i]) {
		if (to[i] == up[t][0]) continue;
		up[to[i]][0] = t;
		val[to[i]][0] = co[i];
		DFS(to[i]);
	}
}

int main() {
	n = read(), m = read();
	for (int i = 1; i <= m; ++i) {
		int u = read(), v = read(), w = read();
		edge[i] = (Edge) {u, v, w};
	}

	sort(edge + 1, edge + m + 1, camp);
	for (int i = 1; i <= n; ++i) fa[i] = i;
	for (int i = 1; i <= m; ++i) {
		int u = edge[i].u, v = edge[i].v;
		if (Check(u, v)) continue;
		Link(u, v);
		add(u, v, edge[i].w), add(v, u, edge[i].w);
	}

	memset(val, 0x3f, sizeof(val));
	for (int i = 1; i <= n; ++i) {
		if (!arrive[i]) DFS(i);
	}

	int q = read();
	for (int i = 1; i <= q; ++i) {
		minv = 0x3f3f3f3f;
		int x = read(), y = read();
		if (!Check(x, y)) puts("-1");
		else {
			Lca(x, y);
			printf("%d\n", minv);
		}
	}
	return 0;
}

```
