+++ 
draft = false
date = 2022-03-01T19:20:44+08:00
title = "Git 进阶使用技巧：从上手到熟练"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

### git pull 时提示需要 merge

1. 将本地文件暂存 `git stash` 
2. 查看暂存的版本号 `git stash list`，`stash@{XXX}` 即为版本号
3. 拉取远程仓库 `git pull`
4. 还原暂存 `git stash pop stash@{XXX}`，会提示冲突的部分如下

```git
Auto-merging XXX
CONFLICT (content): Merge conflict in XXX
```

5. 处理文件 `XXX` 中冲突的部分，会有 `Updated upstream` 和 `Stashed changes` 两部分，处理好冲突之后删除标识。
6. 删除最新暂存 `git stash drop`
