+++ 
draft = false
date = 2022-03-23T20:46:47+08:00
title = "学习笔记 | C++ 程序设计"
description = ""
slug = ""
authors = ["ccviolett"]
tags = ["大学课程","数学与自然科学类"]
categories = ["学习笔记"]
externalLink = ""
series = []
+++

### 构造函数与析构函数执行顺序

当一个有成员对象的派生类对象时，各构造函数体的执行次序为 (C)。
- (A) 派生类、成员对象类、基类；
- (B) 成员对象类、基类、派生类；
- (C) 基类、成员对象类、派生类；
- (D) 基类、派生类、成员对象类

在新建对象时
- 首先会按照继承顺序（从左到右）执行基类构造函数
- 然后会按照声明顺序（从上到下）执行成员对象类构造函数
- 最后执行当前类的构造函数

成员对象构造函数的调用顺序和`初始化列表`中顺序无关，只和声明顺序有关。

析构函数执行顺序正好相反，先构造后析构，后构造先析构。

```cpp
#include <bits/stdc++.h>

using namespace std;

class A { public: A() { cout << "A"; } ~A() { cout << "a"; } };

class B { public: B() { cout << "B"; } ~B() { cout << "b"; } };

class D { public: D() { cout << "D"; } ~D() { cout << "d"; } };

class E { public: E() { cout << "E"; } ~E() { cout << "e"; } };

class F { public: F() { cout << "F"; } ~F() { cout << "f"; } };

class C : public A, public E {
	D d;
	B b;
	public:
	C(): b(), f(), d() { cout << "C"; }
	~C() { cout << "c"; }
	F f;
};

int main() { 
	C *c = new C();
	delete c;
	return 0; 
}

```

当上述程序运行时，输出的结果为 "AEDBFCcfbdea"

### 强制转换

当浮点数类型强制转换为整数类型时，会直接去除小数位（向下取整）。

### 友元

C++ 允许使用友元，但是友元会破坏封装性，友元不是类的成员函数。

### 缺省构造函数

只有在没有定义任何构造函数时，缺省构造函数才会自动生成。

```cpp
#include <bits/stdc++.h>

using namespace std;

class A { 
	public: 
		A(int a) { cout << "A" << "a"; } 
};

int main() {
	A a(1);
	// A b(); // Error!
	return 0;
}
```

### 内存释放

delete 运算符必须用于 new 返回的指针，适用于空指针。

但是不能对一个指针多次 delete。

删除指针数组时，指针名前只用一对方括号符，不管所删除的数组的维数。

### 虚类&虚函数

带有虚基类的多层派生类构造函数的成员初始化列表中都要列出虚基类的构造函数，这样将来虚基类的子对象初始化一次。

虚函数在其类的派生类中的同原型函数都是虚函数。

### 外部变量

定义外部变量时，不需要使用存储类说明符 `extern`，而声明外部变量时则需要使用它。

### 动态关联

动态关联是在运行时选定调用的成员函数，以虚函数为基础，其调用函数操作是指向对象的指针或对象的引用。

### 内联函数

变量自增自减、条件语句、变量声明可以声明为内联函数，循环不能。

### 模板

C++ 中的模板包括 `函数模板` 和 `类模板`。

### 指针指向的内存

`char *s1 = "hello"` 中， `s1` 指向的是确定的内存单元。

### 常量指针与指针常量

- `const char *p` 是指向常量字符串的指针，可以改变指针，但是不可以改变字符串。
- `char const *p` 同理

```cpp
char c[10] = "hello";
const char *p = c;
// *p = 'b'; // Error!
p++;
```

- `char * const p` 是指向字符串的常量指针

```cpp
char c[10] = "hello";
char * const p = c;
*p = 'b';
// p++; // Error!
```

### 构造函数调用次数

`Sample a[2], *p = new Sample;` 调用构造函数 3 次。

### 构造函数和析构函数的声明

构造函数和析构函数在类内进行定义后，可以在类外进行声明。

```cpp
#include <bits/stdc++.h>

using namespace std;

class A {
	public:
		A();
		~A();
};

A::A() {
	cout << "New" << endl;
}

A::~A() {
	cout << "Delete" << endl;
}

int main() { 
	A *a = new A();
	delete a;
	return 0; 
}
```


### 静态变量

问题：请问下列程序会输出什么？

```cpp
#include <iostream>

using namespace std;

int fun() {
	static int x = 1;
	x *= 2;
	return x;
}

int main() {
	int i, s = 1;
	for (i = 1; i <= 3; ++i)
		s *= fun();
	cout << s << endl;
}

```

答案：64

