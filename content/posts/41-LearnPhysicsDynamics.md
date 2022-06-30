+++ 
draft = false
date = 2022-04-05T17:06:04+08:00
title = "大学物理力学分析"
description = ""
slug = ""
authors = []
categories = []
externalLink = ""
series = []
+++

### 相关连接

- [这是你理解相对论的另一种方法](https://www.bilibili.com/video/BV17P4y1V7BX)
- [幼儿园毕业就能推导出的相对论宇宙！听不懂打我！](https://www.bilibili.com/video/BV15R4y1x7KM)
- [简单明了，广义相对论的新可视化解释方法](https://www.bilibili.com/video/BV13X4y1V7WP)
- [如何证明广义相对论是对的？这三个实验神助攻！【宇宙峥相】](https://www.bilibili.com/video/BV1gU4y1x7HC)


### 知识点

自然坐标系下的速度：$v = \frac{ds}{dt}$

切向加速度：$a_{\tau} = \frac{dv}{dt}$

法向加速度：$a_{n} = \frac{v^2}{\rho}$

自然坐标系下的加速度 $\vec{a} = \vec{a_{\tau}} + \vec{a_{n}} = a_{\tau}\vec{\tau_0} + a_{n}\vec{n_0}$

自然坐标系下的加速度大小 $a = \sqrt{a_{\tau}^2 + a_{n}^2} = \sqrt{(\frac{dv}{dt})^2 + (\frac{v^2}{\rho})}$

通过右手定则判断角位移的正负，向上为正。

线速度和角速度的关系：

$\vec{v} = \vec{\omega} \times \vec{r}$

$v = \omega r$

角加速度的计算： $\vec{\alpha} = \frac{d\vec{\omega}}{dt}$

线加速度和角加速度的关系：

$a_{\tau} = \frac{dv}{dt} = \frac{d(\omega R)}{dt} = R\frac{d\omega}{dt} = R\alpha$

$a_n = \frac{v^2}{R} = \frac{(\omega R)^2}{R} = R\omega^2$

$\vec{a} = a_{\tau}\vec{\tau_0} + a_n\vec{n_0}$

国际标准单位（SI）：m/s

自然坐标系下的牛二：$\vec{F} = m\vec{\vec{a}} = \vec{F_{\tau}} + \vec{F_n} = m\vec{a_{\tau}} + m\vec{a_n}$

万有引力：$\vec{F} = -G\frac{m_1m_2}{r^2} \vec{r_0}$

胡克定律：$F = -kx$

动量定理：

$\vec{I} = \Delta \vec{p}$

$\vec{I} = \int_{t_0}^{t} \vec{F} dt = \vec{\bar{F}}\Delta t = \Delta m\vec{v}$

动量定理在每个方向上独立适用

元功：$dW = \vec{F} \cdot d\vec{r}$

功的计算：$W = \bar{\vec{F}} \cdot \Delta\vec{r} = \int_{A}^{B} \vec{F} \cdot dr = \int_{A}^{B} (F_xdx + F_ydy)$

功率的计算$P = \vec{F} \cdot \vec{v}$

保守力是与路径无关的力，保守内力做功不影响机械能

闭合积分路径：$\oint_L \vec{F_{保}}\cdot d\vec{r} = 0$

引力势能：$E_{pA} = -G \frac{m_1m_2}{r_A}$

弹性势能：$E_{p弹} = \frac{1}{2}kx^2$

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204251728292.png)

力矩计算：$\vec{M} = \vec{r} \times \vec{F}$

角动量（动量矩）计算：$\vec{L} = \vec{r} \times \vec{p}$

当做圆周运动时，$L = r^2m\omega$

角动量定理：由 $\vec{F} = \frac{d\vec{p}}{dt}$ 类比得到 $\vec{M} = \frac{d\vec{L}}{dt}$

伽利略变换：

$\vec{v} = \vec{v'} + \vec{u}$

$\vec{a}_a = \vec{a}_r + \vec{a}_e$

### 推导

#### 从牛顿第二定律推导动能定理

$\vec{F} = m\vec{a}$

$\vec{F} \cdot d\vec{r} = m\frac{d\vec{v}}{dt} \cdot d{\vec{r}}$

$dW = md\vec{v} \cdot \frac{d\vec{r}}{dt} = m\vec{v} \cdot d\vec{v} = \frac{1}{2} m\cdot d(\vec{v}^2) = d(\frac{1}{2}m\vec{v}^2) = dE_k$

$W = E_k$

#### 从牛顿第二定律推导角动量定理

要推导 $\vec{M} = \frac{d\vec{L}}{dt}$，即 $\vec{r} \times \vec{F} = \frac{d(\vec{r} \times \vec{p})}{dt} = \vec{r} \times \frac{d\vec{p}}{dt} + \frac{d\vec{r}}{dt} \times \vec{p}$

由 $\vec{F} = \frac{d\vec{p}}{dt}$ 得 $\vec{r} \times \vec{F} = \vec{r} \times \frac{d\vec{p}}{dt}$

故仅需证明 $\frac{d\vec{r}}{dt} \times \vec{p} = \vec{v} \times m \vec{v} = 0$

### 易错点

- 速度的大小是标量
- 求某段时间内的位移可以用末位移减去初位移，但是求某段时间内短路程不可以，要先计算 v=0 的时刻。
- |\vec{\bar{v}}| \not = \bar{v}
- 力矩 $\vec{M}$ 的方向为角动量变化 $d\vec{L}$ 的方向

### 例题

1. 一运动质点某瞬时位于矢径 $\vec r(x, y)$ 的端点处，其速度大小为(D)
- A $\frac{dr}{dt}$
- B $\frac{d\vec r}{dt}$
- C $\frac{d|\vec r|}{dt}$
- D $\sqrt{(\frac{dx}{dt})^2 + (\frac{dy}{dt})^2}$

因为 |d\vec{r}| \not = d|\vec{r}| = dr，故排除 A、C。

速度大小为标量，排除 B；$v = \sqrt{v_x + v_y}$，故正确答案为 D。

2. (x)质点作圆周运动时，所受的合外力一定指向圆心

只有匀速圆周运动的时候,合力才指向圆心。非匀速的圆周运动,合力不指向圆心。

3. 对于一个物体系来说，在下列的哪种情况下系统的机械能守恒？（C）
- A 合外力为0
- B 合外力不做功
- C 外力和非保守内力都不做功
- D 外力和保守内力都不做功

保守力：做功与物体运动所经过的路径无关，只与运动物体的起点和终点的位置、保守力场的性质有关的力，如重力、洛伦兹力。

A：合外力为 0 的情况下，可能会使得系统的势能增加

B：合外力不做功，其分力可能做功

D：保守力做功并不会影响系统的机械能，会和保守势能相互转换

4. 两质量分别为m1、m2的小球，用一劲度系数为k的轻弹簧相连，放在水平光滑桌面上，如图所示．今以等值反向的力分别作用于两小球，则两小球和弹簧这系统的（B）

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/IwCMW946eqtGZb2.png)

- A 动量守恒，机械能守恒．
- B 动量守恒，机械能不守恒．
- C 动量不守恒，机械能守恒．
- D 动量不守恒，机械能不守恒．

5. 弹性系数为k的轻弹簧，一端与倾角为α的斜面上的固定挡板A相接，另一端与质量为m的物体B相连．O点为弹簧没有连物体、原长时的端点位置，a点为物体B的平衡位置．现在将物体B由a点沿斜面向上移动到b点(见下图)．设a点与O点，a点与b点之间距离分别为x1和x2，则在此过程中，由弹簧、物体B和地球组成的系统势能的增加为(　　)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/3nNyO1Kos56L7Tl.png)

- A $\frac{1}{2}kx_2^2 + mgx_2sin a$
- B $\frac{1}{2}k(x_2 - x_1)^2 + mg(x_2 - x_1)sin a$
- C $\frac{1}{2}k(x_2 - x_1)^2 - \frac{1}{2}kx_1^2 + mgx_2sin a$
- D $\frac{1}{2}k(x_2 - x_1)^2 - mg(x_2 - x_1)sin a$

弹性势能公式：$W = \frac{1}{2}kx^2$

6. 力F＝12t i(SI)作用在质量m＝2 kg的物体上，使物体由原点从静止开始运动，则它在3s末的动量应为（54i kg*m*s^{-1}）

7. 用一根细线吊一重物，重物质量为5kg，重物下面再系一根同样的细线，细线只能经受70N的拉力.现在突然向下拉一下下面的线.设力最大值为50N，则（D）

- A 下面的线先断．
- B 上面的线先断．
- C 两根线一起断．
- D 两根线都不断．

由于作用时间短，对上端细线影响可以忽略，突然向下拉力最大值为50 N<70 N(细线能经受的拉力)，下面的线不会断，故两根线都不断。

8. 质量为 m 的小球，用轻绳 AB，BC 连接，如图所示，其中 AB 水平。剪断绳 AB 前后的瞬间，绳 BC 的张力比为______。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204251921472.png)

注意轻绳的力是可以突变的！所以剪断之后小球所受的合外力并不水平向右，而是会有一个圆周运动的趋势。
