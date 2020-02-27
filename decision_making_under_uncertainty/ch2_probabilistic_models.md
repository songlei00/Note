# 2. Probabilistic Models
## 1. 表示
### 1. 概率分布
1. 截断高斯分布truncated Gaussian distribution
在使用高斯分布表示现实生活中的问题时，很多时候，自变量的取值在负数或比较小时和非常大时是没有可能出现的，但如果用高斯分布的话，仍有一个可能的概率发生。通过truncated Gaussian distribution，能够将自变量限制在区间[a, b]中
$$N(\omega | \mu, \sigma ^2, a, b)=\frac{f(\omega)}{F(b)-F(a)}$$
2. 高斯分布的另一个限制是，他是单峰分布，在峰值的一侧是单调的，另一侧也是单调的，对一些复杂的具有多个峰的分布，需要进行改进，高斯混合模型GMM是一系列高斯函数的加权和，可以通过调整权重和高斯分布的参数，更好表示有多个峰的模型
$$p(x|\mu_1, \sigma_1^2, ..., \rho_1, ...) = \sum_{i=1}^{n}\rho_i N(x|\mu_i, \sigma_i^2)$$
### 2. 贝叶斯网络
#### 1. 介绍
贝叶斯网络是一个有向无环图，有向边(u, v)表示，u是v的条件。贝叶斯网络可以极大减少计算联合分布时需要指定的参数的数量。计算公式为$$P(x_1, ..., x_n) = \prod_{i=1}^{n}P(x_i | pa_{x_i})$$
其中$pa_{x_i}$是所有指向$x_i$的节点的取值
#### 2. 条件独立性
1. $P(A, B | C) = P(A| C)P(B | C)$
2. 给定一系列节点的取值后，能够使用一系列规则判断贝叶斯网络中两个节点是否条件独立的。如果$(A\bot B|\ell)$，我们说$\ell$ d-separates $A$和$B$，我们也说$A$和$B$之间一条路径被$\ell$ d-sepatated，如果满足下面的条件
   1. 这条路径包含chain中的一个节点，$X\rightarrow Y \rightarrow Z$，其中$Y$为$ \ell $中的节点。即$Y$未知时，$X$和$Z$不独立，已知时独立
   2. 路径包含fork，$X \leftarrow Y \rightarrow Z$，其中$Y$为$\ell$中的节点。即$Y$未知时，$X$和$Z$不独立，已知后独立
   3. 路径包含inverted fork，$X \rightarrow Y \leftarrow Z$，则其中$Y$不是$\ell$中的节点，且Y的所有后继也不在$\ell$中。即$Y$未知时，$X$和$Z$独立，已知后不独立
3. 马尔可夫毯指将一个节点和其他节点d-separate的最小节点集合，包括这个节点的父节点，子节点，子节点的父节点，这些节点能够将这个节点与其他所有节点独立。
#### 3. 混合贝叶斯网络hybrid bayesian networks
贝叶斯网络也可以同时包含离散随机变量和连续随机变量，这样的网络叫做
hybrid bayesian networks，
这里不太懂。。。TODO
#### 4. Temporal Models
Temporal Models表示一系列变量如何随时间变化，例如马尔科夫链。马尔科夫链中的$P(S_t|S_{t-1})$通常叫做转移模型