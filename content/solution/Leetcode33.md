+++ 
draft = false
date = 2022-04-10T15:16:34+08:00
title = "Leetcode33. 搜索旋转排序数组"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/)

### 二、题解

因为原来是升序的，可以二分找到分段点，随后在两段内再二分一次即可。

### 三、代码

通过链接：[Submission](https://leetcode-cn.com/submissions/detail/297780704/)

```py
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        l = 0
        r = len(nums) - 1
        while l < r: 
            mid = (l + r + 1) >> 1
            if nums[mid] < nums[0]:
                r = mid - 1
            else:
                l = mid
        p = l

        l = p + 1
        r = len(nums) - 1
        while l <= r:
            mid = (l + r) >> 1
            if nums[mid] < target:
                l = mid + 1
            if nums[mid] > target:
                r = mid - 1
            if nums[mid] == target:
                return mid
        l = 0
        r = p
        while l <= r:
            mid = (l + r) >> 1
            if nums[mid] < target:
                l = mid + 1
            if nums[mid] > target:
                r = mid - 1
            if nums[mid] == target:
                return mid
        return -1

```
