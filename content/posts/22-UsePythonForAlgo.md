+++ 
draft = false
date = 2022-03-16T23:04:04+08:00
title = "如何用 Python 做算法题？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

“衣冠重整旧家风。道是无穹却有功。扫却当途荆棘刺。三人约议再和同。”

### 输入

```python
def readline():
    return [int(_) for _ in input.strip().split(" ")]
def read():
    return int(input())
```

### 遍历字符串

```python
for i in range(len(s)):
    print(s[i])
```

### 数组末尾追加元素

```python
have.append(v)
```

### 

### 不换行输出

在 `print()` 函数中加上 `end=""` 参数来指定末尾字符串。

### 列表生成法创建二维数组

```python
test = [[0 for j in range(m)] for i in range(n)]
```

创建了一个 n 行 m 列的二位数组

### 创建函数

```python
def functionname( parameters ):
   "函数_文档字符串"
   function_suite
   return [expression]
```

因为 Python 为解释型语言，所以在函数未实际被调用之前，即为从入口执行时，函数之间怎么调用都可以。

因此，最好的方法是把程序的入口都放在代码最下方。

### 在函数内修改全局变量

在修改前用关键字 `global` 声明为全局变量，否则就会新建局部变量。

```python
def func():
    global n, m
    ...
```

若不存在同名局部变量，则读取无需声明全局变量。

### 条件语句

```python
if [exp]:
    ...
else:
    ...
```

### 向上取整

```python
import math
v = math.ceil(3.5)
```

### 随机数

```python
import random
v = random.random() # 0~1
v = random.randint(a, b) # a~b
random.shuffle([1, 3, 5, 7, 9]) # 打乱数组
```

### 类

```python
#类定义
class people:
    #定义基本属性
    name = ''
    age = 0
    #定义私有属性,私有属性在类外部无法直接进行访问
    __weight = 0
    #定义构造方法
    def __init__(self,n,a,w):
        self.name = n
        self.age = a
        self.__weight = w
    def speak(self):
        print("%s 说: 我 %d 岁。" %(self.name,self.age))
 
# 实例化类
p = people('runoob',10,30)
p.speak()
```

### range

循环时 `for i in range(a, b)` 可以让 `i` 按顺序取到 `[a, b - 1]`

### 大小比较

在进行变量数值比较时，一定要记得转为 `int` 类型后再比较，否则可能出现类似于 `"400" < "80"` 为真的情况。

### 浅拷贝与深拷贝

数组之间存在浅拷贝与深拷贝的区别

## 相关链接

- [python处理ini格式文件](https://blog.csdn.net/suic009/article/details/120540919)
- [python 解析csv文件](https://www.jianshu.com/p/5ded6c329df2)
- [Python 字符串 split() 方法](https://www.w3school.com.cn/python/ref_string_split.asp)
- [Python 获取数组（列表）长度](https://blog.csdn.net/Dontla/article/details/100637384)
- [Python创建二维数组的正确姿势](https://zhuanlan.zhihu.com/p/88197389)
- [python 随机数](https://blog.csdn.net/to_utopia/article/details/6662086)
- [【python】详解queue队列（一）](https://blog.csdn.net/brucewong0516/article/details/84025027)
- [Python 列表(List)](https://www.runoob.com/python/python-lists.html)
- [Python 列表 sort() 方法](https://www.w3school.com.cn/python/ref_list_sort.asp)

- [蓝桥杯python组 国赛一等奖 经验贴](https://zhuanlan.zhihu.com/p/376499519)