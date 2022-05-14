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

### 实参的数量

函数调用 `func((exp1, exp2), (exp3, exp4, exp5))` 中所含 2 个实参。

### 抽象类

抽象类是包含纯虚函数的类，即包含 `virtual void Func(void) = 0;`。

### 多继承与二义性

一个派生类的两个基类中都有某个同名成员，在派生类中对这个成员的访问可能出现二义性。

解决二义性的最常用的方法是对成员名的限定。

一个派生类是从两个基类派生来的，而这两个基类又有一个共同的基类，对该基类成员进行访问时，可能出现二义性。

### 静态成员

静态成员在创建对象前就存在，是类的成员。

静态成员函数不能是静态函数，不能直接访问非静态成员。

访问共有静态成员的方式有以下三种：
- 类名::静态成员名
- 对象名.静态成员名
- 对象指针->静态成员名

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

### 值与地址

`int x = 56; int r = x;`，若 `cout << &x` 输出 `0012FF7A`，则 `cout << &r` 输出（）
- A. 56
- B. 0012FF7A
- C. 0012FF7B
- D. 未知

答案：D

变量 r 的值和 x 相同，但是其地址不同，我们并不知道。

### 常成员函数

`void Func(void) const;`

下列程序的输出结果为 `P0-C16-`

```cpp
#include <bits/stdc++.h>

using namespace std;

class A {
	public:
		A(int i = 0):r1(i) { }
		void print() { cout << 'E' << r1 << '-'; }
		void print() const { cout << 'C' << r1 * r1 << '-'; }
		void print(int x) { cout << 'P' << r1 * r1 * r1 << '-'; }
	private:
		int r1;
};

int main() {
	A a1;
	const A a2(4);
	a1.print(2);
	a2.print();
	return 0;
}
```

### 向上转型

在对象指针或引用转换过程中，存在静态绑定和动态绑定，转换时非虚函数通常都是以静态绑定进行的，而虚函数是以动态绑定进行的。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141034939.png)

下列代码输出的结果为 `BDBDBDBB`

```cpp
#include <bits/stdc++.h>

using namespace std;

// 基类
class Base {
	public:
		void show() { cout << "B"; }
		virtual void display() { cout << "B"; }
};

// 派生类
class Down : public Base {
	public:
		void show() { cout << "D"; }
		void display() { cout << "D"; }
};

// 指针
void func1(Base *v) { v->show(); v->display(); }
// 引用
void func2(Base &v) { v.show(); v.display(); }
// 对象
void func3(Base v) { v.show(); v.display(); }

int main() {
	// 指针向上转型
	Base *a = new Down;
	func1(a);

	Down *b = new Down;
	// 指针向上转型
	func1(b);

	Down c;
	// 引用向上转型
	func2(c);

	Down d;
	// 对象向上转型
	func3(d);
	return 0;
}
```

### 静态元素的访问

```cpp
class Z {
	static int a;
	public:
		static void fStatic();
};
int Z::a = 0;
Z objZ;
```

则以下三种方式访问静态元素都是可以的：
- `void Z::fState() { objZ.a = 1; }`
- `void Z::fState() { a = 1; }`
- `void Z::fState() { Z::a = 1; }`

而使用 `this` 指针则不行：`void Z::fState() { this->a = 0; }`

### 具有类型转换功能的构造函数

```cpp
class Num {
	public:
		int v;
		Num(int tv) {
			v = tv;
		}
};
```

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

虚基类的目的是消除由多继承产生的二义性。

带有虚基类的多层派生类构造函数的成员初始化列表中都要列出虚基类的构造函数，这样将来虚基类的子对象初始化一次。

构造派生类对象时，虚基类的构造函数只被调用一次。

虚函数在其类的派生类中的同原型函数都是虚函数。

构造函数不能什么为虚函数。

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