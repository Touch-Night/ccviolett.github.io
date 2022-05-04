+++ 
draft = false
date = 2022-05-03T16:40:12+08:00
title = "学习如何写 Chrome 插件"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

## 教程

为了完成[稀土掘金编程挑战赛](https://hackathon2022.juejin.cn/)

首先对插件有个简单的印象 [10分钟入门chrome(谷歌)浏览器插件开发](https://juejin.cn/post/6904797929056239630)，但是完全按照这个来并不能写出一个能运行的插件，因为其并没有配置 `browser_action`。

大概知道插件的概念后，结合 [手把手教你开发chrome扩展](https://www.cnblogs.com/walkingp/archive/2011/03/31/2001628.html) 完成自己的第一个插件。

我们发现上述插件都是在 MV2（Manifest V2) 下开发的，而目前 Google 正在全力推行 MV3，我们可以通过这篇文章[Chrome Manifest V3 - 披着羊皮的狼？](https://zhuanlan.zhihu.com/p/451197423)大概了解一切情况。

选择继续在 MV2 下开发。

通过 [一篇文章教你顺利入门和开发chrome扩展程序（插件）](https://juejin.cn/post/6844903740646899720) 大概理清整个插件的框架，顺便了解各个部分之间的通信。

随后可以通过 [Chrome插件(扩展)开发全攻略](https://www.bookstack.cn/read/chrome-plugin-develop/spilt.1.8bdb1aac68bbdc44.md) 系统了解  Chrome 的插件开发，更推荐的方法是开始写插件然后去查需要的东西。


有了这些基础你应该就能够成功的开发一个自己的插件了。

下面是一些可以遇到的问题：

- 关于如何调试三个部分（`content_scripts.js`、`background.js`、`popup.js`）：[chrome插件开发之调试](https://blog.csdn.net/zzstack/article/details/62226249)
- background 无法与 content_scripts 建立连接可能是页面没刷新或者浏览器没有重启，最大的可能还是 content_scripts 在建立连接前就报错了。

## 总结

这次项目中我学到了以下这些东西：

### javascript heredoc多行字符串

参考资料：[js与多行字符串](https://www.cnblogs.com/yakun/p/3887591.html)

巧妙利用了 function 的 toString 方法，转为字符串后有换行符 `\n`

缺点在于不能使用压缩器与不能插入 js 逻辑

```javascript
function heredoc(fn) {
    return fn.toString().split('\n').slice(1,-1).join('\n') + '\n'
}

var tmpl = heredoc(function(){/*
    !!! 5
    html
      include header
      body
        //if IE 6
            .alert.alert-error
                center 对不起，我们不支持IE6，请升级你的浏览器
                    a(href="http://windows.microsoft.com/zh-CN/internet-explorer/download-ie") | IE8官方下载
                    a(href="https://www.google.com/intl/en/chrome/browser/") | Chrome下载
        include head
        .container
            .row-fluid
                .span8
                    block main
                    include pagerbar
                .span4
                    include sidebar
        include footer
        include script
 */});
```

### CSS 渐变

一个结合贝塞尔曲线的很舒服的渐变设置：

```css
transition: all .3s cubic-bezier(.4, 0, .2, 1);
```

### Hex 转 RGBA

```javascript
function htr(hex, opacity) {
  // Hex to RGBA
  red = parseInt("0x" + hex.slice(1, 3));
  green = parseInt("0x" + hex.slice(3, 5));
  blue = parseInt("0x" + hex.slice(5, 7));
  return red + ", " + green + ", " + blue;
}

function htrof(hex, opacity) {
  // Hex to RGBA with Opacity Full format
  red = parseInt("0x" + hex.slice(1, 3));
  green = parseInt("0x" + hex.slice(3, 5));
  blue = parseInt("0x" + hex.slice(5, 7));
  rgba = "rgba(" + red + "," + green + "," + blue + "," + opacity + ")";
  return rgba;
}
```

### 通过 JS 实现 hover 效果

```
element.onmouseover = function() {
  // set up
  // this.style = ...
}
element.onmouseout = function() {
  // set back
  // this.style = "";
}
```

### `aspect-ratio` 参数

可以设置图片的长宽比

### 一个还在完善的 JS 阴影函数

偷的 `MDUI` 的参数。

```javascript
function Shadow(color, level) {
  let ag;
  if (level == 1) ag = ["0 2px 2px -1px", "0 1px 1px 0", "0 1px 3px 0"];
  if (level == 4) ag = ["0 2px 4px -1px", "0 4px 5px 0", "0 1px 10px 0"];
  if (level == 8) ag = ["0 5px 5px -3px", "0 8px 10px 1px", "0 3px 14px 2px"];
  if (level == 12) ag = ["0 7px 8px -4px", "0 12px 17px 2px", "0 5px 22px 4px"]; 
  if (level == 18) ag = ["0 9px 11px -5px", "0 18px 28px 2px", "0 7px 24px 6px"]; 
  if (level == 24) ag = ["0 11px 15px -7px", "0 24px 38px 3px", "9px 46px 8px"];
  return "box-shadow: " + ag[0] + " rgba(" + color + ",.2)," + ag[1] + " rgba(" + color + ",.14)," + ag[2] + " rgba(" + color + ",.12)!important;";
}
```
