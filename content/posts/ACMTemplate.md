+++ 
draft = false
date = 2022-07-09T11:30:03+08:00
title = "我的 ACM 模板"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

## 大杂烩

包含

- ST表
- 树状数组
- 线段树
- LCT
- 按秩压缩并查集
- 路径压缩并查集
- Dijsktra 单源最短路
- Kruskal 最小生成树
- Tarjan 缩点
- 点分治
- 树链剖分
- 平衡树
- 可持久化数组
- 可持久化线段树
- 线性基
- 矩阵
- 字符串哈希
- Manacher
- KMP


```cpp
typedef int readtype;

/* Header {{{ */
#include <bits/stdc++.h>
using namespace std;

template<typename type> type beMin(type &a, type b) { return a = (a < b ? a : b); }
template<typename type> type beMax(type &a, type b) { return a = (a > b ? a : b); }

typedef long long var;
typedef long double let;

readtype read() {
  readtype a = 0, c = getchar(), s = 0;
  while (!isdigit(c)) s |= c == '-', c = getchar();
  while (isdigit(c)) a = a * 10 + c - 48, c = getchar();
  return s ? -a : a;
}

#ifdef LOCAL_LOGGER
#define logger(...) fprintf(stderr, __VA_ARGS__)
#define abortif(v, ...) if (v) {logger("Error in Line %d, Function '%s()'.\nInfo: ", __LINE__, __FUNCTION__); logger(__VA_ARGS__); exit(0);}
#else
#define logger(...);
#define abortif(v, ...);
#endif
/* }}} */

const int N = 11000007;
const int M = 110005;
const int SIZE = 100;
const int MOD = 1e9 + 7;
const int INF = 0x3f3f3f3f;

struct Line {
  int id, u, v, w;
  bool operator<(const Line t) const { return w > t.w; }
};

namespace BasisDataStructure {
  // {{{
  template <class tp> struct STable { // P3865
    // {{{
    tp val[N][21];
    tp (*camp)(tp, tp);
    void build(int n, int *v) {
      for (int i = 1; i <= n; ++i) val[i][0] = v[i];
      for (int i = 1; i <= 20; ++i) {
        for (int j = 1; j + (1 << i) - 1 <= n; ++j)
          val[j][i] = camp(val[j][i - 1], val[j + (1 << (i - 1))][i - 1]);
      }
    }
    tp query(int l, int r) {
      int x = log(r - l + 1) / log(2);
      return camp(val[l][x], val[r - (1 << x) + 1][x]);
    }
    // }}}
  };

  template <class tp> struct TreeArray { // P3374 P3368
    // {{{
    tp tree[N];
    void modify(int n, int t, int v) {
      for (int i = t; i <= n; i += i & -i) 
        tree[i] += v;
    }
    tp query(int t) {
      tp res = 0;
      for (int i = t; i; i -= i & -i)
        res += tree[i];
      return res;
    }
    /// }}}
  };

  struct SegmentTree { // P3372 P3373
    // {{{
    public:
    var MOD;

    void build(int n, int *v) { build(v, 1, n, 1); }
    void modifyAdd(int n, int l, int r, int v) { modify(l, r, v, 1, 1, n, 1); }
    void modifyMul(int n, int l, int r, int v) { modify(l, r, 0, v, 1, n, 1); }
    var query(int n, int l, int r) { return query(l, r, 1, n, 1); }

    private:
    var tree[N << 2], addtag[N << 2], multag[N << 2];
    var mod(var t) { return MOD ? t % MOD : t; }
    void build(int *v, int l, int r, int t) {
      int mid = (l + r) >> 1;
      multag[t] = 1;
      if (l == r) {
        tree[t] = v[mid];
        return ;
      }
      build(v, l, mid, t << 1), build(v, mid + 1, r, t << 1 | 1);
      tree[t] = mod(tree[t << 1] + tree[t << 1 | 1]);
    }
    void optAdd(int t, int l, int r, var v) {
      addtag[t] = mod(addtag[t] + v), tree[t] = mod(tree[t] + mod((r - l + 1) * v));
    }
    void optMul(int t, var v) {
      addtag[t] = mod(addtag[t] * v);
      multag[t] = mod(multag[t] * v);
      tree[t] = mod(tree[t] * v);
    }
    void pushdown(int t, int l, int r) {
      if (multag[t] - 1) {
        optMul(t << 1, multag[t]), optMul(t << 1 | 1, multag[t]);
        multag[t] = 1;
      }
      if (addtag[t]) {
        int mid = (l + r) >> 1;
        optAdd(t << 1, l, mid, addtag[t]), optAdd(t << 1 | 1, mid + 1, r, addtag[t]);
        addtag[t] = 0;
      }
    }
    void modify(int x, int y, int addVal, int mulVal, int l, int r, int t) {
      if (x > r || y < l) return ;
      int mid = (l + r) >> 1;
      if (x <= l && r <= y) {
        optMul(t, mulVal), optAdd(t, l, r, addVal);
        return ;
      }
      pushdown(t, l, r);
      modify(x, y, addVal, mulVal, l, mid, t << 1);
      modify(x, y, addVal, mulVal, mid + 1, r, t << 1 | 1);
      tree[t] = mod(tree[t << 1] + tree[t << 1 | 1]);
    }
    var query(int x, int y, int l, int r, int t) {
      if (x > r || y < l) return 0;
      int mid = (l + r) >> 1;
      if (x <= l && r <= y) return tree[t];
      pushdown(t, l, r);
      return mod(query(x, y, l, mid, t << 1) + query(x, y, mid + 1, r, t << 1 | 1));
    }
    // }}}
  };

  struct LinkCutTree { // P3690
    // {{{
    int tree[N], val[N], son[N][2], fa[N], size[N], revtag[N];
    int cnt, sta[N];
    bool nroot(int t) { return t == son[fa[t]][0] || t == son[fa[t]][1]; }
    bool isson(int t) { return t == son[fa[t]][1]; }
    void optRev(int t) {
      revtag[t] ^= 1;
      swap(son[t][0], son[t][1]);
    }
    void pushdown(int t) {
      if (revtag[t]) {
        optRev(son[t][0]), optRev(son[t][1]);
        revtag[t] = 0;
      }
    }
    void update(int t) {
      tree[t] = tree[son[t][0]] ^ tree[son[t][1]] ^ val[t];
    }
    void rotate(int t) {
      int f = fa[t], g = fa[f], tis = isson(t), fis = isson(f);
      if (nroot(f)) son[g][fis] = t;
      fa[t] = g;
      fa[son[t][tis ^ 1]] = f, son[f][tis] = son[t][tis ^ 1];
      fa[f] = t, son[t][tis ^ 1] = f;
      update(f), update(t);
    }
    void splay(int t) {
      int x = t;
      sta[cnt = 1] = x;
      while (nroot(x)) 
        x = fa[x], sta[++cnt] = x;
      while (cnt) pushdown(sta[cnt--]);
      while (nroot(t)) {
        int f = fa[t];
        if (!nroot(f)) rotate(t);
        else if (isson(t) == isson(f)) rotate(f), rotate(t);
        else rotate(t), rotate(t);
      }
      update(t);
    }
    void access(int t) {
      for (int i = 0; t; i = t, t = fa[t])
        splay(t), son[t][1] = i, update(t);
    }
    void makeroot(int t) {
      access(t), splay(t), optRev(t);
    }
    int findroot(int t) {
      access(t), splay(t);
      while (son[t][0]) 
        pushdown(t), t = son[t][0];
      splay(t);
      return t;
    }
    void split(int x, int y) {
      makeroot(y), access(x), splay(x);
    }
    void link(int x, int y) {
      makeroot(x);
      if (findroot(y) != x) 
        fa[x] = y;
    }
    void cut(int x, int y) {
      split(x, y);
      if (son[x][0] == y && !son[y][1]) 
        son[x][0] = 0, fa[y] = 0;
    }
    // }}}
  };
  // }}}
};

namespace DisjointSetUnion { 
// {{{
struct Union { // P3367
  // {{{
  int fa[N], dist[N];
  Union() {
    memset(fa, 0, sizeof(fa));
    memset(dist, 0, sizeof(dist));
  }
  void init(int n) {
    for (int i = 1; i <= n; ++i) fa[i] = i, dist[i] = 1;
  }
  void merge(int u, int v) {
    u = find(u), v = find(v);
    if (u == v) return ;
    if (dist[u] > dist[v]) swap(u, v);
    dist[v] = max(dist[v], dist[u] + 1);
    fa[u] = v;
  }
  int find(int t) {
    if (fa[t] != t) return find(fa[t]);
    return t;
  }
  // }}}
};
struct MergePathUnion { // P3367
  // {{{
  int fa[N];
  MergePathUnion() {
    memset(fa, 0, sizeof(fa));
  }
  void init(int n) {
    for (int i = 1; i <= n; ++i) fa[i] = i;
  }
  void merge(int u, int v) {
    u = find(u), v = find(v);
    if (u == v) return ;
    fa[u] = v;
  }
  bool check(int u, int v) {
    return find(u) == find(v); 
  }
  int find(int t) {
    if (fa[t] != t) fa[t] = find(fa[t]);
    return fa[t];
  }
  // }}}
};
// }}}
};

namespace Graph {
  // {{{
  int top, fi[N], ne[M], to[M], co[M], inNum[N], outNum[N];
  void add(int u, int v, int w = 0) {
    ne[++top] = fi[u], fi[u] = top, to[top] = v, co[top] = w, outNum[u]++, inNum[v]++;
  }
  void clean() {
    top = 0;
    memset(fi, 0, sizeof(fi));
    memset(inNum, 0, sizeof(inNum));
    memset(outNum, 0, sizeof(outNum));
  }
  namespace Dijsktra { // P4779
    // {{{
    struct Node {
      int to, val;
      bool operator<(const Node t) const { return val > t.val; };
    };
    bool in[N];
    priority_queue<Node> q;

    template <class tp> void getDist(tp *dist, int s) {
      q.push((Node) {s, 0});
      while (!q.empty()) {
        int f = q.top().to;
        q.pop();
        in[f] = false;
        for (int i = fi[f]; i; i = ne[i]) {
          if (dist[to[i]] <= dist[f] + co[i]) continue;
          dist[to[i]] = dist[f] + co[i];
          if (in[to[i]]) continue;
          in[to[i]] = true;
          q.push((Node) {to[i], dist[to[i]]});
        }
      }
    }
    // }}}
  };
  namespace MinimumSpanningTree {
    namespace Kruskal { // P3366
      // {{{
      DisjointSetUnion::MergePathUnion s;
      vector<Line> getMST(int n, vector<Line> line) {
        vector<Line> res;
        s.init(n);
        sort(line.begin(), line.end());
        for (int i = line.size() - 1; i >= 0; --i) {
          Line t = line.at(i);
          if (s.check(t.u, t.v)) continue;
          s.merge(t.u, t.v);
          res.push_back(t);
        }
        return res;
      }
      // }}}
    }
  };
  namespace Tarjan {
    int T, dfn[N], low[N];
    int cnt, sta[N];
    bool insta[N];
    int tot, root[N], col[N];

    void Shrinkage(int t) { // P3387
      // {{{
      dfn[t] = low[t] = ++T;
      sta[++cnt] = t;
      insta[t] = true;
      for (int i = fi[t]; i; i = ne[i]) {
        if (!dfn[to[i]]) Shrinkage(to[i]), low[t] = min(low[t], low[to[i]]);
        else if (insta[to[i]]) low[t] = min(low[t], low[to[i]]);
      }
      if (dfn[t] == low[t]) {
        root[++tot] = t;
        while (sta[cnt + 1] != t) {
          int x = sta[cnt--];
          insta[x] = false;
          col[x] = tot;
        }
      }
      // }}}
    }
  };
  // }}}
};

namespace DivideAndConquer {
  namespace Node {
    using namespace Graph;
    int root, minsize;
    bool mark[N];
    int size[N], dist[4];
    void getSize(int t, int fa = 0) {
      size[t] = 1;
      for (int i = fi[t]; i; i = ne[i]) {
        if (to[i] == fa || mark[to[i]]) continue;
        getSize(to[i], t);
        size[t] += size[to[i]];
      }
    }
    void getRoot(int rt, int t, int fa = 0) {
      int tsize = size[rt] - size[t];
      for (int i = fi[t]; i; i = ne[i]) {
        if (to[i] == fa || mark[to[i]]) continue;
        getRoot(rt, to[i], t);
        tsize = max(tsize, size[to[i]]);
      }
      if (tsize < minsize) minsize = tsize, root = t;
    }
    void getDist(int t, int s = 0, int fa = 0) {
      dist[s % 3]++;
      for (int i = fi[t]; i; i = ne[i]) {
        if (to[i] == fa || mark[to[i]]) continue;
        getDist(to[i], s + co[i], t);
      }
    }
    int getAns(int t, int s = 0) {
      dist[0] = dist[1] = dist[2] = 0;
      getDist(t, s);
      return 2 * dist[1] * dist[2] + dist[0] * (dist[0] - 1);
    }
    int DFS(int t) {
      getSize(t);
      minsize = INF;
      getRoot(t, t);
      mark[root] = true;
      int res = getAns(root);
      for (int i = fi[root]; i; i = ne[i]) {
        if (mark[to[i]]) continue;
        res -= getAns(to[i], co[i]);
        res += DFS(to[i]);
      }
      return res;
    }
  }
};

namespace TreeChainPartition {
  namespace Heavy {
    using namespace Graph;
    BasisDataStructure::SegmentTree tree;
    int size[N], fa[N], deep[N], maxson[N];
    int T, dfn[N], val[N], linetop[N];
    void getInfo(int t) {
      deep[t] = deep[fa[t]] + 1;
      size[t] = 1;
      for (int i = fi[t]; i; i = ne[i]) {
        if (to[i] == fa[t]) continue;
        fa[to[i]] = t;
        getInfo(to[i]);
        size[t] += size[to[i]];
        if (size[to[i]] > size[maxson[t]]) maxson[t] = to[i];
      }
    }
    void getLink(int t) {
      dfn[t] = ++T;
      if (t == maxson[fa[t]]) linetop[t] = linetop[fa[t]];
      else linetop[t] = t;
      if (maxson[t]) getLink(maxson[t]);
      for (int i = fi[t]; i; i = ne[i]) {
        if (to[i] == maxson[t] || to[i] == fa[t]) continue;
        getLink(to[i]);
      }
    }
    void init(int n, int *v) {
      for (int i = 1; i <= n; ++i) {
        if (!dfn[i]) {
          getInfo(i);
          getLink(i);
        }
      }
      for (int i = 1; i <= n; ++i) val[dfn[i]] = v[i];
      tree.build(n, val);
    }
    int lca(int x, int y) {
      while (linetop[x] != linetop[y]) {
        if (deep[linetop[x]] < deep[linetop[y]]) swap(x, y);
        x = fa[linetop[x]];
      }
      if (deep[x] > deep[y]) swap(x, y);
      return x;
    }
    int querySum(int x, int y) {
      int res = 0;
      while (linetop[x] != linetop[y]) {
        if (deep[linetop[x]] < deep[linetop[y]]) swap(x, y);
        res += tree.query(T, dfn[linetop[x]], dfn[x]);
        x = fa[linetop[x]];
      }
      if (deep[x] > deep[y]) swap(x, y);
      return res + tree.query(T, dfn[x], dfn[y]);
    }
  }
};

namespace BalancedTree {
  struct Splay { // P3369
    // {{{
    int cnt, root, val[N], num[N], son[N][2], fa[N], size[N], revtag[N];
    bool nroot(int t) { return fa[t]; }
    bool isson(int t) { return t == son[fa[t]][1]; }
    void optRev(int t) {
      revtag[t] ^= 1, swap(son[t][0], son[t][1]);
    }
    void reverse(int l, int r) {
      splay(kth(l - 1)), splay(kth(r + 1), root);
      optRev(son[son[root][1]][0]);
    }
    void echo() { echo(root); }
    void echo(int t) {
      pushdown(t);
      if (son[t][0]) echo(son[t][0]);
      printf("%d ", t);
      if (son[t][1]) echo(son[t][1]);
    }
    void update(int t) {
      size[t] = size[son[t][0]] + size[son[t][1]] + num[t];
    }
    void pushdown(int t) {
      if (revtag[t]) {
        optRev(son[t][0]), optRev(son[t][1]);
        revtag[t] = 0;
      }
    }
    void rotate(int t) {
      int f = fa[t], g = fa[f], tis = isson(t), fis = isson(f);
      if (nroot(f)) son[g][fis] = t;
      fa[t] = g;
      fa[son[t][tis ^ 1]] = f, son[f][tis] = son[t][tis ^ 1];
      fa[f] = t, son[t][tis ^ 1] = f;
      update(f), update(t);
    }
    void splay(int t, int to = 0) {
      while (fa[t] != to) {
        if (fa[fa[t]] == to) rotate(t);
        else if (isson(t) == isson(fa[t])) rotate(fa[t]), rotate(t);
        else rotate(t), rotate(t);
      }
      if (!to) root = t;
    }
    int build(int l,int r, int f) {
      if (l > r) return 0;
      int mid = (l + r) >> 1, t = ++cnt;
      val[t] = mid, fa[t] = f, size[t] = num[t] = 1;
      son[t][0] = build(l, mid - 1, t), son[t][1] = build(mid + 1, r, t);
      update(t);
      root = t;
      return t;
    }
    void insert(int v) {
      if (find(v)) {
        size[root]++, num[root]++;
        return ;
      }
      int t = root;
      for (int i = t; size[i]; i = son[i][v > val[i]]) t = i;
      val[++cnt] = v, size[cnt] = num[cnt] = 1, fa[cnt] = t;
      if (t) son[t][v > val[t]] = cnt;
      splay(cnt);
    }
    bool find(int v) {
      for (int i = root; size[i]; i = son[i][v > val[i]]) {
        if (val[i] == v) {
          splay(i);
          return true;
        }
      }
      return false;
    }
    int next(int t, int x) {
      t = son[t][x];
      while (t && son[t][x ^ 1]) t = son[t][x ^ 1];
      return t;
    }
    void erase(int v) {
      if (!find(v)) return ;
      size[root]--, num[root]--;
      if (num[root]) return ;
      int l = next(root, 0), r = next(root, 1);
      if (!l) {
        splay(r);
        val[son[root][0]] = 0;
        son[root][0] = 0;
      } else if (!r) {
        splay(l);
        val[son[root][1]] = 0;
        son[root][1] = 0;
      } else {
        splay(l), splay(r, l);
        val[son[son[root][1]][0]] = 0;
        son[son[root][1]][0] = 0;
      }
    }
    int rank(int v) {
      insert(v);
      int res = size[son[root][0]] + 1;
      erase(v);
      return res;
    }
    int kth(int k) {
      int t = root;
      while (k) {
        pushdown(t);
        int base = size[son[t][0]], cost = size[son[t][0]] + num[t];
        if (base < k && cost >= k) {
          splay(t);
          return val[t];
        }
        if (base >= k) t = son[t][0];
        else k -= cost, t = son[t][1];
      }
      return -1;
    }
    int fore(int v) {
      insert(v);
      int res = val[next(root, 0)];
      erase(v);
      return res;
    }
    int succ(int v) {
      insert(v);
      int res = val[next(root, 1)];
      erase(v);
      return res;
    }
    // }}}
  };
};

namespace Persistence {
  // {{{
  struct Array { // P3919
    // {{{
    public:
    int cnt, root[N];
    Array() {
      T = 0;
      memset(root, 0, sizeof(root));
      memset(tree, 0, sizeof(tree));
      memset(lson, 0, sizeof(lson));
      memset(rson, 0, sizeof(rson));
    }
    void build(int n, int *v) {
      build(v, 1, n, root[0]);
    }
    int modify(int n, int p, int v, int t) { return modify(p, v, 1, n, root[t]); }
    int query(int n, int p, int t) { return query(p, 1, n, root[t]); }

    private:
    int T, tree[N << 4], lson[N << 4], rson[N << 4];
    void build(int *v, int l, int r, int &t) {
      t = ++T;
      int mid = (l + r) >> 1;
      if (l == r) {
        tree[t] = v[mid];
        return ;
      }
      build(v, l, mid, lson[t]), build(v, mid + 1, r, rson[t]);
    }
    int modify(int p, int v, int l, int r, int t) {
      int rt = ++T, mid = (l + r) >> 1;
      tree[rt] = tree[t], lson[rt] = lson[t], rson[rt] = rson[t];
      if (l == r) tree[rt] = v;
      else if (p <= mid) lson[rt] = modify(p, v, l, mid, lson[t]);
      else rson[rt] = modify(p, v, mid + 1, r, rson[t]);
      return rt;
    }
    int query(int p, int l, int r, int t) {
      int mid = (l + r) >> 1;
      if (l == r) return tree[t];
      if (p <= mid) return query(p, l, mid, lson[t]);
      return query(p, mid + 1, r, rson[t]);
    }
    // }}}
  };
  struct SegmentTree { // P3834
    // {{{
    public:
    int cnt, root[N];
    int num, val[N];
    void build(int n, int *v) {
      for (int i = 1; i <= n; ++i) val[i] = v[i];
      sort(val + 1, val + n + 1);
      num = unique(val + 1, val + n + 1) - val - 1;
      for (int i = 1; i <= n; ++i)
        root[i] = modify(
            lower_bound(val + 1, val + num + 1, v[i]) - val, 
            1, 1, num, root[i - 1]);
    }
    int queryKth(int l, int r, int k) {
      return queryKth(k, 1, num, root[l - 1], root[r]);
    }

    private:
    int T, tree[N << 4], lson[N << 4], rson[N << 4];
    int modify(int p, int v, int l, int r, int t) {
      int rt = ++T, mid = (l + r) >> 1;
      tree[rt] = tree[t] + 1, lson[rt] = lson[t], rson[rt] = rson[t];
      if (l == r) return rt;
      if (p <= mid) lson[rt] = modify(p, v, l, mid, lson[t]);
      else rson[rt] = modify(p, v, mid + 1, r, rson[t]);
      return rt;
    }
    int queryKth(int k, int l, int r, int lt, int rt) {
      int mid = (l + r) >> 1;
      if (l == r) return val[mid];
      if (tree[lson[rt]] - tree[lson[lt]] >= k) return queryKth(k, l, mid, lson[lt], lson[rt]);
      return queryKth(k - (tree[lson[rt]] - tree[lson[lt]]), mid + 1, r, rson[lt], rson[rt]);
    }
    // }}}
  };
  struct Union {
  };
  // }}}
};

namespace Math {
  // {{{
  struct Basis { // P3812
    // {{{
    var basis[64];
    void insert(var v) {
      for (int i = 60; i >= 0; --i) {
        if (!((v >> i) & 1)) continue;
        if (!basis[i]) {
          basis[i] = v;
          break;
        }
        v ^= basis[i];
      }
    }
    bool testInsert(var v) {
      for (int i = 60; i >= 0; --i) {
        if (!((v >> i) & 1)) continue;
        if (!basis[i]) return true;
        v ^= basis[i];
      }
      return false;
    }
    var queryMax(var v = 0) {
      for (int i = 60; i >= 0; --i) {
        if ((v ^ basis[i]) > v) v ^= basis[i];
      }
      return v;
    }
    void format() {
      for (int i = 60; i >= 0; --i) {
        for (int j = i - 1; j >= 0; --j) {
          if (!((basis[i] >> j) & 1)) continue;
          basis[i] ^= basis[j];
        }
      }
    }
    // }}}
  };
  struct Matrix { // P3390
    // {{{
    var num[SIZE + 1][SIZE + 1];
    Matrix() { memset(num, 0, sizeof(num)); }
    Matrix(int t) { *this = t; }
    void operator=(var t) {
      for (int i = 1; i <= SIZE; ++i) num[i][i] = t;
    }
    Matrix operator*(Matrix t) {
      Matrix res;
      for (int i = 1; i <= SIZE; ++i) {
        for (int k = 1; k <= SIZE; ++k) {
          if (!num[i][k]) continue;
          for (int j = 1; j <= SIZE; ++j) {
            (res.num[i][j] += (num[i][k] * t.num[k][j]) % MOD) %= MOD;
          }
        }
      }
      return res;
    }
    void operator*=(Matrix t) { *this = *this * t; }
    Matrix operator^(var y) {
      Matrix res = 1, x = *this;
      while (y) {
        if (y & 1) res *= x;
        x *= x;
        y >>= 1;
      }
      return res;
    }
    // }}}
  };
  template<class tp> void getInv(int n, var p, tp *inv) { // P3811
    inv[0] = inv[1] = 1;
    for (int i = 2; i <= n; ++i) inv[i] = ((p - p / i) * inv[p % i]) % p;
  }
  var qpow(var x, var y, var p) { // P1226
    var res = 1;
    while (y) {
      if (y & 1) (res *= x) %= p;
      (x *= x) %= p;
      y >>= 1;
    }
    return res;
  }
  var gcd(var a, var b) {
    if (!b) return a;
    return gcd(b, a % b);
  }
  // }}}
};

namespace String {
  // {{{
  namespace Hash { // P3370
    // {{{
    const int BASE1 = 107, BASE2 = 109;
    const int MOD1 = 1e9 + 7, MOD2 = 1e9 + 9;
    struct Atom {
      var x, y;
      Atom() { x = 0, y = 0; }
      void insert(var v) {
        ((x *= BASE1) += v) %= MOD1, ((y *= BASE2) += v) %= MOD2;
      }
      var val() {
        return (x * MOD2) + y;
      }
    };
    struct HashTable {
      var val[N + 1000], num[N + 1000];
      int insert(Atom x) {
        var v = x.val();
        int t = v % N;
        while (val[t] && val[t] != v) t++;
        val[t] = v, num[t]++;
        return num[t];
      }
    };
    // }}}
  };
  namespace Manacher { // P3805
    // {{{
    char S[N << 1];
    void getLen(int n, char *s, int *len) {
      for (int i = 0; i < n; ++i) S[i * 2] = s[i], S[i * 2 + 1] = '#';
      n = n * 2 + 2;
      int pos = 0;
      for (int i = 0; i < n; ++i) {
        if (pos + len[pos] > i) len[i] = min(pos + len[pos] - i, len[pos * 2 - i]);
        while (S[i - len[i]] == S[i + len[i]]) len[i]++;
        if (i + len[i] > pos + len[pos]) pos = i;
      }
    }
    // }}}
  };
  namespace KMP { // P3375
    // {{{
    int fail[N];
    void getFail(int n, char *s) {
      for (int i = 2, t = 0; i <= n; ++i) {
        while (t && s[t + 1] != s[i]) t = fail[t];
        if (s[t + 1] == s[i]) fail[i] = ++t;
      }
    }
    vector<int> match(int n, char *S, int m, char *T) {
      getFail(n, S);
      vector<int> res;
      for (int i = 1, t = 0; i <= m; ++i) {
        if (t && S[t + 1] != T[i]) t = fail[t];
        if (S[t + 1] == T[i]) t++;
        if (t == n) res.push_back(i - n + 1);
      }
      return res;
    }
    // }}}
  };
  // }}}
};

using namespace DivideAndConquer::Node;

int main() {
#ifndef ONLINE_JUDGE
  freopen("tmp.in", "r", stdin);
  freopen("tmp.out", "w", stdout);
#endif
  int n = read();
  for (int i = 2; i <= n; ++i) {
    int u = read(), v = read(), w = read();
    add(u, v, w), add(v, u, w);
  }
  int x = DFS(1) + n, y = n * n, g = Math::gcd(x, y);
  printf("%d/%d\n", x / g, y / g);
  return 0;
}
```


## KMP 字符串匹配

给出两个字符串 $s_1$ 和 $s_2$，若 $s_1$ 的区间 $[l, r]$ 子串与 $s_2$ 完全相同，则称 $s_2$ 在 $s_1$ 中出现了，其出现位置为 $l$。  
现在请你求出 $s_2$ 在 $s_1$ 中所有出现的位置。

定义一个字符串 $s$ 的 border 为 $s$ 的一个**非 $s$ 本身**的子串 $t$，满足 $t$ 既是 $s$ 的前缀，又是 $s$ 的后缀。  
对于 $s_2$，你还需要求出对于其每个前缀 $s'$ 的最长 border $t'$ 的长度。

对于全部的测试点，保证 $1 \leq |s_1|,|s_2| \leq 10^6$，$s_1, s_2$ 中均只含大写英文字母。

```cpp
const int LEN = 1000000;

char s1[LEN + 1], s2[LEN + 1];
int fail[LEN + 1];

void solve() {
  ios::sync_with_stdio(false);
  cin >> s1 >> s2;
  int n = strlen(s1), m = strlen(s2), t = 0;
  for (int i = 1; i < m; i++) {
    while (s2[i] != s2[t] && t) t = fail[t];
    if (s2[i] == s2[t]) fail[i + 1] = ++t;
  }
  t = 0;
  for (int i = 0; i < n; i++) {
    while (s1[i] != s2[t] && t) t = fail[t];
    if (s1[i] == s2[t]) t++;
    if (t == m) cout << i - m + 2 << endl;
  }
  for (int i = 1; i <= m; i++) cout << fail[i] << " ";
  cout << endl;
}
```

## 负环

给定一个 $n$ 个点的有向图，请求出图中是否存在**从顶点 $1$ 出发能到达**的负环。

负环的定义是：一条边权之和为负数的回路。

```cpp
const int MAXN = 20000;
const int MAXM = 30000;

int n, m;
int top, fi[MAXN + 1];
int ne[2 * MAXM + 1], to[2 * MAXM + 1];
ll co[2 * MAXM + 1];
int dist[MAXN + 1], deep[MAXN + 1];
bool arrive[MAXN + 1];

void solve();
bool find(int);
void add(int, int, int);

void solve() {
  top = 0;memset(fi, 0, sizeof(fi));
  memset(ne, 0, sizeof(ne)); memset(to, 0, sizeof(to));
  memset(co, 0, sizeof(co)); memset(arrive, false, sizeof(arrive));
  cin >> n >> m;
  for (int i = 1; i <= m; i++) {
    int u, v, w;
    cin >> u >> v >> w;
    add(u, v, w);
    if (w >= 0) add(v, u, w);
  }
  bool have = false;
  for (int i = 1; i <= n; i++) {
    if (!arrive[i] && find(i)) {
      have = true;
      break;
    }
  }
  if (have) cout << "YE5" << endl;
  else cout << "N0" << endl;
}

bool find(int begin) {
  memset(dist, 16, sizeof(dist));
  dist[begin] = 0;
  memset(deep, -1, sizeof(deep));
  deep[begin] = 0;
  queue<int>q;
  q.push(begin);
  while (!q.empty()) {
    int f = q.front(); q.pop();
    arrive[f] = true;
    for (int i = fi[f]; i; i = ne[i]) {
      if (dist[f] + co[i] < dist[to[i]]) {
        dist[to[i]] = dist[f] + co[i];
        deep[to[i]] = deep[f] + 1;
        if (deep[to[i]] > n) return true;
        q.push(to[i]);
      }
    }
  }
  return false;
}

void add(int u, int v, int w) {
  top++; ne[top] = fi[u]; fi[u] = top;
  to[top] = v; co[top] = w;
}
```

## 最小费用最大流

```cpp
class Graph {
  public:
    int top, fi[N], ne[M << 1], to[M << 1], fl[M << 1], co[M << 1];

    int S, T;
    var dist[N];
    int head, tail, q[N];
    bool inq[N];
    int fromNode[N], fromLine[N];

    Graph() {
      top = 1;
    }

    void Add(int u, int v, int f, int w) {
      ne[++top] = fi[u], fi[u] = top, to[top] = v, fl[top] = f, co[top] = w;
      ne[++top] = fi[v], fi[v] = top, to[top] = u, fl[top] = 0, co[top] = -w;
    }

    bool SPFA() {
      memset(dist, 0x3f, sizeof(dist));
      dist[S] = 0;
      q[head = tail = 1] = S;
      while (head <= tail) {
        int t = q[head++];
        inq[t] = false;
        for (int i = fi[t]; i; i = ne[i]) {
          if (!fl[i] || dist[to[i]] <= dist[t] + co[i]) continue;
          dist[to[i]] = dist[t] + co[i];

          fromNode[to[i]] = t, fromLine[to[i]] = i;

          if (inq[to[i]]) continue;
          q[++tail] = to[i];
          inq[to[i]] = true;
        }
      }
      return dist[T] != 0x3f3f3f3f3f3f3f3f;
    }

    void MCMF(var &sum_flow, var &cost) {
      while (SPFA()) {
        int flow = 0x3f3f3f3f;
        for (int i = T; i != S; i = fromNode[i])
          flow = min(flow, fl[fromLine[i]]);
        for (int i = T; i != S; i = fromNode[i])
          fl[fromLine[i]] -= flow, fl[fromLine[i] ^ 1] += flow;
        sum_flow += flow;
        cost += dist[T] * flow;
      }
    }
};

class Solve : public Graph {
  public:
    int n, m;

    int main() {
      n = read(), m = read(), S = read(), T = read();
      for (int i = 1; i <= m; ++i) {
        int u = read(), v = read(), w = read(), f = read();
        Add(u, v, w, f);
      }
      var flow = 0, cost = 0;
      MCMF(flow, cost);
      printf("%lld %lld\n", flow, cost);
      return 0;
    }
}
```

## 网络流 Dinic

```cpp
int n, m, S, T;
int top = 1, fi[N], ne[M << 2], to[M << 2], fl[M << 2];
int deep[N], cur[N];

void add(int u, int v, int w) {
    top++, ne[top] = fi[u], fi[u] = top, to[top] = v, fl[top] = w;
    top++, ne[top] = fi[v], fi[v] = top, to[top] = u, fl[top] = 0;
}

int Dinic() {
    int res = 0;
    while (BFS()) {
        for (int i = 1; i <= n; ++i) cur[i] = fi[i];
        res += DFS(S, INF);
    }
    return res;
}

bool BFS() {
    memset(deep, 0, sizeof(deep));
    deep[S] = 1;
    queue<int> q;
    q.push(S);
    while (!q.empty()) {
        int f = q.front();
        q.pop();
        for (int i = fi[f]; i; i = ne[i]) {
            if (!fl[i] || deep[to[i]]) continue;
            deep[to[i]] = deep[f] + 1;
            q.push(to[i]);
        }
    }
    return deep[T];
}

int DFS(int t, int flow) {
    int sumFlow = 0;
    if (t == T) return flow;
    while (cur[t]) {
        int i = cur[t];
        cur[t] = ne[cur[t]];
        if (!fl[i] || deep[to[i]] != deep[t] + 1) continue;
        int tFlow = DFS(to[i], min(flow - sumFlow, fl[i]));
        fl[i] -= tFlow;
        fl[i ^ 1] += tFlow;
        sumFlow += tFlow;
    }
    return sumFlow;
}
```

## 笛卡尔树

给定一个 $1 \sim n$ 的排列 $p$，构建其笛卡尔树。

即构建一棵二叉树，满足：

1. 每个节点的编号满足二叉搜索树的性质。
2. 节点 $i$ 的权值为 $p_i$，每个节点的权值满足小根堆的性质。

设 $l_i,r_i$ 分别表示节点 $i$ 的左右儿子的编号（若不存在则为 $0$）。

一行两个整数，分别表示 $\operatorname{xor}_{i = 1}^n i \times (l_i + 1)$ 和 $\operatorname{xor}_{i = 1}^n i \times (r_i + 1)$。

```cpp
int n, p[N];
int son[N][2];
int cnt, sta[N];

void solve() {
	n = read();
	for (int i = 1; i <= n; ++i) p[i] = read();
	for (int i = 1; i <= n; ++i) {
		while (cnt && p[sta[cnt]] > p[i]) cnt--;
		son[sta[cnt]][1] = i, son[i][0] = sta[cnt + 1];
		sta[++cnt] = i, sta[cnt + 1] = 0;
	}

	var res1 = 0, res2 = 0;
	for (var i = 1; i <= n; ++i)
		res1 ^= i * (son[i][0] + 1), res2 ^= i * (son[i][1] + 1);
	printf("%lld %lld\n", res1, res2);
}
```

## 拉格朗日插值

```cpp
struct Point {
  int x, y;
};
int Lagrange(int n, Point *point, int x) {
  int res = 0;
  for (int i = 1; i <= n; ++i) {
    int u = 1, d = 1;
    for (int j = 1; j <= n; ++j) {
      if (i == j) continue;
      u = mul(u, add(x, MOD - point[j].x));
      d = mul(d, add(point[i].x, MOD - point[j].x));
    }
    res = add(res, mul(point[i].y, mul(u, inv(d))));
  }
  return res;
}
```

## 回滚莫队

给定一个序列，多次询问一段区间 $[l,r]$，求区间中**相同的数的最远间隔距离**。

序列中两个元素的**间隔距离**指的是**两个元素下标差的绝对值**。

```cpp
struct Query {
  int id, l, r;
};

int n, v[N];
int len, val[N];
int m, cnt;
Query query[N];
int res[N];
int in[N], mxpos[N];
int lshow[N], rshow[N];

void beMax(int &a, int b) {
  if (b > a) a = b;
}

bool camp(Query a, Query b) {
  if (in[a.l] == in[b.l]) return a.r < b.r;
  return a.l < b.l;
}

void Solve() {
  n = read();
  for (int i = 1; i <= n; ++i) v[i] = read();

  for (int i = 1; i <= n; ++i) val[++len] = v[i];
  sort(val + 1, val + n + 1);
  len = unique(val + 1, val + len + 1) - val - 1;
  for (int i = 1; i <= n; ++i)
    v[i] = upper_bound(val + 1, val + len + 1, v[i]) - val - 1;

  int size = 500;
  for (int i = 1; i <= n; ++i) in[i] = i / size + 1;

  m = read();
  for (int i = 1; i <= m; ++i) {
    int l = read(), r = read();
    if (in[l] == in[r]) {
      int tres = 0;
      for (int j = l; j <= r; ++j) {
        int &p = lshow[v[j]];
        if (!p) p = j;
        else beMax(tres, j - p);
      }
      res[i] = tres;
      for (int j = l; j <= r; ++j) lshow[v[j]] = 0;
    } else query[++cnt] = (Query) {i, l, r};
  }

  sort(query + 1, query + cnt + 1, camp);

  for (int i = 1; i <= cnt; ++i)
    beMax(mxpos[in[query[i].l]], query[i].l);

  int totres = 0, totl = 0, totr = 0;
  for (int i = 1; i <= cnt; ++i) {
    if (in[query[i].l] != in[query[i - 1].l]) {
      memset(lshow, 0, sizeof(lshow));
      memset(rshow, 0, sizeof(rshow));
      totres = 0;
      totl = mxpos[in[query[i].l]], totr = totl - 1;
    }
    while (totr < query[i].r) {
      totr++;
      int &p = lshow[v[totr]];
      if (!p) p = totr;
      else beMax(totres, totr - p);
      rshow[v[totr]] = totr;
    }

    int tmpres = totres, tmpl = totl;
    while (tmpl > query[i].l) {
      tmpl--;
      int &p = rshow[v[tmpl]];
      if (!p) p = tmpl;
      else beMax(tmpres, p - tmpl);
    }

    res[query[i].id] = tmpres;
  }

  for (int i = 1; i <= m; ++i)
    printf("%d\n", res[i]);

}
```

## CDQ 分治/三位偏序

```cpp
struct Num {
  int id, a, b, c;
  bool operator < (Num t) { 
    if (a == t.a) {
      if (b == t.b) return c < t.c;
      return b < t.b;
    }
    return a < t.a;
  }
  bool operator == (Num t) { 
    return a == t.a && b == t.b && c == t.c; 
  }
};

int n, k, cnt;
Num all[N], num[N], tmp[N];
int tree[K];
int belong[N], f[N], have[N], res[N];

void solve() {
  scanf("%d%d", &n, &k);
  for (int i = 1; i <= n; ++i) 
    scanf("%d%d%d", &all[i].a, &all[i].b, &all[i].c);
  sort(all + 1, all + n + 1);
  for (int i = 1; i <= n; ++i) {
    if (!(all[i] == num[cnt])) num[++cnt] = all[i];
    if (all[i] == num[cnt]) belong[i] = cnt, have[cnt]++;
  }
  for (int i = 1; i <= cnt; ++i) num[i].id = i;
  cdq(1, cnt);
  for (int i = 1; i <= cnt; ++i) res[f[i] + have[i] - 1] += have[i];
  for (int i = 0; i < n; ++i) printf("%d\n", res[i]);
}

void modify(int t, int v) {
  for (int i = t; i <= k; i += i & -i)
    tree[i] += v;
}

int query(int t) {
  int res = 0;
  for (int i = t; i; i -= i & -i) res += tree[i];
  return res;
}

void cdq(int l, int r) {
  if (l == r) return ;
  int mid = (l + r) >> 1;
  cdq(l, mid), cdq(mid + 1, r);
  int i = l, j = mid + 1, k = l;
  while (i <= mid || j <= r) {
    while (i <= mid && (j > r || num[i].b <= num[j].b))
      tmp[k++] = num[i], modify(num[i].c, have[num[i].id]), i++;
    while (j <= r && (i > mid || num[i].b > num[j].b)) 
      tmp[k++] = num[j], f[num[j].id] += query(num[j].c), j++;
  }
  for (int t = l; t <= mid; ++t) modify(num[t].c, -have[num[t].id]);
  for (int t = l; t <= r; ++t) num[t] = tmp[t];
}
```

## 线段树合并

```cpp
void SegTree::Merge(int &t, int s, int l, int r) {
  if (!s) return ;
  if (!t) t = s;
  else if (l == r) num[t] += num[s];
  else {
    int mid = (l + r) >> 1;
    Merge(lson[t], lson[s], l, mid);
    Merge(rson[t], rson[s], mid + 1, r);
    num[t] = max(num[lson[t]], num[rson[t]]);
  }
}
```

## 二维凸包

```cpp
const int N = 1e5 + 1;
const let EPS = 1e-8;
const let Pi = acos(-1.0);

struct Point {
  let x, y;
  friend Point operator - (Point a, Point b) {
    return (Point) {a.x - b.x, a.y - b.y};
  }
  friend let Cdot(Point a, Point b) {
    return a.x * b.x + a.y * b.y;
  }
  friend let Times(Point a, Point b) {
    return a.x * b.y - a.y * b.x; 
  }
  let Dist() {
    return sqrt(x * x + y * y);
  }
  Point Rotate(let k) {
    Point kp = (Point) {sin(k), cos(k)};
    return (Point) {Times(*this, kp), Cdot(*this, kp)};
  }
};
typedef Point Vec;

int sign(let x) {
  if (x > EPS) return 1;
  if (x < -EPS) return -1;
  return 0;
}

bool CampByXY(Point a, Point b) {
  if (sign(a.x - b.x) == 0) return sign(a.y - b.y) < 0;
  return sign(a.x - b.x) < 0;
}

class Geometry {
  protected:
    int cnt, sta[N];
    Point tmp[N];

  public:
    void GetConvexHull(int n, Point *point, int &len, Point *res) {
      sort(point + 1, point + n + 1, CampByXY);
      sta[cnt = 1] = 1;
      for (int i = 2; i <= n; ++i) {
        while (cnt > 1 && Times(
              point[sta[cnt]] - point[sta[cnt - 1]],
              point[i] - point[sta[cnt]]
              ) < 0) cnt--;
        sta[++cnt] = i;
      }
      int down_hull_cnt = cnt;
      for (int i = n - 1; i >= 1; --i) {
        while (cnt > down_hull_cnt && Times(
              point[sta[cnt]] - point[sta[cnt - 1]],
              point[i] - point[sta[cnt]]
              ) < 0) cnt--;
        sta[++cnt] = i;
      }
      len = cnt;
      for (int i = 1; i <= len; ++i) 
        res[i] = point[sta[i]];
    }
    void GetCH(int n, Point *point, int &len, Point *res) {
      GetConvexHull(n, point, len, res);
    }
    void SafeGetCH(int n, Point *point, int &len, Point *res) {
      let angle = ((let) rand() / RAND_MAX) * Pi;
      for (int i = 1; i <= n; ++i) tmp[i] = point[i].Rotate(angle);
      GetConvexHull(n, tmp, len, res);
      for (int i = 1; i <= n; ++i) res[i] = res[i].Rotate(-angle);
    }
} geometry;

int n, m;
Point origin[N], hull[N];

void solve() {
  n = read();
  for (int i = 1; i <= n; ++i)
    scanf("%Lf%Lf", &origin[i].x, &origin[i].y);
  geometry.SafeGetCH(n, origin, m, hull);
  let res = (hull[1] - hull[m]).Dist();
  for (int i = 2; i <= m; ++i)
    res += (hull[i] - hull[i - 1]).Dist();
  printf("%.2Lf\n", res);
}
```
