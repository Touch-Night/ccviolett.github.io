+++ 
draft = false
date = 2022-04-15T22:58:49+08:00
title = "LuoguP3383 【模板】线性筛素数"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3383)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73974374)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;

const int N = 1e8 + 1;

bool notprime[N];
int cnt, prime[N];

int main() {
	int n, q;
	scanf("%d%d", &n, &q);
	for (int i = 2; i <= n; ++i) {
		if (!notprime[i]) prime[++cnt] = i;

		for (int j = 1; j <= cnt; ++j) {
			if (1ll * i * prime[j] > n) break;
			notprime[i * prime[j]] = true;
			if (!(i % prime[j])) break;
		}
	}
	for (int i = 1; i <= q; ++i) {
		int k;
		scanf("%d", &k);
		printf("%d\n", prime[k]);
	}
	return 0;
}
```
