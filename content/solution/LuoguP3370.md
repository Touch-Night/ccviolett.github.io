+++ 
draft = false
date = 2022-04-15T23:01:13+08:00
title = "LuoguP3370 【模板】字符串哈希"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3370)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73964870)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;

struct SHash {
	const int BASE = 107;
	const int MOD = 1e9 + 7;

	var val;
	SHash() {
		val = 0;
	}

	void add(int v) {
		((val *= BASE) += v) %= MOD;
	}
};

struct DHash {
	const int BASE1 = 107;
	const int MOD1 = 1e9 + 7;
	const int BASE2 = 109;
	const int MOD2 = 1e9 + 9;

	var val1, val2;
	DHash() {
		val1 = 0, val2 = 0;
	}

	void add(int v) {
		((val1 *= BASE1) += v) %= MOD1;
		((val2 *= BASE2) += v) %= MOD2;
	}

	var val() {
		return val1 * MOD2 + val2;
	}
};

const int N = 1e4 + 1;
const int M = 1501;

char s[M];
map<var, bool> have;

int main() {
	int n;
	scanf("%d", &n);
	int res = 0;
	for (int i = 1; i <= n; ++i) {
		scanf("%s", s);
		int len = strlen(s);
		DHash h;
		for (int j = 0; j < len; ++j) h.add(s[j]);
		if (!have[h.val()]) {
			have[h.val()] = true;
			res++;
		}
	}
	printf("%d\n", res);
	return 0;
}
```
