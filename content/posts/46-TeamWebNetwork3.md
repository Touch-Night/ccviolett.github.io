+++ 
draft = false
date = 2022-04-23T10:31:01+08:00
title = "计算机网络 | Part3 网络层(Network Layer)"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

{{<toc>}}

## 一、概述

MAC 地址作为设备的唯一的身份编址，技术上可以实现任意设备之间的通信，但是以太网采用广播方式发送数据包，效率低，且要求两台计算机在同一子网络中。

因此我们通过“网络层”引入一套新的地址，来区分哪些 MAC 地址属于同一个子网络。

于是每台设备便有了两个独立的地址，一个是绑定在网卡上不变的 MAC 地址，一个是由管理员分配可变的网络地址。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151153985.png)

## 二、数据交换方式

通过交换设备互联进行数据交换，而不是节点之间互联，以减少成本。

### （一）电路交换

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151155337.png)

### （二）报文交换

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151155443.png)

### （三）分组交换

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151155127.png)

#### 数据报方式与虚电路方式

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151157616.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151157114.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151158298.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151158210.png)

## 三、路由算法和路由协议

路由通过路由算法知道收到报文后下一步该怎么走。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151200854.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151201652.png)

### （一） RIP 协议和距离向量算法

#### 1. RIP 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151204980.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151204867.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151204240.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151204899.png)

#### 2. 距离向量算法

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151205921.png)

### （二）OSPF 协议和链路状态算法

#### 1. OSPF 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151207997.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151207556.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151207931.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151207381.png)

#### 2. 链路状态算法

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151207691.png)

### （三）BGP 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151209942.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151209313.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151209447.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151210416.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151210406.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151210020.png)

### （四）三种路由协议的比较

RIP 是一种分布式的基于距离向量的内部网关路由选择协议，通过广播 UDP 报文来交换路由信息。

OSPF 是一个内部网关协议，要交换的信息量较大，应使报文的长度尽量短，所以不适用传输层协议（如 UDP 或 TCP），而是直接使用 IP。

BGP 是一个外部网关协议，在不同的自治系统之间交换路由信息。由于网络环境复杂，需要保证可靠传输，所以采用 TCP。

| 协议 | 类型 | 路由算法 | 传递协议 | 路径选择 | 交换节点 | 交换内容 | 
| :-: | :-: | :-: | :-: | :-: | :-: | --- |
| RIP | 内部 | 距离-向量 | UDP | 跳数最少 | 和本节点相邻的路由器 | 当前路由器知道的全部信息 |
| OSPF | 内部 | 链路状态 | IP | 代价最低 | 网络中的所有路由器 | 与本路由器相邻的所有路由器的链路状态 |
| BGP | 外部 | 路径-向量 | TCP | 较好，非最佳 | 和本节点相邻的路由器 | 首次交换整个路由表，随后交换有变化的部分 |

## 四、IP 数据报

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151535098.png)

## 五、IP

### （一）ipv4 地址

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151543175.png)

#### 特殊 IP 地址

| 网络号 | 主机号 | 作为 IP 分组源地址 | 作为 IP 分组目的地址 | 用途 |
| :-: | :-: | :-: | :-: | :-: |
| 全 0 | 全 0 | 可以 | 不可以 | 本网范围内表示主机，路由表中用于表示默认路由 |
| 全 0 | 特定值 | 不可以 | 可以 | 表示本网内某个特定主机 |
| 全 1 | 全 1 | 不可以 | 可以 | 本网广播地址（路由器不转发） |
| 特定值 | 全 0 | 不可以 | 不可以 | 网络地址，表示一个网络 |
| 特定值 | 全 1 | 不可以 | 可以 | 直接广播地址，对特定网络上的所有主机进行广播 |
| 127 | 任何数（非全0/1） | 用于本地软件环回测试，成为环回地址 |

#### 私有 IP 地址

| 地址类型 | 地址范围 | 网段个数 |
| :-: | :-: | :-: |
| A 类 | 10.0.0.0 ~ 10.255.255.255 | 1 |
| B 类 | 172.16.0.0 ~ 172.31.255.255 | 16 | 
| C 类 | 192.168.0.0 ~ 192.168.255.255 | 256 |

### （二）网络地址转接 NAT

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151606252.png)

### （三）子网划分和子网掩码

#### 1. 子网划分

分类的 IP 地址又两个很大的缺点：
1. IP 地址空间的利用率很低
2. 两级 IP 地址不够灵活

可以将 `网络号+主机号` 的两级 IP 地址扩展为 `网络号+子网号+主机号` 的三级 IP 地址。

子网划分对外界透明。

#### 2. 子网掩码

子网掩码用来和 IP 地址做与运算，来得到子网的地址。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151612084.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151612684.png)

### （四）无分类编制 CIDR

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151613001.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151614027.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151615953.png)

### （五）DHCP 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151617192.png)

### （六）ICMP 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151640597.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151640969.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151640312.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151640239.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151640290.png)

## 六、IPV6

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151643904.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151643157.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151643409.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151643420.png)

## 七、IP 组播（多播）

当网络中的某些用户需要特定数据时，组播数据发送者仅发送一次数据，借助组播路由协议为组播数据包建立组播分发树，被传递的数据达到距离用户端尽可能近的节点后才开始复制和分发，是一种点对多点的方式。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151646331.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151646589.png)

### （一）IGMP 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151647128.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151647940.png)

### （二）路由选择协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151648830.png)

通常使用以下三种算法：
- 基于链路状态的路由选择
- 基于距离-向量的路由选择
- 协议无关的组播（稀疏/密集）

## 八、移动 IP

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151650226.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151650874.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151659816.png)

## 九、网络层设备

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151657939.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151658287.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151658176.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151659963.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205151705992.png)