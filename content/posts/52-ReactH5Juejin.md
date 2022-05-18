+++ 
draft = false
date = 2022-05-18T15:48:31+08:00
title = "零基础如何用 React 写一个稀土掘金？"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

### 知识

前端入门的定义
- 实现核心功能：能够运用知识实现前端中的核心功能

前端的发展
- Web 1.0: 网站（document）
- Web 2.0: APP（Gmail、WordPress、Jquery）
- Web 3.0: 视图模型（React、Vue、小程序）

两代技术的区别
- Jquery 通过原生 JS 操作 DOM，考虑节点的渲染、操作
- React/Vue/小程序通过 JSX 操作 virtual DOM，不考虑具体的节点如何操作，只考虑改变状态（数据）

两代技术在概念上有了核心的区别，产生了抽象（模型）

PC 端的交互要远复杂于移动端

`状态(State) + 模板(Template) = 视图(View)`

### 组件

作用：
1. 将复杂问题转换为简单问题的集合（分治）
2. 避免重复构建相同的代码（复用）

### 状态

找变化，将可变与不可变的分开。

将变化的东西通过状态表示，实际上不需要使用路由实现，路由其实也只是储存一个状态，将 URL 解析之后复原到组件中。

状态分为两种：
- State 组件内部的状态，维持当前组件的状态
- Props 组件外部的状态，实现一个组件的复用

### 实现

```typescript
function Component(props: {}) {
  // 1. props - 明确外部传递进来的参数 

  // 2. state - 声明内部构造所需要的状态
  const [state, setState] = useState();

  // 3. props / state - 转化
  const finalState = func(state);

  // . 声明周期 - props / state 发生变化
  useEffect(() => {
    // load 数据
  }, []);

  // . 事件处理函数
  const onClick = () => {

  }

  // 4. 模板 - 描述页面的样子
  return {
    <div onClick={onClick}></div>
  };
}
```

### keep-alive

因为组件是写死的，所以只需要缓存状态即可实现页面的 keep-alive。

可以选择全局变量 / localstorage / Redux 储存。
