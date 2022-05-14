+++ 
draft = false
date = 2022-04-23T10:30:51+08:00
title = "计算机网络 | Part2 数据链路层(Data Link Layer)"
description = ""
slug = ""
authors = []
tags = ["计算机网络"]
categories = []
externalLink = ""
series = []
+++

{{<toc>}}

## 一、基础概念

数据链路层在物理层提供服务的基础上像网络层提供服务。

其最基本的服务是将源自网络层来的数据可靠地传输到相邻节点地目标机网络层。

其主要作用是加强物理层传输原始比特流的功能，将物理层提供的可能出错的物理连接改造成逻辑上无差错的数据链路，使之对网络层表现为一条无差错的链路。

- 功能一：为网络层提供服务
    - 无确认无连接服务
    - 有确认无连接服务
    - 有确认面向连接服务
- 功能二：链路管理，即连接的建立、维持、释放（用于面向连接的服务）
- 功能三：组帧
- 功能四：流量控制，限制发送方
- 功能五：差错控制（帧错/位错）

### （零）链路层编码

以太网规定，一组电信号构成一个数据包，叫做“帧”(Frame)。

每一帧分成两个部分：标头(Head)和数据(Data)

| 部分 | 内容 | 长度 |
| :-: | :-: | :-: |
| 标头 | 数据包的一些说明项，比如发送者、接收者、数据类型等 | 固定位 18 字节 |
| 数据 | 数据包的具体内容 | 最短为 46 字节，最长为 1500 字节 |

整个帧最短为 64 字节，最长为 1518 字节，如果数据很长就必须分割成多个帧发送。

### （一）MAC 地址

以太网规定，连入网络的所有设备，都必须具有“网卡”接口。

数据包必须是从一块网卡，传送到另一块网卡。

网卡的地址，就是数据包的发送地址和接收地址，这叫做 MAC 地址。

长度为 6 字节，共 48 比特，通常用十六进制表示法，地址的每个字节被表示为一对十六进制数。

每个适配器具有一个唯一的 MAC 地址，不随位置发生变化。当一个公司要生成适配器时，需要支付象征性的费用购买一块 MAC 地址空间，IEEE 分配这块地址时，固定前 24 比特，公司为每个适配器生成后 24 比特的唯一组合。

### （二）ARP 协议

网卡通过 ARP 协议知道另一块网卡的 MAC 地址。

每个节点的 ARP 模块会在它的 RAM 中自动创建 ARP 表，包含 IP 地址到 MAC 地址的映射关系，每个表项还包含 TTL 字段，表示表项过期时间。

ARP 表会定时更新，当某节点与子网断开连接时，会将其从子网的节点的表中删除。

主机向 ARP 模块提供 IP 地址， ARP 模块返回 IP 地址对应的 MAC 地址。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204241115113.png)

### （三）广播

广播(broadcasting)，即发送方通过以太网将数据包向本网络内所有计算机发送，让每台计算机读取数据包的“标头”，将接收方的 MAC 地址与自身的 MAC 地址相比较，判断自身是否为接收方，再进行下一步的处理。

## 二、传输方式

### （一）封装成帧

在数据前后添加首部和尾部，组成一个帧，起到`帧定界`、`帧同步`的作用，使得接收端在收到物理层上交的比特流后，能够识别帧的界限，根据首部和尾部的标记，识别出帧的开始和结束。

### （二）透明传输

不管所传输的数据是什么样的比特组合，都能够在链路上传送。

防止特殊的数据无法正常传输，比如数据中出现与开始/结束标记符恰好重复的情况。

#### 1. 字符计数法

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204241208032.png)

#### 2. 字符填充法

通过添加头部和尾部来标记开始和结束，通过在与标记字符重复的数据流前面添加一段转移字符来解决错误识别的问题。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204241214197.png)

#### 3. 零比特填充法

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204241217016.png)

#### 4. 违规编码法

因为曼彻斯特编码不使用高-高，低-低来表示，所以可以用其来表示帧起始和终止，就不会发生数据冲突。

## 三、差错控制

数据链路层可能会发生比特的错误，我们需要一个方案使得检查出所有错误的可能性最大，使得错误的数据包被尽早发现，减少网络资源的浪费。

### （一）检错编码

#### 1. 奇偶校验码

包含 1 个附加比特：
- 对于偶校验，选择一个值，使得所有比特中 1 出现偶数次。
- 对于奇校验，选择一个值，使得所有比特中 1 出现奇数次。

#### 2. 循环冗余码 CRC

发送方和接收方协商一个 r+1 比特的生成多项式(G)，要求其最高比特位为 1。

发送方通过在 d 比特的数据后附加 r 比特，使得整个 (d+r) 比特的值能够被 G 整除。

接收方用 G 去除 (d+r) 比特，如果不能整除则出现差错

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242006022.png)

### （二）纠错编码-海明码

海明码能且仅能纠 1 位错，其计算过程如下：

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242014750.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242014110.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242014465.png)

第 i 位校验码的值为位置二进制中包含第 i 位的数据值的异或和，纠错时将所有校验码异或起来，得到的值为错误位置（为 0 则无错）

相关链接：[海明码一篇文章彻底搞懂](https://www.cnblogs.com/godoforange/p/12003676.html)

## 四、流量控制与可靠传输

流量控制是为了让传输过程中的发送速度和接受速度匹配，减少传输出错与资源浪费。

可靠传输是发送端发送什么，接收端就要受到什么。

### （零）信道利用率

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242030752.png)

### （一）停止等待协议(Stop-and-Wait)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242027444.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242027299.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242028737.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242028571.png)

#### 信道利用率分析

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242032975.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202204242032616.png)

### （二）后退 N 帧协议(GBN)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132244651.png)

累计确认：就是收到一个确认帧，那么它和它之前的所有帧都默认已收到，反之，如果某个确认帧没收到，那么它和它之后的所有帧都默认丢失（即使收到了也丢掉），进行重传。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132244293.png)

### （三）选择重传协议(SR)

吸取了GBN协议的教训，我们打算尝试只重传错误的帧，这样的话就不用浪费资源把已经收到的帧再重传一次了。

在GBN中，仅有接收端有一个窗口来存放数据帧，在SR中，两者都有窗口了。

和GBN的区别其实就是做了一个数据缓存，已经收到的帧不用扔了，等待之前因意外丢失的帧收到的时候确认即可，但是只能缓存窗口尺寸内的包含的帧（注释：缓存不可能无限大）

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132247550.png)

## 五、介质访问控制技术

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132249178.png)

### （一）信道划分协议

虽然使用一条共享信道，但是通过多技术组合进行传输，提高了信道的利用率

#### 1. 频分多路复用 FDM

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132256968.png)

#### 2. 时分多路复用 TDM

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132257084.png)

#### 3. 统计时分复用 STDM

TDM 的利用率低，所以衍生出了 STDM，其原则是先到先走，满了就发。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132259706.png)

#### 4. 码分多路复用 CDM

每个节点分配一种不同的编码，每个节点使用其唯一的编码来对发送的数据进行编码

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132301554.png)

### （二）随机接入协议

所有用户都可以随机发送信息，发送时可以占用全部宽带，理论上个人使用时比静态分配信道的速度更快。

#### 1. ALOHA 协议

帧到达节点时，立刻传输。如果发生碰撞，节点将立即以概率 p 重传（在完全传输碰撞帧后）。否则，等待一个帧传输时间，再以概率 p 重传。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132310583.png)

信道有效传输速率实际不是 R bps，而是时隙 ALOHA 的一半。

时隙ALOHA协议是指时间被划分为时隙，每个节点的时间同步，帧的传输只在时隙的开始时进行。如果发生碰撞，在下一个时隙开始时以概率p重传，否则等待一个时隙再以概率p重传…（信道有效传输速率实际不是R bps，而是0.37R bps）

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205132313882.png)

#### 2. CSMA 协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141258220.png)

| 名称 | 描述 | 优点 | 缺点 |
| :-: | - | - | - |
| 1-坚持 CSMA | 发送信息时监听信道，如果空闲就立即传输，信道忙也一直监听，如果发送时冲突就等待随机时长之后再监听 | 立即发送，利用率高 | 如果多台设备同时监听，就会发生冲突 |
| 非坚持 CSMA | 发送信息时监听信道，如果空闲就立即传输，信道忙就等待随机时间后再监听 | 冲突发生的几率小 | 因为需要等待，所以利用率不高 |
| p-坚持 CSMA | 发送信息时监听信道，空闲时以概率 p 进行传输，概率 1-p 不传输。信道忙就等待随机时间后再监听 | 冲突减少的同时效率也比较高 | 即使发生冲突也要坚持发送数据，资源被浪费 |

相关资料：[坚持和非坚持型 CSMA](https://zhuanlan.zhihu.com/p/375470338)

#### 3. CSMA/CD 协议

因为链路实际有长短，发送数据需要时间，这个时间内可能就被其他节点当成空闲状态导致发生碰撞。

先监听信道，如果没有其他节点在使用信道则传输数据。但是存在碰撞检测，如果发生碰撞，就会停止传输剩下的数据，等待一个随机事件后在进行尝试。

#### 4. CSMA/CA 协议

CSMA/CD 与 CSMA/CA 的区别

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141351874.png)

### （三）轮询访问与介质访问控制

#### 1. 轮询协议

选出一个主节点，控制所有传输，主节点轮流“邀请”从属节点发送数据。

但是会有三个问题：
1. 轮询开销：随着服务器的节点增多，用于查询是否发送数据的数据帧也会增多，造成一定开销。
2. 等待延迟：节点需要发送数据时需要等待主节点的轮询。
3. 单点故障：主节点故障会导致整个网络瘫痪，从属节点瘫痪会导致等待延迟增加。

#### 2. 令牌传递协议

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141720705.png)

发送数据的流程：
1. 当节点之间没有数据收发需求时，令牌状态为空闲，在节点之间循环
2. 当节点需要发送数据时，获得这个令牌，修改令牌状态为占有
3. 将令牌和数据帧结合，继续在节点之间循环
4. 不是目标节点收到令牌直接略过，目标节点则接受信息复制一份到本地
5. 令牌回到发送节点，检查数据是否出错，出错则重发，不出错则将修改令牌状态为空闲

## 六、局域网

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141725603.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141725788.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141726014.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141729842.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141730731.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141729653.png)

### （一）以太网

以太网提供无连接、不可靠的服务

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141732063.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141732432.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141732817.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141734175.png)

### （二）无线局域网

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141735107.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141735364.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141735886.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141736175.png)

## 七、广域网

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141736915.png)

### （一）PPP 协议（Point-to-Point Protocol）

PPP协议是目前使用最广泛的数据链路层协议，拨号基本都是PPP协议。PPP协议仅支持全双工链路。

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141738324.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141738554.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141738994.png)

### （二）HDLC 协议（High-Level Data Link Control）

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141739269.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141739687.png)

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141740065.png)


## 八、链路层设备

### （一）网桥

使用网桥时，由于网桥会根据mac地址进行过滤，所以不会形成冲突域

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141742562.png)

#### 1. 透明网桥

通过自学习来构建转发表。每一个通过网桥的数据包都会被记录下网桥收到数据时数据对应的地址和网桥自己的接口，通过许许多多的数据包的构造的缓存，网桥就可以知道哪个数据包在哪个接口，以后如果要穿数据包就知道要往哪个接口发送数据包了

#### 2. 原路由网桥

在发送时，直接将最佳路径放到帧首部。那么网桥如何获得最佳路径？通过广播方式想目标地址发送广播，此时可能会经过不同路由产生不同的路径，目标地址收到后再将每一条路径都发一个响应帧给网桥，网桥经过对比就知道哪个接口最快了

### （二）交换机

交换机接收入链路层帧并将它们转发到出链路，其自身对节点透明。

#### 1. 直通式交换机

查完目标地址就立刻转发，延迟小，可靠性低，无法支持具有不同速率的端口的交换。

#### 2. 存储转发式交换机

将帧放入高速缓存，并检查是否正确，正确则转发，错误则丢弃。

延迟大，可靠性高，可以支持具有不同速率的端口的交换。

### （三）冲突域和广播域

![](https://ccviolett-1307804825.cos.ap-shanghai.myqcloud.com/img/202205141747077.png)