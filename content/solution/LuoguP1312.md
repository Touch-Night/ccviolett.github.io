+++ 
draft = false
date = 2022-04-04T15:35:31+08:00
title = "洛谷 P1312 [NOIP2011 提高组] Mayan 游戏"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://www.luogu.com.cn/problem/P1312)

### 二、题解

大模拟，记忆化搜索。

坑点：局面相同时，可能因为层数不同而导致结果不同，记忆化搜索时，不要剪掉了答案的枝。

### 三、代码

通过链接：[Submission](https://www.luogu.com.cn/record/73146916)

```cpp
#include <bits/stdc++.h>

using namespace std;

// 对于代码量偏大的程序，尽可能将功能拆分

// 整体思路：
// 拖动
// 掉落
// while(检查)
//	消除
//	掉落

struct State {

	// 在不同层的状态，即使局面相同，也可能有不同的结果
	// 因为有时候需要浪费步数
	int level;

	int color[10][10];
	bool mark[10][10];

	// 说明：输入数据
	void read() {
		for (int i = 0; i < 5; ++i) {
			for (int j = 0; true; ++j) {
				scanf("%d", &color[i][j]);
				if (color[i][j] == 0) 
					break;
			}
		}
	}

	// 说明：输出数据
	void print() {
		for (int j = 6; j >= 0; --j) {
			for (int i = 0; i < 5; ++i) {
				printf("%d ", color[i][j]);
			}
			puts("");
		}
		puts("");
	}

	// 说明：将 (x, y) 往方向 d 拖动
	// 问题：我们需要知道，某一次拖动是否可行，以此来判断是否能够做这一步
	// 方法：给这个函数一个返回值，表示是否能拖动 
	bool drag(int x, int y, int d) {
		if (d == 1) {
			if (x == 4) return false;
			swap(color[x][y], color[x + 1][y]);
		}
		if (d == -1) {
			if (x == 0) return false;
			swap(color[x][y], color[x - 1][y]);
		}

		all_fall();

		while (check()) {
			clean();
			all_fall();

			// print();
		}

		return true;
	}

	// 说明：位置 (x, y) 向下掉落
	void single_fall(int x, int y) {
		while (y > 0 && color[x][y - 1] == 0) {
			swap(color[x][y], color[x][y - 1]);
			// 这种写法也行
			// color[x][y - 1] = color[x][y];
			// color[x][y] = 0;

			y--;
		}
	}

	// 说明：检查当前状态中，是否有能够消除的
	// 问题：我们需要知道还有没有能够消除的，以便进入下一次拖动
	// 方法：函数返回一个值，表示是否存在
	bool check() {
		// 清空标记
		for (int i = 0; i < 5; ++i) {
			for (int j = 0; j < 7; ++j) mark[i][j] = false;
		}

		// 记录有没有能够消除的
		bool have = false;

		// 枚举每个格子
		for (int i = 0; i < 5; ++i) {
			for (int j = 0; j < 7; ++j) {
				if (color[i][j] == 0) continue;

				// printf("(%d, %d)%d ", i, j, color[i][j]);

				// 计算向右有 t 个相连的
				int t = 1;
				while (i + t < 5 && color[i][j] == color[i + t][j]) t++;
				t--;

				// printf("t_right: %d ", t);

				// 如果大于 3 个相连即可标记为消除
				if (t >= 2) {
					for (int k = 0; k <= t; ++k) {
						mark[i + k][j] = true;
					}

					have = true;
				}

				// =============================

				// 计算向上有 t 个相连的
				t = 1;
				while (j + t < 5 && color[i][j] == color[i][j + t]) t++;
				t--;

				// printf("t_up: %d\n", t);

				// 如果大于 3 个相连即可标记为消除
				if (t >= 2) {
					for (int k = 0; k <= t; ++k) {
						mark[i][j + k] = true;
					}

					have = true;
				}

			}
		}
		return have;
	}

	// 说明：清除被标记的连续的块
	void clean() {
		// for (int j = 6; j >= 0; --j) {
		// 	for (int i = 0; i < 5; ++i) {
		// 		printf("%d ", mark[i][j]);
		// 	}
		// 	puts("");
		// }
		// puts("");

		for (int i = 0; i < 5; ++i) {
			for (int j = 0; j < 7; ++j) {
				if (mark[i][j]) {
					color[i][j] = 0;
				}
			}
		}
	}

	// 说明：让整个图下落到不需要下落为止
	void all_fall() {
		for (int i = 0; i < 5; ++i) {
			for (int j = 0; j < 7; ++j) {
				// 如果是空格子就不用下落
				if (color[i][j] == 0) continue;
				single_fall(i, j);
			}
		}
	}

	// 说明：查询图的结果
	bool result() {
		for (int i = 0; i < 5; ++i) {
			for (int j = 0; j < 7; ++j) {
				if (color[i][j] != 0) return false;
			}
		}
		return true;
	}
};

bool operator < (const State a, const State b) {
	if (a.level != b.level) return a.level < b.level;
	for (int i = 0; i < 5; ++i) {
		for (int j = 0; j < 7; ++j) {
			if (a.color[i][j] != b.color[i][j]) {
				return a.color[i][j] < b.color[i][j];
			}
		}
	}
	return false;
}


State s;

const int N = 10;

int n;
int x[N], y[N], d[N];
State sta[N];
map<State, bool> have;

void DFS(int t) {

	if (have[sta[t]]) return ;
	have[sta[t]] = true;

	if (t > n) {
		if (sta[t].result()) {
			for (int i = 1; i <= n; ++i) {
				printf("%d %d %d\n", x[i], y[i], d[i]);
			}
			// 暴力退出整个程序
			exit(0);
		}
		return ;
	}

	// 通过每一层的 sta[t]，来计算下一层 sta[t + 1] 的状态
	for (int i = 0; i < 5; ++i) {
		for (int j = 0; j < 7; ++j) {
			if (sta[t].color[i][j] == 0) continue;

			// 如果能拖动，进行 DFS 往下搜

			sta[t + 1] = sta[t];
			sta[t + 1].level = sta[t].level + 1;
			if (sta[t + 1].drag(i, j, 1)) {
				x[t] = i, y[t] = j, d[t] = 1;
				DFS(t + 1);
			}

			sta[t + 1] = sta[t];
			sta[t + 1].level = sta[t].level + 1;
			if (sta[t + 1].drag(i, j, -1)) {
				x[t] = i, y[t] = j, d[t] = -1;
				DFS(t + 1);
			}
		}
	}
}

int main() {
	scanf("%d", &n);
	s.read();

	sta[1] = s;
	sta[1].level = 1;
	DFS(1);

	puts("-1");
	return 0;
}

```