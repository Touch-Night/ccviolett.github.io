+++ 
draft = false
date = 2022-04-10T15:23:17+08:00
title = "Leetcode53. 最大子数组和"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://leetcode-cn.com/problems/maximum-subarray/)

### 二、题解

累加，但值小于零时舍弃，取过程最大值

### 三、代码

通过链接：[Submission](https://leetcode-cn.com/submissions/detail/297786879/)

```cpp
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        sum = 0
        res = nums[0]
        for v in nums:
            sum += v
            if sum > res:
                res = sum
            if sum < 0:
                sum = 0
        return res
```
