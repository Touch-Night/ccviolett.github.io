+++ 
draft = false
date = 2022-06-17T10:25:41+08:00
title = "高数下"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

T249 T1(1). 第二类曲线积分 $\int_{\Gamma} P dx + Q dy + R dz$ 化成第一类曲线积分是________，其中 $\alpha$、$\beta$、$\gamma$ 为有向线弧 $\Gamma$ 在点 $(x, y, z)$ 处的________的方向角。

答案：$\int\limits_{\Gamma} (P \cos \alpha + Q \cos \beta + R \cos \gamma) ds$、切向量

1. 知识点匹配

课本 P203 第二节公式 (2-3)，告诉了我们空间曲线弧 $\Gamma$ 上的两类曲线积分之间有如下联系：

$$
\int_{\Gamma} P dx + Q dy + R dz = \int_{\Gamma} (P \cos \alpha + Q \cos \beta + R \cos \gamma) ds
$$

其中 $\alpha(x, y, z)$、$\beta(x, y, z)$、$\gamma(x, y, z)$ 为有向曲线弧 $\Gamma$ 在点 $(x, y, z)$ 处的切向量的方向角.

2. 相似性拟合

3. 通用解归纳

----

T249 T1(1). 第二类曲线积分 $\iint_{\Sigma} P dydz + Q dzdx + R dxdy$ 化成第一类曲线积分是________，其中 $\alpha$、$\beta$、$\gamma$ 为有向线弧 $\Gamma$ 在点 $(x, y, z)$ 处的________的方向角。

答案：$\iint\limits_{\Sigma} (P \cos \alpha + Q \cos \beta + R \cos \gamma) dS$、法向量

1. 知识点匹配

课本 P230 第五节公式 (5-9)，告诉了我们两类曲线积分之间有如下联系：

$$
\iint_{\Sigma} P dydz + Q dzdx + R dxdy = \iint_{\Sigma} (P \cos \alpha + Q \cos \beta + R \cos \gamma) dS
$$

其中 $\cos \alpha$、$\cos \beta$、$\cos \gamma$ 是有向曲面 $\Sigma$ 在点 $(x, y, z)$ 处的法向量的方向余弦.

其中 $\alpha(x, y, z)$、$\beta(x, y, z)$、$\gamma(x, y, z)$ 为有向曲线弧 $\Sigma$ 在点 $(x, y, z)$ 处的切向量的方向角

2. 相似性拟合

3. 通用解归纳

----

P249 T3(1). 计算曲线积分 $\oint_{L} \sqrt{x^2 + y^2} ds$，其中 $L$ 为圆周 $x^2 + y^2 = ax$;

答案：

解法一 $L$ 的方程即为 $(x - \frac{a}{2})^2 + y^2 = \frac{a^2}{4}$，故可取 $L$ 的参数方程为 $x = \frac{a}{2} + \frac{a}{2} \cos t, y = \frac{a}{2} \ sin t, 0 \leqslant t \leqslant 2 \pi$，于是

$$
\oint_{L} \sqrt{x^2 + y^2} ds = \int_{0}^{2\pi} \frac{\sqrt{2} a}{2} \sqrt{1 + \cos t} \cdot \sqrt{(-\frac{a}{2} \sin t)^2 + (\frac{a}{2} \cos t)^2} dt
= \frac{\sqrt{2} a^2}{4} \int_{0}^{2\pi} \sqrt{1 + \cos t} dt = \frac{\sqrt{2}a^2}{4} \cdot \sqrt{2} \int_{0}^{2\pi} \left| \cos \frac{t}{2} \right| dt
= 2a^2\int_{0}^{\pi} \cos \frac{t}{2} d(\frac{t}{2}) = 2a^2.
$$

解法二 $L$ 的极坐标方程为 $\rho = a \cos \theta(-\frac{\pi}{2} \leqslant \theta \leqslant \frac{\pi}{2})$，

$$
ds = \sqrt{\rho^2 + \rho'^2} d\theta = ad\theta
$$

因此 $\oint\limits_{L} \sqrt{x^2 + y^2} ds = \int_{-\frac{\pi}{2}}^{\frac{\pi}{2}} a \cos\theta \cdot a d\theta = 2a^2$

1. 知识点匹配

课本 P190 第一节定理 (1-1)，告诉我们对弧长的曲线积分的计算法：

定理 设 $f(x, y)$ 在曲线弧 $L$ 上有定义且连续，$L$ 的参数方程为 $x=\varphi(t), y=\psi(t), \alpha \leqslant t \leqslant \beta$.

若 $\varphi(t)$、$\psi(t)$ 在 $[\alpha, \beta]$ 上具有一阶连续导数，且 $\varphi'^2(t) + \psi'^2(t) \not = 0$，则曲线积分 $\int_{L} f(x, y) ds$ 存在，且

$$
\int_{L} f(x, y) ds = \int_{\alpha}^{\beta} f[\varphi(t), \psi(t)] \sqrt{\varphi'^2(t) + \psi'^2(t)} dt (\alpha < \beta)
$$

可推广到空间曲线弧 $\Gamma$ 由参数方程 $x = \varphi(t), y = \psi(t), z = \omega(t), \alpha \leqslant t \leqslant \beta$ 给出的情况，这时有

$$
\int_{\Gamma} f(x, y, z) ds = \int_{\alpha}^{\beta} f[\varphi(t), \psi(t), \omega(t)] \sqrt{\varphi'^2(t) + \psi'^2(t) + \omega'^2(t)} dt (\alpha < \beta)
$$

P249 T3(2). 计算曲线积分 $\int_{\Gamma} zds$，其中 $\Gamma$ 为曲线 $x=t\cos t, y=t\sin t, z=t (0 \leqslant t \leqslant t_0)$;

P249 T3(3). 计算曲线积分 $\int_{L} (2a - y) dx + x dy$，其中 $L$ 为摆线 $x = a(t - t\sin t), y = a(1 - \cos t)$ 上对应 $t$ 从 0 到 $2\pi$ 的一段弧;

P249 T3(4). 计算曲线积分 $\int_{\Gamma} (y^2 - z^2) dx + 2yz dy - x^2 dz$，其中 $\Gamma$ 是曲线 $x = t, y = t^2, z = t^3$ 上由 $t_1 = 0$ 到 $t_2 = 1$ 的一段弧;

P249 T3(5). 计算曲线积分 $\int_{L} (e^x \sin y - 2y) dx + (e^x \cos y - 2) dy$ 其中 $L$ 为上半圆周 $(x - a)^2 + y^2 = a^2, y \geqslant 0$ 沿逆时针方向;

P249 T3(6). 计算曲线积分 $\oint_{\Gamma} xyz dz$ 其中 $\Gamma$ 是用平面 $y=z$ 截球面 $x^2 + y^2 + z^2 = 1$ 所得的截痕，从 $z$ 轴的正向看去，沿逆时针方向.