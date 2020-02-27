### DP

#### 1. DP问题的性质
- 最优子结构和子问题重叠
- 求解思路
    - 辨认子问题结构
    - 写出递归式
    - 自顶向下或自底向上进行求解
    - 写出最优解的方案
- 最优子结构不一定一直满足，例如最长简单路径
- 两种求解方法比较：
    - 自顶向下往往会消耗较多的时间（递归比较耗时，但不一定，有时由于自顶向下只解决需要解决的子问题，会比较快）
    - 自底向上可能会消耗更多的空间,并且易于分析
- 做题时先尝试DP，然后尝试有没有贪心策略，如果有则证明贪心的正确性

#### 2. 钢条切割
- 问题
    Assume we are given a rod of length $m$. We sell length $i$ rod for a price of $𝑝_𝑖$, where $𝑖\in N^+$ and $1\leq i \leq n$.
How to cut the rod to gain maximum revenue?

- 递归解法
    Let $𝑟_𝑘$ denote max profit for a length 𝑘 rod
    $ r_n = max_{(1\leq i \leq n)}(p_i+r_{n-i})$
    ```
    CutRodRecMem(prices,n):
    for (i=0 to n)
      r[i] = -INF
    return CutRodRecMemAux(prices,r,n)

    CutRodRecMemAux(prices,r,n):
    if (r[n]>0)
      return r[n]
    if (n==0)
      q = 0
    else
      q = -INF
      for (i=1 to n)
        q = Max(q, prices[i]+CutRodRecAux(prices,r,n-i))
    r[n] = q
    return q
    ```
- 子问题图
    ![20191217152029.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217152029.png)
    子问题图一定是DAG，一个问题的求解依赖于其子问题是否被求解，用迭代解法要按照逆拓扑序求解。可以通过子问题图来确定迭代时的次序。
- 迭代解法，并且得到切割方案
    ```
    CutRodIter(prices,n):
    r[0] = 0
    for (i=1 to n)
      q = -INF
      for (j=1 to i)
        if (q < prices[j] + r[i-j])
          q = prices[j] + r[i-j]
          cuts[i] = j // 在长度为i时，切一段长度为j的可以得到最优解
      r[i] = q
    return r[n]

    PrintOpt(cuts,n):
    while (n>0)
      Print cuts[n]
      n = n – cuts[n]
    ```

#### 3. Floyd-Warshall
- Define 𝑑𝑖𝑠𝑡(𝑢,𝑣,𝑟) be length of shortest path from 𝑢 to 𝑣, s.t. only nodes in $𝑉_𝑟=\{𝑥_1,𝑥_2,⋯,𝑥_𝑟 \}$ can be intermediate nodes in paths.
- ![20191217153424.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217153424.png)
- 实现代码
    ```
    FloydWarshallAPSP(G):
    for (every pair (u,v) in V*V)
      if ((u,v) in E) then dist[u,v,0]=w(u,v)
      else dist[u,v,0]=INF
    for (r=1 to n)
      for (each node u)
        for (each node v)
          dist[u,v,r] = dist[u,v,r-1]
          if (dist[u,v,r] > dist[u,xr,r-1] + dist[xr,v,r-1])
            dist[u,v,r] = dist[u,xr,r-1] + dist[xr,v,r-1]
    ```
- 这个还可以对空间进行优化将递归式进行如下修改
    ```
    if (dist[u,v] > dist[u,xr] + dist[xr,v])
        dist[u,v] = dist[u,xr] + dist[xr,v]
    ```

#### 4. 矩阵链乘法
- 给定一个矩阵连乘式，加括号使得所要进行的乘法次数最小
- 一个a\*b的矩阵和b\*c的矩阵相乘的乘法次数为a\*b\*c
- 递归式 $m[i, j]$表示第$i$到第$j$个矩阵相乘所需乘法的最小次数，$m[i, j] = min_{i\leq k \leq j}(m[i, k]+m[k, j]+p_{i-1}p_kp_j))$
- 代码
    ``` 
    MatrixChainDP(A1, A2,…,An):
    for (i=1 to n)
      m[i,i] = 0
    for (l=2 to n)
      for (i=1 to n-l+1)
        j = i+l-1
        m[i,j] = INF
        for (k=i to j-1)
          cost = m[i,k] + m[k+1,j] + pi-1*pk*pj
          if (cost < m[i,j])
            m[i,j] = cost
            s[i,j] = k
    return <m,s>

    MatrixChainPrintOpt(s,i,j):
    if (i==j)
      Print(“Ai”)
    else
      Print(“(”)
      MatrixChainPrintOpt(s,i,s[i,j])
      MatrixChainPrintOpt(s,s[i,j]+1,j)
      Print(“)”)
    ```
    上面的代码是使用迭代法求解，想象二维数组为一个平面直角坐标系，其需要求解问题$m[i, j]$依赖的部分为其右下，上面的代码按照对角线顺序求解，保证求解一个问题时，其子问题已经得到解决。
    ![20191217160327.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217160327.png)

#### 5. 编辑距离
- 给定两个字符串，最少需要多少次插入删除替换操作可以将一个变为另一个
- $dist[i, j]$表示A的前i和字符和B的前j个字符的编辑距离，考虑最后一次操作
- 递归式
    $delDist = dist[i-1,j] + 1$
    $insDist = dist[i,j-1] + 1$
    $subDist = dist[i-1,j-1] + Diff(A[i],B[j])$
    $dist[i,j] = Min(delDist,insDist,subDist)$
- Transform “EXPONENTIAL” to “POLYNOMIAL” 子问题图
    ![20191217161120.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217161120.png)
- 对空间的优化
    ``` 
    // distLast[j] = dist[i-1,j]
    // distCur[j] = dist[i,j]
    delDist = distLast[j] + 1
    insDist = distCur[j-1] + 1
    subDist = distLast[j-1] + Diff(A[i],B[j])
    distCur[j] = Min(delDist,insDist,subDist)
    ```

#### 6. 最大独立子覆盖
- 问题
    Given an undirected graph $G=(V, E)$, an independent set $I$ is a subset of $V$, such that no vertices in $I$ are adjacent.
- 在任意图中的最大子覆盖特别难，我们考虑在树中的
- 递归式
    Let $mis(T_u, 1)$ be size of MaxIS of $T_u$, s.t. $u$ in the MaxIS.
    Let $mis(T_u, 0)$ be size of MaxIS of $T_u$, s.t. $u$ NOT in the MaxIS.
    $mis(T_u, 1) = 1+\sum_{v\ is\ the\ child\ of\ u} mis(T_v, 0)$
    $mis(T_u, 0) = \sum_{v\ is\ the\ child\ of\ u} mis(T_v)$
    $mis(T_u) = max\{mis(T_u, 0), mis(T_u, 1)\}$

#### 7. Subset Sum 这个问题主要说明DP不一定快
- Given an array $X[1...n]$ of $n$ positive integers, can we find a subset in $X$ that sums to given integer $T$
- 枚举所有可能性需要$O(2^n)$
- 递归式
    - $ss[i, t] = true$ iff instance $X[i...n], t$有解
    - ![20191217163431.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217163431.png)
- 代码
    ```
    SubsetSumDP(X,T):
    ss[n,0] = True
    for (t=1 to T)
      ss[n,t] = (X[n]==t)?True:False
    for (i=n-1 downto 1)
      ss[i,0] = True
      for (t=1 to X[i]-1)
        ss[i,t] = ss[i+1,t]
      for (t=X[i] to T)
        ss[i,t] = Or( ss[i+1,t], ss[i+1,t-X[i]] )
    return ss[1,T]
    ```
    复杂度$O(nT)$
    枚举和DP不一定哪一个更快，要看问题规模

#### 8. 最长公共子序列
- 这个和字符串匹配不同，不要求公共序列连续出现
- 递推式
    $c(i, j)=\left\{
    \begin{aligned}
     & 0,\ if\ i=0\ or\ j=0 \\
     & c[i-1, j]+1,\ x_i=y_j \\
     & max(c[i-1, j], c[i, j-1]),\ x_i\neq y_j
    \end{aligned}
    \right.$

#### 9. 最优二叉搜索树
- 问题
    给定一个n个不同关键字的已排序序列$K=\{k_1,..., k_n\}, k_1\leq ... \leq k_n$,有这些关键字构建一个二叉搜索树，每一个关键字对应一个概率$p_i$表示其搜索概率，还有$n+1$个伪关键字$d_i$表示不在K中的值的概率
    ![20191217212527.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217212527.png)
- 递归算法
    - $e[i, j]$表示包含$k_i, ..., k_j$的关键字中的一次期望搜索代价
    - $j=i-1$时，返回为关键字的概率$e[i, i-1] = q_{i-1}$
    - $j\geq i$时，需要选一个根节点$k_r$，将$k_i,...k_{r-1}$作为其左子树，$k_{r+1},...k_j$作为其右子树
    - 当一个子树成为一个叶节点时，由于每个节点的深度都增加1，所以这棵子树期望搜索代价增加值为所有概率之和，即$\omega(i, j)=\sum_{l=i}^jp_l+\sum_{l=i-1}^jq_l$
    - $e[i, j]=\left\{
      \begin{aligned}
       & q_{i-1},\ if\ j=i-1 \\
       & min(e[i, r-1]+e[r+1, j]+\omega(i, j)),\ i \leq j
      \end{aligned}
      \right.$
- 这个问题和矩阵链乘法很像，写代码时可以考虑那种写法，按照对角线顺序处理
- ![20191217214342.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20191217214342.png)

#### 10. 最长单调递增子序列
