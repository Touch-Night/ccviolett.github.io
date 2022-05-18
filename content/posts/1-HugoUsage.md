+++ 
draft = false
date = 2022-01-17T11:24:56+08:00
title = "Hugo 的使用&配置中有那些技巧与坑？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = ["Hugo", "博客"]
categories = []
externalLink = ""
series = []
+++

{{< toc >}}

### 零、安装

这里以 Windows 下安装为例。

直接在 [Release 页面](https://github.com/gohugoio/hugo/releases) 下载对应平台压缩包，解压后将路径添加到系统 PATH 中，或者直接将 `hugo.exe` 扔进 `C:\Windows\System` 中。

### 一、使用

新建网站：`hugo new site myblog`

新建文章：`hugo new posts/xxxx.md`

本地服务器预览：`hugo server`，随后可以通过访问本地端口预览。

生成静态文件：`hugo`，随后可在 `public` 文件夹中得到渲染好的静态文件。

### 二、配置

下载主题 [Coder](https://github.com/luizdepra/hugo-coder/releases)，将其以文件夹形式解压至 `themes` 文件夹下，并复命名为 `hugo-coder`，随后将其中 `exampleSite` 文件夹下的文件复制到博客文件夹下。

#### 代码高亮配置

官方文档：[Syntax Highlighting](https://gohugo.io/content-management/syntax-highlighting/)

Hugo 中集成了 [Chroma](https://github.com/alecthomas/chroma) 来进行代码高亮。

TLDR：将下列设置复制到配置文件中（以 TOML 为例）

```toml
[markup]
  [markup.highlight]
    anchorLineNos = false
    codeFences = true
    guessSyntax = false
    hl_Lines = ''
    lineAnchors = ''
    lineNoStart = 1
    lineNos = false
    lineNumbersInTable = true
    noClasses = true
    noHl = false
    style = 'algol'
    tabWidth = 4
```

### 三、踩坑

#### 1. 国内无法使用 Built-in Shortcode 导致的 Hugo 超时

找到 `content` 目录下所有的和 Youtube、Twitter、Instagram 有关的内容，删干净就行了。

比如 `content/posts/rich-content.md` 中的 Shortcode 介绍，如果保留的话，由于国内网络问题，`hugo server` 命令会超时随后报错。

#### 2. 主题配置文件默认开启了 CSP 导致的外部文件无法引用

有些主题 exampleSite 中的配置文件，会默认开启 Content-Security-Policy(CSP)，以保证网站开发的安全和规范，但是在这种规范下，未加入 `stylesrc`、`scriptsrc` 的文件就会出现无法引用的情况。

解决方式有两种，推荐是将需要引用的外部文件的域名加入配置文件的 `sytlesrc` 和 `scriptsrc` 中，如若该过程比较麻烦（比如需要引用大量外部文件），则可以直接将配置文件中的 `[params.csp]` 部分全部注释或删除。

补充：在后续内容创作过程中，可能还会出现引用外部图片出错的情况，大概率也是因为这里 CSP 设置的原因。尽量推荐还是不要去关闭 CSP，而是在需要添加来源时，根据浏览器的报错信息，在 `config.toml` 中搜索对应的 `src` 添加即可。

补充：在 `src` 的添加中，可以使用通配符来简化大量外部文件或复杂地址的引入。

### 四、技巧

#### 1. 聚合文章&使用模板

其实 hugo 在新建文章时，不一定要 `hugo new posts/xxxx.md`。

可以 `hugo new xxxx.md`，这样会在 `content` 目录下新建文件 `xxxx.md`，网站中可以通过 `/xxxx` 来访问。

还可以 `hugo new <name>/xxxx.md`，这样会在 `content` 目录下的 `<name>` 目录下新建文件 `xxxx.md`（若文件夹 `<name>` 不存在则会自动新建），网站中可以通过 `/<name>/xxxx` 来访问。此时，在网站中访问 `/<name>` 即可显示目录下所有文章的列表，实现文章聚合。

对于每一个 `<name>` 的聚合，我们可以在网站目录下的 `archetypes` 目录中，新建一个 `<name>.md` 文件，则可创建该类聚合的模板，后续的每一次 `hugo new <name>/xxxx.md` 都会以 `<name>.md` 为模板。
