+++ 
draft = false
date = 2022-04-10T16:33:03+08:00
title = "Leetcode42. 接雨水"
description = ""
slug = ""
authors = []
tags = ["巧妙的题目"]
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://leetcode-cn.com/problems/trapping-rain-water/)

### 二、题解

网上一个很妙的做法，水的面积=蓝色框面积+红色框面积-黑色面积-整个矩形面积

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/1646795634-QXDwWd-%E5%8F%8C%E6%8C%87%E9%92%88%E9%9D%A2%E7%A7%AF%E8%A7%A3%E6%B3%95.png)

### 三、代码

通过链接：[Submission](https://leetcode-cn.com/submissions/detail/297834690/)

```py
from pydoc import getpager

class Solution:
    def trap(self, height: List[int]) -> int:
        n = len(height)
        res = 0
        maxhl = 0
        maxhr = 0
        for i in range(n):
            maxhl = max(maxhl, height[i])
            maxhr = max(maxhr, height[n - i - 1])
            res += maxhl + maxhr - height[i]
        res -= len(height) * maxhl
        return res

```
