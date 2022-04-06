+++ 
draft = false
date = 2022-04-01T17:37:13+08:00
title = "洛谷 P1315 [NOIP2011 提高组] 观光公交"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P1315)

一条路上从左往右有 n 个车站，一辆车从 1 号车站往 n 号车站开，从 $i$ 号车站到 $i + 1$ 号车站需要 $D_i$ 分钟。

给开 m 个人，在 $T_i$ 时刻从 $A_i$ 上车，希望在 $B_i$ 下车，保证 $A_i < B_i$。

车到了某个车站必须等所有人上车了才能发车。

现在有 k 次机会选定 $D_i$ 将其减小 1，问如何分配 k 此机会，使得所有人在车上呆的总时间最少。

### 二、题解

考虑拆分贡献，要求所有人在车上呆的总时间最少，设下车时间为 $T'$，则总时间为 $\sum_{i = 1}^{m} (T'_i - T_i)$，拆分为 $\sum T'_i - \sum T_i$，其中 $\sum T_i$ 为定值，故我们只需最小化 $\sum T'_i$。

我们设在第 i 站下车的人数为 $cntto_i$，到达第 i 站的时间为 $arrive_i$，则 $\sum\limits\_{i = 1}^m T'_i = \sum\limits\_{i = 1}^n (cntto_i * arrive_i)$，其中 $cntto_i$ 是固定的，所以我们只需要最小化到达每个点的时间。

计算每个车站最早发车时间 $maxt_i$（乘客 $T_i$ 中的最大值），对于 $arrive_i > maxt_i$ 的车站，表示其之前可以加速来使得在该车站的等待时间减少。

我们遍历每段车程，计算其能够起到加速效果的车站区间，每次取能够包含最多用户的一段，使用掉这次的加速，随后重新计算所有的值，进行下一次加速分配即可。

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/72916273)

```cpp
#include <bits/stdc++.h>

using namespace std;

const int N = 1e3 + 10;
const int M = 1e4 + 10;
typedef long long var;

int read() {
	var a = 0, c = getchar(), s = 0;
	while (!isdigit(c)) s |= c == '-', c = getchar();
	while (isdigit(c)) a = a * 10 + c - '0', c = getchar();
	return s ? -a : a;
}

int n, m, k;
int d[N];
int sumt, maxt[N], cntto[N];
int arrive[N];

int main() {
	n = read(), m = read(), k = read();
	for (int i = 1; i < n; ++i) d[i] = read();
	for (int i = 1; i <= m; ++i) {
		int t = read(), a = read(), b = read();
		sumt += t;
		maxt[a] = max(maxt[a], t);
		cntto[b]++;
	}
	for (int i = 1; i <= n; ++i)
		arrive[i] = max(arrive[i - 1], maxt[i - 1]) + d[i - 1];
	while (k--) {
		int maxi = -1, maxup = -1;
		for (int i = 1; i <= n; ++i) {
			if (d[i] <= 0) continue;
			int canup = cntto[i + 1];
			for (int j = i + 1; j < n; ++j) {
				if (arrive[j] <= maxt[j]) break;
				canup += cntto[j + 1];
			}
			if (canup > maxup) {
				maxup = canup;
				maxi = i;
			}
		}
		d[maxi]--;
		for (int i = 1; i <= n; ++i)
			arrive[i] = max(arrive[i - 1], maxt[i - 1]) + d[i - 1];
	}

	// for (int i = 1; i <= n; ++i)
	// 	printf("%d %d\n", arrive[i], cntto[i]);

	var res = 0;
	for (int i = 1; i <= n; ++i)
		res += arrive[i] * cntto[i];
	printf("%lld\n", res - sumt);
	return 0;
}
```