+++ 
draft = false
date = 2022-03-30T19:26:48+08:00
title = "机械制图 | 螺纹"
description = ""
slug = ""
authors = ["ccviolett"]
tags = ["机械"]
categories = []
externalLink = ""
series = []
+++

### 一、螺纹的要素

1. 牙型

    螺纹的轮廓形状

2. 公称直径

    代表螺纹尺寸的直径，指大径。

    > 大径：外围圆柱的直径，d（外螺纹）或 D（内螺纹）表示。
    > 
    > 小径：内围圆柱的直径，$d_1$（外螺纹）或 $D_1$（内螺纹） 表示。

3. 线数 n

    螺旋线数量

4. 螺距 P

    螺纹相邻两牙在中径线上对应两点间的轴向距离。

5. 导程 Ph

    同一条螺纹线上的相邻两牙在中径线上对应两点间的轴向距离。

    $$ Ph = nP $$

6. 旋向

    - 顺时针旋转时旋入的螺纹称为右旋螺纹（RH）
    - 逆时针旋转时旋入的螺纹成为左旋螺纹（LH）

    省略标注时默认为 RH。

### 二、螺纹的规定画法

外螺纹：大径粗实小径虚

内螺纹：小径粗实大径虚，不通孔有 120 度钻孔

小径约为大径 0.85 倍，虚圈只画 3/4 圈

螺纹副：内、外螺纹旋合到一起后的部件

螺纹副旋合部分画外螺纹，其余部分各画各。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/LWG1H3MJXPED6aq.png)

### 三、普通螺纹的标注

(螺纹特征代号)(尺寸代号)-(公差带代号)-(旋合长度代号)-(旋向代号)

可以去这里看看各种螺纹：[奥展旗舰店](https://aozhan.tmall.com/)

1. 螺纹特征代号
    - 普通螺纹：M
    - $55^\circ$ 非密封管螺纹：G
    - $55^\circ$ 密封管螺纹：
        - $R_p$：与`圆锥`外螺纹旋合的`圆柱`内螺纹
        - $R_1$：与`圆锥`外螺纹旋合的`圆锥`内螺纹
        - $R_c$：与`圆柱`内螺纹旋合的`圆锥`外螺纹
        - $R_2$：与`圆锥`内螺纹旋合的`圆锥`外螺纹
    - 梯形螺纹：Tr
    - 锯齿形螺纹：B

2. 尺寸代号

    公称直径、导程和螺距

    - 若为单线粗牙螺纹，标注为 “公称直径”
    - 若为单线螺纹，标注为“公称直径x螺距”
    - 若为多线螺纹，标注为“公称直径xPh导程P螺距”

    > 粗牙与细牙：[粗牙与细牙的区别在哪里？如何选用](https://zhuanlan.zhihu.com/p/237543900)

3. 公差带代号

    螺纹的径向尺寸公差，包括`中经公差带代号`和`顶径公差带代号`，每一个公差带代号都由数字和字母组成。

    其中数字为`精度等级代号`，字母为`基本偏差代号`。

    - 若为内螺纹，用大写字母
    - 若为外螺纹，用小写字母

    特殊情况：
    1. 当`中经公差带代号`与`顶径公差带代号`相同时，只需标注一个即可。
    2. 中等公差精度的螺纹，当公称直径 >= 1.4mm 且公差带代号为 5H 和 6h 时，不标注。
    3. 中等公差精度的螺纹，当公称直径 >= 1.6mm 且公差带代号为 6H 和 6g 时，不标注。

4. 旋合长度代号

    表示内外螺纹旋合时的长度。

    - 短旋合长度组：S
    - 中等旋合长度组：N
    - 长旋合长度组：L

    当为中等旋合长度组时不标注

5. 旋向代号

    左旋标注 LH，右旋不标注旋向代号。

### 四、常用螺纹紧固件

常见的螺纹紧固件有螺钉、螺栓、螺柱、螺母、垫圈等

几个好用的标准查询网站：
- [易紧通紧固件网](https://www.164580.com/)
- [CIDP 制造业数字资源平台](https://www.cidp.com.cn/)


下面是课本上给出的几个常用螺纹紧固件，以下图片均来自[易紧通紧固件网](https://www.164580.com/)。


1. 开槽盘头螺钉 

螺钉 [GB/T 64-2008](https://www.164580.com/info_29954.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/6FbycP8E4etu5Ir.png)

2. 内六角圆柱头螺钉 

螺钉 [GB /T 70.1 - 2008](https://www.164580.com/info_30447.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/WUFf91YGxQmvrLb.jpg)

3. 开槽锥端紧定螺钉 

螺钉 [GB /T 71 - 2018](https://www.164580.com/info_344862.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/lTJ7xptPe4oRWGs.png)

4. 六角头螺栓 

螺栓 [GB /T 5782 - 2000](https://www.164580.com/info_6460.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/Qvt2yUzPrpT1YC6.png)

5. 双头螺柱

螺柱 [GB 899](https://www.164580.com/info_765.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/skDYA9CWuqogXQf.png)

6. 1型六角螺母 

螺母 [GB /T 6170 - 2000](https://www.164580.com/info_12529.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/6SbTN198AwylzMO.jpg)

7. 平垫圈 A级 

垫圈 [GB /T 97.1 - 2002](https://www.164580.com/info_29155.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/d9sDw51NMkXyzit.png)

8. 标准型弹簧垫圈 

垫圈 [GB 93 - 1987](https://www.164580.com/info_1037.html)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/2KPyMuI3JSiFsLT.png)