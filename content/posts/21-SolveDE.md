+++ 
draft = false
date = 2022-03-16T19:45:28+08:00
title = "如何解决微分方程相关问题？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = ["高等数学"]
categories = []
externalLink = ""
series = []
+++

{{<toc>}}

# 一、解微分方程

## 1. $y'= f(x, y)$ 型

转化为 $y' + P(x)y = Q(x)$ 的形式，套用公式：

$$
y = e^{-\int P(x) dx} \left(\int Q(x) e^{\int P(x) dx} dx + C \right)
$$

## 2. $y^{(n)} = f(x)$ 型

两边多次积分

## 3. $y'' = f(x, y')$ 型

设 $y' = p$，则 $y'' = \frac{dp}{dx} = p'$，有 $p' = f(x, p)$，解得通解：

$$
p = \varphi(x, C_1)
$$

故 $y' = \varphi(x, C_1)$$，积分即可

## 4. $y'' = f(y, y')$ 型

设 $y' = p$，则 $y'' = \frac{dp}{dx} = \frac{dp}{dy} \cdot \frac{dy}{dx} = p\frac{dp}{dy}$。

有 $p\frac{dp}{dy} = f(y, p)$，解得通解：

$$
p = \varphi(y, C_1)
$$

故 $y' = \varphi(y, C_1)$ 分离变量积分即可。

## $y'' + py' + qy = 0$ 型 - 二阶常系数齐次线性微分方程

解其特征方程 $r^2 + pr + q = 0$，得到根 $r_1, r_2$：
- $r_1 \not = r_2$
- $r_1 = r_2$
- $r_{1, 2} = \alpha \pm \beta i$

对应微分方程的通解为 
- $y = C_1e^{r_1x} + C_2e^{r_2x}$ 
- $y = (C_1 + C_2x) e^{r_1x}$ 
- $y = e^{\alpha x}(C_1cos\beta x + C_2sin\beta x)$


高阶常系数齐次线性微分方程同理

## 5. $y'' + py' + qy = e^{\lambda x}P_m(x)$ 型

解对应 $y'' + py' + qy = 0$ 的特征方程 $r^2 + pr + q = 0$，得到两根 $r_1, r_2$，进而求出通解。

若 $\lambda$ 不为其中一根，则设 $y^* = [b]P_m(x)$ 带回微分方程，通过比较系数得到 $b_0, b_1$，进而求出特解。

最终答案为通解+特解。