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

## 知识点

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

## 案例实现

### 选中框

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