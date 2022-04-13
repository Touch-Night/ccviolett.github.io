+++ 
draft = false
date = 2022-04-14T00:01:07+08:00
title = "Leetcode41. 缺失的第一个正数"
description = ""
slug = ""
authors = []
tags = ["很妙的思维题"]
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://leetcode-cn.com/problems/first-missing-positive/)

### 二、题解

### 三、代码

通过链接：[Submission](https://leetcode-cn.com/submissions/detail/299660762/)

```py
class Solution:
    def firstMissingPositive(self, nums: List[int]) -> int:
        for i in range(len(nums)):
            v = nums[i]
            while v > 0 and v <= len(nums) and (v - 1) != i and v != nums[v - 1]:
                nums[i] = nums[v - 1]
                nums[v - 1] = v
                v = nums[i]

        print(len(nums))
        for i in range(len(nums)):
            print(nums[i], end=" ")

        for i in range(len(nums)):
            if nums[i] != i + 1:
                return i + 1
        return len(nums) + 1
```