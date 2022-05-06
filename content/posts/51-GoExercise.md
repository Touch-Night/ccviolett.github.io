+++ 
draft = false
date = 2022-05-06T16:18:24+08:00
title = "Go 语言之旅中的练习"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

go 官方的很好的入门教程：[Go 语言之旅](https://tour.go-zh.org/list)

这里是我做的所有的练习

### 循环与函数

```go
package main

import (
  "fmt"
  "math"
)

func Sqrt(x float64) float64 {
  z := float64(1)
  for i := 1; i <= 10; i++ {
    change := (z * z - x) / (2 * z)
    if math.Abs(change) < 1e-13 {
      break
    }
    z -= change
  }
  return z
}

func main() {
  fmt.Println(Sqrt(2))
  fmt.Println(math.Sqrt(2))
}
```

### 切片

```go
package main

import "golang.org/x/tour/pic"
import "math"

func Pic(dx, dy int) [][]uint8 {
  var img = make([][]uint8, dy)
  for i := 0; i < dy; i++ {
    img[i] = make([]uint8, dx)
    for j := 0; j < dx; j++ {
      img[i][j] = uint8(float64(i) * math.Log(float64(j)))
    }
  }
  return img
}

func main() {
  pic.Show(Pic)
}
```

### 映射

```go
package main 

import (
  "strings"
  "golang.org/x/tour/wc"
)

func WordCount(s string) map[string]int {
  wc := make(map[string]int)
  list := strings.Fields(s)

  for _, v := range list {
    wc[v]++;
  }

  return wc
}

func main() {
  wc.Test(WordCount)
}
```

### 斐波纳契闭包

```go
package main 

import (
  "fmt"
)

func fibonacci() func() int {
  v1, v2 := 0, 1
  return func() int {
    defer func(tv1 int) { v2 = tv1 + v2 }(v1)
    defer func() { v1 = v2 }()
    return v1
  }
}

func main() {
  f := fibonacci()
  for i := 0; i < 10; i++ {
    fmt.Println(f())
  }
}
```

### Stringer

```go
package main

import "fmt"

type IPAddr [4]byte

func (ip IPAddr) String() string {
  return fmt.Sprintf("%v.%v.%v.%v", ip[0], ip[1], ip[2], ip[3])
}

func main() {
	hosts := map[string]IPAddr{
		"loopback":  {127, 0, 0, 1},
		"googleDNS": {8, 8, 8, 8},
	}
	for name, ip := range hosts {
		fmt.Printf("%v: %v\n", name, ip)
	}
}
```

### 错误

```go
package main

import (
  "fmt"
  "math"
)

type ErrNegativeSqrt float64

func (e ErrNegativeSqrt) Error() string {
  v := float64(e)
  return fmt.Sprintf("cannot Sqrt negative number: %v", v)
}

func Sqrt(x float64) (float64, error) {
  if x < 0 {
    return 0, ErrNegativeSqrt(x)
  }
	z := float64(1)
	for i := 1; i <= 10; i++ {
		change := (z * z - x) / (2 * z)
		if math.Abs(change) < 1e-13 {
			break
		}
		z -= change
	}
	return z, nil
}

func main() {
	fmt.Println(Sqrt(2))
	fmt.Println(Sqrt(-2))
}
```

### Reader

```
package main

import "golang.org/x/tour/reader"

type MyReader struct{}

// TODO: 给 MyReader 添加一个 Read([]byte) (int, error) 方法
func (r MyReader) Read(v []byte) (int, error) {
	for i := 0; i < len(v); i++ {
		v[i] = 'A'
	}
	return len(v), nil
}

func main() {
	reader.Validate(MyReader{})
}
```

### 等价二叉查找树

```go
package main

import "golang.org/x/tour/tree"
import "fmt"

// Walk 步进 tree t 将所有的值从 tree 发送到 channel ch。
func Walk(t *tree.Tree, ch chan int) {
	if t.Left != nil {
		Walk(t.Left, ch)
	}
	ch <- t.Value
	if t.Right != nil {
		Walk(t.Right, ch)
	}
}

// Same 检测树 t1 和 t2 是否含有相同的值。
func Same(t1, t2 *tree.Tree) bool {
	ch1 := make(chan int)
	ch2 := make(chan int)
	go func() { 
		Walk(t1, ch1)
		close(ch1) 
	}()
	go func(){
		Walk(t2, ch2)
		close(ch2)
	}()
	for {
		v1, ok1 := <- ch1
		v2, ok2 := <- ch2
		
		if ok1 != ok2 {
			return false
		}
		
		if ok1 == false {
			break
		}
		
		if v1 != v2 {
			return false
		}
	}
	return true
}

func main() {
	fmt.Println(Same(tree.New(1), tree.New(1)))
}
```

### Web 爬虫

```go
package main

import (
	"fmt"
	"sync"
)

type Fetcher interface {
	// Fetch 返回 URL 的 body 内容，并且将在这个页面上找到的 URL 放到一个 slice 中。
	Fetch(url string) (body string, urls []string, err error)
}

type MuxMap struct {
	mux sync.Mutex
	visit map[string]bool
}

var pbmap = MuxMap{visit: make(map[string]bool)}

// Crawl 使用 fetcher 从某个 URL 开始递归的爬取页面，直到达到最大深度。
func Crawl(url string, depth int, fetcher Fetcher) {
	// TODO: 并行的抓取 URL。
	// TODO: 不重复抓取页面。
        // 下面并没有实现上面两种情况：
	if depth <= 0 {
		return
	}
	body, urls, err := fetcher.Fetch(url)
	if err != nil {
		fmt.Println(err)
		return
	}
	pbmap.mux.Lock()
	pbmap.visit[url] = true
	pbmap.mux.Unlock()
	fmt.Printf("found: %s %q\n", url, body)
	
	for _, u := range urls {
		pbmap.mux.Lock()
		able := pbmap.visit[u]
		pbmap.mux.Unlock()
		if able {
			continue
		}
		Crawl(u, depth-1, fetcher)
	}
	return
}

func main() {
	Crawl("https://golang.org/", 4, fetcher)
}

// fakeFetcher 是返回若干结果的 Fetcher。
type fakeFetcher map[string]*fakeResult

type fakeResult struct {
	body string
	urls []string
}

func (f fakeFetcher) Fetch(url string) (string, []string, error) {
	if res, ok := f[url]; ok {
		return res.body, res.urls, nil
	}
	return "", nil, fmt.Errorf("not found: %s", url)
}

// fetcher 是填充后的 fakeFetcher。
var fetcher = fakeFetcher{
	"https://golang.org/": &fakeResult{
		"The Go Programming Language",
		[]string{
			"https://golang.org/pkg/",
			"https://golang.org/cmd/",
		},
	},
	"https://golang.org/pkg/": &fakeResult{
		"Packages",
		[]string{
			"https://golang.org/",
			"https://golang.org/cmd/",
			"https://golang.org/pkg/fmt/",
			"https://golang.org/pkg/os/",
		},
	},
	"https://golang.org/pkg/fmt/": &fakeResult{
		"Package fmt",
		[]string{
			"https://golang.org/",
			"https://golang.org/pkg/",
		},
	},
	"https://golang.org/pkg/os/": &fakeResult{
		"Package os",
		[]string{
			"https://golang.org/",
			"https://golang.org/pkg/",
		},
	},
}
```
