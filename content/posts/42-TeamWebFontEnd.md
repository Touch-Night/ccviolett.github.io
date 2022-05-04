+++ 
draft = false
date = 2022-04-10T10:15:53+08:00
title = "创新实验班 Web 开发 | 前端"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = ["创新实验班 Web 开发"]
externalLink = ""
series = []
+++

{{<toc>}}

## 关键词

- classList
- dataset

## 相关链接

- [HTML智能表单](https://blog.csdn.net/weixin_43885459/article/details/84671565)
- [CSS 选择器](https://www.w3school.com.cn/cssref/css_selectors.asp)
- [CSS选择器的优先级（精讲版）](http://c.biancheng.net/view/7216.html)
- [CSS 简写属性](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Shorthand_properties)
- [CSS 精灵图](http://m.biancheng.net/css3/sprite.html)：合并小图片得到精灵图，传输加快加载速度，通过 CSS 切割
- [CSS outline](https://developer.mozilla.org/zh-CN/docs/Web/CSS/outline)：轮廓
- [CSS resize](https://developer.mozilla.org/zh-CN/docs/Web/CSS/resize)：可调整大小
- [CSS linear-gradient()](https://developer.mozilla.org/zh-CN/docs/Web/CSS/gradient/linear-gradient)：设置渐变
- [CSS transition](https://developer.mozilla.org/zh-CN/docs/Web/CSS/transition)：样式过渡动画设置
- [CSS transform](https://developer.mozilla.org/zh-CN/docs/Web/CSS/transform)：制作简单动画
- [CSS 媒体查询](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/CSS_layout/Media_queries)
- [CSS 关键帧](https://developer.mozilla.org/zh-CN/docs/Web/CSS/@keyframes)

## CSS 知识点

### 浮动

浮动元素会脱离网页文档，与其他元素发生重叠，但是不会与文字内容、图片内容、表单元素发生重叠，用来实现文字环绕效果

若干浮动的元素会按照横向排列

元素只会在父级元素中浮动，但是浮动元素不占据空间，无法撑开父元素。可以通过设置父元素 `overflow: auto`，使得其自动调整大小以适应溢出元素。还可以设置 `clear: left/right/both` 来使得当前元素不受到浮动的影响。

通过清除浮动实现聊天框：

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410103535.png)

浮动元素在排列时，只参考前一个元素的位置

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410103938.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410103730.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410103958.png)

右浮动顺序问题：最先开始浮动的元素会在最右边

### 定位

在子元素设置 `position: aboslute` 进行绝对定位，参考系为最近一个 `position: relative` 的父级元素

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410111711.png)

设置 `positoin: fixed` 进行固定定位，参考系为屏幕。

### 语义化标签

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410113338.png)

### BFC

Formatting context(格式化上下文) 是 W3C CSS2.1 规范中的一个概念。它是页面中的一块渲染区域，并且有一套渲染规则，它决定了其子元素将如何定位，以及和其他元素的关系和相互作用。

BFC 即 Block Formatting Contexts (块级格式化上下文)，具有 BFC 特性的元素可以看作是隔离了的独立容器，容器里面的元素不会在布局上影响到外面的元素，以及一些其他特性。

- [10 分钟理解 BFC 原理](https://zhuanlan.zhihu.com/p/25321647)
- [什么是BFC？看这一篇就够了](https://blog.csdn.net/sinat_36422236/article/details/88763187)
- [面试官：请说说什么是BFC？大白话讲清楚](https://juejin.cn/post/6950082193632788493)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410114123.png)

### 扩展 CSS

- [WebKit CSS extensions](https://developer.mozilla.org/en-US/docs/Web/CSS/Webkit_Extensions)
- [Mozilla CSS extensions](https://developer.mozilla.org/en-US/docs/Web/CSS/Mozilla_Extensions)
- [Microsoft CSS extensions](https://developer.mozilla.org/en-US/docs/Web/CSS/Microsoft_Extensions)

### 伪元素

实际上不存在的一类元素，但是可以在 CSS 中使用选择器选中，并且具有和不同元素一样的属性，可以进行调节、设置。

### CSS 3D 效果

使用 transform 中的 perspective 属性设置观察距离，再进行动画操作。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410122121.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410122140.png)

给父元素添加观察距离，则会以父元素的中心为基准来产生效果。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220410131334.png)

设置 [perspective-origin](https://www.runoob.com/cssref/css3-pr-perspective-origin.html) 来改变观察视角。

### DPR

设备像素比：`物理像素`与`设备独立像素`的比值，使得元素看起来不那么小。

通过设置 `viewport` 来缩放网页，可以消除移动设备上 DPR 的影响。

```html
<meta name="viewport" content="width=device-width, initial-scale=1/dpr">
```

其中的 `1/dpr` 需要改写成具体的数值。

### REM 单位

以根元素（`html` 标签）的 `font-size` 属性为基础，假设其值为 `a`，则 `1 rem = a xp`。

### inline-block

两个相邻 `inline-block` 元素若在代码中换行，则会在中间产生一个空隙。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220411101333.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/20220411101403.png)

### flex 布局

在 flex 容器中 `float` 和 `vertical-align` 属性失效，通过 `justify-content` 来设置主轴（默认为水平方向）上元素的对齐方式，通过 `align-items` 来设置交叉轴（默认为竖直方向）上元素的对齐方式。

可以通过 `flex-direction` 设置主轴方向

通过设置 `flex-wrap` 使得元素可以换行

通过设置 `flex-grow` 使得元素按照指定比例分配父元素剩余空间

## 案例实现

### （一）选中框

#### 1. 效果

<style>
    #checkBoxDiv input[type='checkbox'] {
        -webkit-appearance: none;
        margin: 50px;
        border: 10px solid #c1c1c1;
        border-radius: 50px;
        width: 170px; height: 70px;
        background: #888;
        position: relative;
        box-shadow: 0 0 10px 1px #3f3f3f inset;
        transition: 0.6s;
    }
    #checkBoxDiv input[type='checkbox']:checked {
        background: #6FB500;
    }
    #checkBoxDiv input[type='checkbox']::after {
        content: "";
        display: block;
        width: 60px; height: 60px;
        position: absolute;
        left: -5px; top: -5px;
        border-radius: 30px;
        background: linear-gradient(to bottom, #d3d3d3, #9e9e9e);
        box-shadow: 0px 2px 2px 0px #eee inset, 2px 1px 2px 0px #333;
        transition: 0.6s;
    }
    #checkBoxDiv input[type='checkbox']:checked::after {
        left: 95px;
    }
</style>
<div id="checkBoxDiv">
    <input type="checkbox">
</div>

#### 2. 代码

```html
<style>
    #checkBoxDiv input[type='checkbox'] {
        -webkit-appearance: none;
        margin: 50px;
        border: 10px solid #c1c1c1;
        border-radius: 50px;
        width: 170px; height: 70px;
        background: #888;
        position: relative;
        box-shadow: 0 0 10px 1px #3f3f3f inset;
        transition: 0.6s;
    }
    #checkBoxDiv input[type='checkbox']:checked {
        background: #6FB500;
    }
    #checkBoxDiv input[type='checkbox']::after {
        content: "";
        display: block;
        width: 60px; height: 60px;
        position: absolute;
        left: -5px; top: -5px;
        border-radius: 30px;
        background: linear-gradient(to bottom, #d3d3d3, #9e9e9e);
        box-shadow: 0px 2px 2px 0px #eee inset, 2px 1px 2px 0px #333;
        transition: 0.6s;
    }
    #checkBoxDiv input[type='checkbox']:checked::after {
        left: 95px;
    }
</style>
<div id="checkBoxDiv">
    <input type="checkbox">
</div>
```

### （二）跳动的心

#### 1. 效果

<style>
    #heartDiv span {
        display: inline-block;
    }
    #heartDiv #heart-left, #heart-right {
        width: 50px; height: 80px;
        background-color: red;
        border-top-left-radius: 25px;
        border-top-right-radius: 25px;
    }
    #heartDiv #heart-left {
        transform: rotateZ(-45deg);
    }
    #heartDiv #heart-right {
        transform: translateX(-28px) rotateZ(45deg);
    }
    #heart {
        animation: heartBeats 1.5s infinite;
    }
    @keyframes heartBeats {
        30% { transform: scale(1.3); }
        100% { transform: scale(1); }
    }
</style>
<div id="heartDiv">
    <span id="heart">
        <span id="heart-left"></span><span id="heart-right"></span>
    </span>
</div>

#### 2. 代码

```html
<style>
    #heartDiv span {
        display: inline-block;
    }
    #heartDiv #heart-left, #heart-right {
        width: 50px; height: 80px;
        background-color: red;
        border-top-left-radius: 25px;
        border-top-right-radius: 25px;
    }
    #heartDiv #heart-left {
        transform: rotateZ(-45deg);
    }
    #heartDiv #heart-right {
        transform: translateX(-28px) rotateZ(45deg);
    }
    #heart {
        animation: heartBeats 1.5s infinite;
    }
    @keyframes heartBeats {
        30% { transform: scale(1.3); }
        100% { transform: scale(1); }
    }
</style>
<div id="heartDiv">
    <span id="heart">
        <span id="heart-left"></span><span id="heart-right"></span>
    </span>
</div>
```

#### 3. 问题

当`block`元素中内包含`inline-block`时，进行缩放（`scale`）会使得整体位移。

<style>
    #inner {
        width: 50px;
        height: 50px;
        background-color: black;
        display: inline-block;
    }
    #outer {
        margin: 4px;
        padding: 4px;
        border: 1px dotted black;
        animation: Scale 1.5s infinite;
    }
    @keyframes Scale {
        30% { transform: scale(1.3); }
        100% { transform: scale(1);}
    }
</style>

<div id="outer">
    <div id="inner"></div>
</div>

问题原因：由上述示例可知（外层元素边框被标出），`block`元素宽度默认为一行，故进行缩放会使得整个页面被撑开，使得内部元素相对发生了位移。

```html
<style>
    #inner {
        width: 50px;
        height: 50px;
        background-color: black;
        display: inline-block;
    }
    #outer {
        margin: 4px;
        padding: 4px;
        border: 1px dotted black;
        animation: Scale 1.5s infinite;
    }
    @keyframes Scale {
        30% { transform: scale(1.3); }
        100% { transform: scale(1);}
    }
</style>

<div id="outer">
    <div id="inner"></div>
</div>
```

解决方法：将要进行缩放的 `block` 元素改为 `inline-block`。

<div id="outer" style="display: inline-block;">
    <div id="inner"></div>
</div>

### （三）涟漪效果

#### 1. 效果

<style>
    #rippleDiv {
        margin: 80px;
    }
    .point {
        width: 10px; height: 10px;
        background: #6AD7E9;
        border-radius: 50%;
        position: relative;
    }
    .ripple-base {
        width: 120px; height: 120px;
        border: 2px solid #00cfec;
        border-radius: 50%;
        transform: scale(0.01);
        position: absolute;
        left: -55px;
        top: -55px;
    }
    #ripple1 {
        animation: Ripple 4500ms 225ms infinite;
    }
    #ripple2 {
        animation: Ripple 4500ms 1075ms infinite;
    }
    #ripple3 {
        animation: Ripple 4500ms 1925ms infinite;
    }

    @keyframes Ripple {
        80% { opacity: 0.2; transform: scale(0.7);}
        100% { opacity: 0; transform: scale(1);}
    }
</style>

<div id="rippleDiv">
    <div class="point">
        <div class="ripple-base" id="ripple1"></div>
        <div class="ripple-base" id="ripple2"></div>
        <div class="ripple-base" id="ripple3"></div>
    </div>
</div>

#### 2. 代码

```html
<style>
    #rippleDiv {
        margin: 80px;
    }
    .point {
        width: 10px; height: 10px;
        background: #6AD7E9;
        border-radius: 50%;
        position: relative;
    }
    .ripple-base {
        width: 120px; height: 120px;
        border: 2px solid #00cfec;
        border-radius: 50%;
        transform: scale(0.01);
        position: absolute;
        left: -55px;
        top: -55px;
    }
    #ripple1 {
        animation: Ripple 4500ms 225ms infinite;
    }
    #ripple2 {
        animation: Ripple 4500ms 1075ms infinite;
    }
    #ripple3 {
        animation: Ripple 4500ms 1925ms infinite;
    }

    @keyframes Ripple {
        80% { opacity: 0.2; transform: scale(0.7);}
        100% { opacity: 0; transform: scale(1);}
    }
</style>

<div id="rippleDiv">
    <div class="point">
        <div class="ripple-base" id="ripple1"></div>
        <div class="ripple-base" id="ripple2"></div>
        <div class="ripple-base" id="ripple3"></div>
    </div>
</div>
```
