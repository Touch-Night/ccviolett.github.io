+++ 
draft = false
date = 2022-04-15T23:04:36+08:00
title = "LuoguP3373 【模板】线段树 2"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3373)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73971312)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;

const int N = 5e5 + 100;
const int MOD = 571373;

var read() {
	var s = 0, a = 0, c = getchar();
	while (!isdigit(c)) s |= c == '-', c = getchar();
	while (isdigit(c)) a = a * 10 + c - '0', c = getchar();
	return s ? -a : a;
}

var add(var a, var b) { return (a + b > MOD) ? (a + b - MOD) : a + b; }
void sa(var &a, var b) { a = add(a, b); }
var mul(var a, var b) { return (a * b) % MOD; }
void sm(var &a, var b) { a = mul(a, b); }

int n;

struct SegTree {
	var val[N << 4];
	var add_tag[N << 4], mul_tag[N << 4];
	void Pushup(int t) {
		val[t] = add(val[t << 1], val[t << 1 | 1]);
	}
	void Pushdown(int t, int l, int r) {
		if (mul_tag[t] != 1) {
			sm(mul_tag[t << 1], mul_tag[t]);
			sm(add_tag[t << 1], mul_tag[t]);
			sm(val[t << 1], mul_tag[t]);

			sm(mul_tag[t << 1 | 1], mul_tag[t]);
			sm(add_tag[t << 1 | 1], mul_tag[t]);
			sm(val[t << 1 | 1], mul_tag[t]);

			mul_tag[t] = 1;
		}

		if (add_tag[t]) {
			int mid = (l + r) >> 1;

			sa(add_tag[t << 1], add_tag[t]);
			sa(val[t << 1], mul(mid - l + 1, add_tag[t]));

			sa(add_tag[t << 1 | 1], add_tag[t]);
			sa(val[t << 1 | 1], mul(r - mid, add_tag[t]));

			add_tag[t] = 0;
		}
	}

#define init int t = 1, int l = 1, int r = n
#define mid  ((l + r) / 2)
#define lson t << 1, l, mid
#define rson t << 1 | 1, mid + 1, r
	void Build(int *v, init) {
		add_tag[t] = 0, mul_tag[t] = 1;
		if (l == r) {
			val[t] = v[mid];
			return ;
		}
		Build(v, lson), Build(v, rson);
		Pushup(t);
	}

	void Add(int x, int y, int v, init) {
		if (x > r || y < l) return ;
		if (x <= l && r <= y) {
			sa(add_tag[t], v);
			sa(val[t], mul(r - l + 1, v));
			return ;
		}
		Pushdown(t, l, r);
		Add(x, y, v, lson), Add(x, y, v, rson);
		Pushup(t);
	}

	void Mul(int x, int y, int v, init) {
		if (x > r || y < l) return ;
		if (x <= l && r <= y) {
			sm(mul_tag[t], v);
			sm(add_tag[t], v);
			sm(val[t], v);
			return ;
		}
		Pushdown(t, l, r);
		Mul(x, y, v, lson), Mul(x, y, v, rson);
		Pushup(t);
	}

	var Query(int x, int y, init) {
		if (x > r || y < l) return 0;
		if (x <= l && r <= y) return val[t];
		Pushdown(t, l, r);
		return add(Query(x, y, lson), Query(x, y, rson));
	}
#undef init
#undef mid
#undef lson
#undef rson
};

int m;
SegTree tree;
int v[N];

int main() {
	n = read(), m = read();
	int p = read();
	for (int i = 1; i <= n; ++i) v[i] = read();
	tree.Build(v);
	for (int i = 1; i <= m; ++i) {
		int opt = read();
		if (opt == 1) {
			int x = read(), y = read(), k = read() % MOD;
			tree.Mul(x, y, k);
		}
		if (opt == 2) {
			int x = read(), y = read(), k = read() % MOD;
			tree.Add(x, y, k);
		}
		if (opt == 3) {
			int x = read(), y = read();
			printf("%d\n", tree.Query(x, y));
		}
	}
	return 0;
}
```
