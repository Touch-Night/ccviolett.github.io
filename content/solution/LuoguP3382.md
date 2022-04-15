+++ 
draft = false
date = 2022-04-15T23:02:20+08:00
title = "LuoguP3382 【模板】三分法"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P3382)

### 二、题解

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73973926)

```cpp
#include <bits/stdc++.h>

using namespace std;

typedef long long var;
typedef long double let;

const int N = 20;
const let eps = 1e-8;

int n;
double a[N];

let Calc(let x) {
	let res = 0, tx = 1;
	for (int i = n; i >= 0; --i) {
		res += tx * a[i];
		tx *= x;
	}
	return res;
}

int main() {
	let l, r;
	cin >> n >> l >> r;
	for (int i = 0; i <= n; ++i) cin >> a[i];
	while (l + eps < r) {
		let lp = l + (r - l) / 3,
		       rp = r - (r - l) / 3;
		let lv = Calc(lp), rv = Calc(rp);
		if (lv < rv) l = lp;
		else r = rp;
	}
	cout << setprecision(5) << fixed << l << endl;
	return 0;
}
```