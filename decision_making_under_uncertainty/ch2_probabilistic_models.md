# 2. Probabilistic Models
## 1. 表示
### 1. 概率分布
1. 截断高斯分布truncated Gaussian distribution
在使用高斯分布表示现实生活中的问题时，很多时候，自变量的取值在负数或比较小时和非常大时是没有可能出现的，但如果用高斯分布的话，仍有一个可能的概率发生。通过truncated Gaussian distribution，能够将自变量限制在区间[a, b]中
$$N(\omega | \mu, \sigma ^2, a, b)=\frac{f(\omega)}{F(b)-F(a)}$$
2. 高斯分布的另一个限制是，他是单峰分布，在峰值的一侧是单调的，另一侧也是单调的，对一些复杂的具有多个峰的分布，需要进行改进，高斯混合模型GMM是一系列高斯函数的加权和，可以通过调整权重和高斯分布的参数，更好表示有多个峰的模型，可以表示多模态的模型
$$p(x|\mu_1, \sigma_1^2, ..., \rho_1, ...) = \sum_{i=1}^{n}\rho_i N(x|\mu_i, \sigma_i^2)$$
3. 分段均匀密度函数，也可以用于表示多模态模型
4. 联合分布，如果每个随机变量都是二项分布，则有n个二值变量时，有$2^n-1$个独立的参数，减少独立参数的方法有两种
   1. 独立性假设
   2. 决策树表示，![20200228083314.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200228083314.png)
5. 条件高斯模型$$P(x|y)=\left\{\begin{aligned}
   N(x|\mu_1, \sigma_1^2), if\ y^1\\
   ... \\ 
   N(x|\mu_n, \sigma_n^2), if\ y^n\\
\end{aligned}
\right.$$
6. 线性高斯模型$P(X|Y)$，连续随机变量X的高斯分布，均值为连续随机变量Y取值的线性函数。条件概率密度函数为$p(x|y)=N(x|my+b, \sigma^2)$,图像如下：![20200228090348.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200228090348.png)
7. 条件线性高斯模型$$P(x|y)=\left\{\begin{aligned}
   N(x|m_1\mu_1+b_1, \sigma_1^2), if\ y^1\\
   ... \\ 
   N(x|m_2\mu_n+b_2, \sigma_n^2), if\ y^n\\
\end{aligned}
\right.$$
8. Sigmod模型
   1. logit模型$P(x^1|y) = \frac{1}{1+exp(-2*\frac{y-\theta_1}{\theta_2})}$(x的右上角标表示取值)
   2. probit$P(x^1|y) = \frac{\phi(y-\theta_1)}{\theta_2}$
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
#### 4. Temporal Models
1. Temporal Models表示一系列变量如何随时间变化，例如马尔科夫链。马尔科夫链中的$P(S_t|S_{t-1})$通常叫做转移模型。如果条件分布不随t变化，则称模型是稳态的
2. 隐马尔科夫模型，在马尔科夫链上增加观察节点，状态变量是离散的。![20200301091555.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200301091555.png)
3. 线性动态模型：状态变量是连续的，且条件分布是线性高斯分布
4. 动态贝叶斯网络

## 2. 推理inference
需要得到值的变量称为query variable，先前已经知道值的变量为evidence variable，其他的为hidden variable
### 1. 分类问题的推理
主要讲了使用naive bayes的推论，分母看做常数，然后归一化，考虑不同问题设置不同的阈值等等。
### 2. 时序模型上的推理
#### 1. 分类
推理任务主要分为4类
1. Filtering，$P(S_t|O_{0:t})$
2. Predicting，$P(S_{t'}|O_{0:t}), where\ t'>t$
3. Smoothing，$P(S_{t'}|O_{0:t}), where\ t'<t$
4. Most likely explanation，$arg\ max_{S_{0:t}}P(S_{0:t}|O_{0:t})$
#### 2. Filtering推理
即如何得到$P(S_t|O_{0:t})$
首先根据bayes' rule，$P(s_t|o_{0:t})\propto P(o_t|s_t,o_{0:t-1})P(s_t|o_{0:t-1})$，然后经过适当变形(根据图上的独立性关系)得到$$P(s_t|o_{0:t})\propto P(o_t|s_t)\sum_{s_{t-1}}P(s_t|s_{t-1})P(s_{t-1}|o_{0:t-1})$$，这就得到了一个递推式，其中$P(o_t|s_t)$和$P(s_t|s_{t-1})$可以根据隐马尔科夫模型直接得到，而第三项是t-1时刻的值，所以只要从0时刻不断迭代，就可以得到t时刻的值，这个过程叫做recursive Bayesian estimation，具体算法如下
![20200304090647.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304090647.png)
#### 3. 精确推理
进行精确推理的复杂度是指数级别的，但可以通过variable elimination的方法，在一般情况下变为线性，但最坏仍是指数，其实暂时没有太看懂，TODO
#### 4. 精确推理的复杂度
主要讲了P和NP，NP-hard，以及规约等等，贝叶斯网络上的推理是NP-hard问题，可以通过画出3-SAT的贝叶斯网证明
#### 5. 近似推理
通过从联合分布表示的贝叶斯网络上采样得到
1. direct sample
先得到贝叶斯网络节点的拓扑序，然后依次采样
![20200304093833.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304093833.png)
2. likelihood weighting
主要区别是，对于观察到的变量，我们直接赋值为1而不是进行采样
![20200304094135.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304094135.png)
3. 吉布斯采样Gibbs sampling，MCMC方法的一种
4. BP算法loopy belief propagation




