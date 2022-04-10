+++ 
draft = false
date = 2022-04-10T16:40:28+08:00
title = "Leetcode31. 下一个排列"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 一、题意

题目链接：[Problem](https://leetcode-cn.com/submissions/detail/297834690/)

### 二、题解

虽然无耻，但是能过，C++ 可以直接用 STL 里面写好的 `next_permutation`

真要写的话，看官方题解，Python 不太好写。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/31.gif)

### 三、代码

通过链接：[Submission](https://leetcode-cn.com/submissions/detail/297839822/)

```cpp
class Solution {
public:
    void nextPermutation(vector<int>& nums) {
        next_permutation(nums.begin(), nums.end());
    }
};
```
