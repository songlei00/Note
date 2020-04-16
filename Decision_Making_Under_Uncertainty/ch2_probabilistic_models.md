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
推理就是由证据变量的值确定一个或多个查询变量的分布
### 1. 贝叶斯网络上的推理和分类问题的推理
1. 主要讲了使用naive bayes的推论，分母看做常数，然后归一化，考虑不同问题设置不同的阈值等等。
2. 对隐变量的求和过程称为边际化，如$P(b^1, d^1, c^1)=\sum_s\sum_eP(b^1, s, e, d^1, c^1)$，再用链式法则，转化为已知概率的形式
3. 因子可以理解为表格，因子相乘可以扩张表格，而因子边际化和设置证据可以看做一种减小表格的操作
#### 1. 枚举推理
$P(Y) = \sum_X\prod_iP(X_i|Pa_{X_i})$
上面的连乘称为因子相乘，对因变量求和称为因子边际化，而求出右边的式子后，要对观察到的变量即证据变量设置值，称为设置证据
![20200305194747.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200305194747.png)
#### 2. 因子相乘
![20200305194903.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200305194903.png)
#### 3. 因子边际化
![20200305194941.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200305194941.png)
#### 4. 设置证据
![20200305195007.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200305195007.png)

### 2. 时序模型上的推理
#### 1. 分类
推理任务主要分为4类
1. Filtering，$P(S_t|O_{0:t})$
2. Predicting，$P(S_{t'}|O_{0:t}), where\ t'>t$
3. Smoothing，$P(S_{t'}|O_{0:t}), where\ t'<t$
4. Most likely explanation，$arg\ max_{S_{0:t}}P(S_{0:t}|O_{0:t})$
#### 2. Filtering推理
即如何得到$P(S_t|O_{0:t})$
首先根据bayes' rule，$P(s_t|o_{0:t})\propto P(o_t|s_t,o_{0:t-1})P(s_t|o_{0:t-1})$，然后经过适当变形(根据图上的独立性关系)得到$$P(s_t|o_{0:t})\propto P(o_t|s_t)\sum_{s_{t-1}}P(s_t|s_{t-1})P(s_{t-1}|o_{0:t-1})$$，这就得到了一个递推式，其中$P(o_t|s_t)$和$P(s_t|s_{t-1})$可以根据隐马尔科夫模型直接得到，而第三项是t-1时刻的值，所以只要从0时刻不断迭代，就可以得到t时刻的值，这个过程叫做recursive Bayesian estimation(也叫前向算法)，具体算法如下
![20200304090647.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304090647.png)
#### 3. 预测
首先利用滤波得到当前的状态概率分布，然后不断代下面这个公式
$$P(s_{t+k+1}|o_{0:t})=\sum_{s_{t+k}}P(s_{t+k+1}|s_{t+k})P(s_{t+k}|o_{0:t})$$

#### 4. 平滑
$$P(s_k|o_{0:t})=P(s_k|o_{0:k}, o_{k+1:t}) \propto P(s_k|o_{0:k})P(o_{k+1:t}|s_k, o_{0:k}) = P(s_k|o_{0:k})P(o_{k+1:t}|s_k)$$
最后的式子中，第一项使用前向算法，第二项使用后向算法，所以名字叫做前向后向算法。。。
**后向算法**
![20200305211831.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200305211831.png)
**上面有问题，应该是k+1=t**
#### 5. 寻找最可能序列
Viterbi(维特比)算法
大概就是从前向后计算，但后面的计算要用到前面估计的状态
### 3. 精确推理
#### 1. 变量消去法
大概就是先列出所有涉及到的变量的表格，然后消去隐变量，消除隐变量时，先对所有涉及到这个隐变量的表格进行因子相乘，然后再利用边际化(也就是求和操作)消去这个隐变量，不断重复
消去变量的顺序有时会对算法运行时间造成巨大影响，选择最优消元顺序是NP难问题
#### 2. 信念传播法BP
在没有无向环的图中，需要线性时间，如果有环，可以通过junction tree算法对节点进行合并。将变量消去法中求和操作看做一个消息传递的过程

### 4. 精确推理的复杂度
主要讲了P和NP，NP-hard，以及规约等等，贝叶斯网络上的推理是NP-hard问题，可以通过画出3-SAT的贝叶斯网规约证明

### 5. 近似推理
通过从联合分布表示的贝叶斯网络上采样得到
1. direct sample
先得到贝叶斯网络节点的拓扑序，然后依次采样
这个方法的问题是花费很多时间来产生与观察不一致的样本
![20200304093833.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304093833.png)
2. likelihood weighting似然加权法
主要区别是，对于观察到的变量，我们直接赋值为1而不是进行采样
因为采样的分布和观察的分布不是一个分布，所以需要有一个权值；另一个角度理解的话，在给定观察到的值的时候，给不太可能出现的情况一个较低的权值
![20200304094135.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200304094135.png)
![20200312193845.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200312193845.png)
3. 吉布斯采样Gibbs sampling，MCMC方法的一种
MCMC：构造一条马尔科夫链，使其收敛到稳态，这个恰为待估计参数的后验分布，通过马尔科夫链来随机产生符合后验分布的样本，并基于这些样本来估计。如何构造马尔科夫链的转移概率至关重要
吉布斯采样，从任意样本出发(将证据变量固定为观察值)出发，通过对非证据变量逐个采样改变其取值，生成下一个样本
通常，为了采集到稳态时的样本，会丢弃前期的一些采样burn in period，为了减少样本之间的相关性，会每隔固定次数，进行一次采样

## 3. 参数学习
### 1. 离散模型
#### 二项分布
#### 多项分布
概率论的参数估计。。。

### 2. 连续模型
#### 高斯模型
#### 线性高斯模型
$p(x|y)=N(x|my+b, \sigma^2)$

### 3. 贝叶斯参数学习
极大似然参数学习在小数据上有一些缺陷。贝叶斯参数学习包含估计$\theta$的后验分布，并且能够在贝叶斯网络上推理
参数学习中的贝叶斯方法，是基于假说先验，估计$\theta$的后验分布，将参数学习过程，看做是贝叶斯网络上的推理过程
#### Gamma分布和Beta分布
Beta分布可以作为二项分布参数的先验分布，若选beta分布作为先验分布，后验也是beta分布
若先验分布为$Beta(\alpha, \beta)$观察为$o_i$
若$o_i=1$，则后验为$Beta(\alpha+1, \beta)$
若$o_i=0$，则后验为$Beta(\alpha, \beta+1)$
若先验为$Beta(\alpha, \beta)$，n架飞机中有m架发生碰撞，后验为$Beta(\alpha+m, \beta+n-m)$

#### Dirichlet分布
是beta分布的推广，可以用于估计离散分布的参数
![20200318100557.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318100557.png)
n=2时和beta分布相同
![20200318195501.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318195501.png)
如果$\theta_{1:n}$的先验由$Dir(\alpha_{1:n})$给出，数据中观察到$X=i$有$m_i$次，则后验为
![20200318200031.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318200031.png)
#### 贝叶斯学习和极大后验学习
![20200318201817.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318201817.png)

## 4. 非参数学习
### 1. 参数化模型和非参数化模型
非参数化模型，一类不能用有限参数集合刻画的函数,参数的数量和数据的规模有关
参数模型，用固定数目的参数组成的集合概括数据的学习模型

### 2. Kernel density estimation
非参数学习中最常见的方法是kernel density estimation，给定观察$o_{1:n}$，核密度估计用$p(x)=\frac{1}{n}\sum_{i=1}^nK(x-o_i)$表示密度，这里的K是核函数，积分为1
核函数可以给观察到的数据点赋予较大的密度，并且一般是对称的。一个常见的核函数是0均值的高斯核，高斯核是平滑的，并且高斯核的标准差deviation通常叫做bandwidth

#### 3. KNN
1. k最近邻查找，查找最接近的k个样本
2. knn回归
   - 连接点，使用查询点左右的两个样本，存在问题是有突兀的点，边界点无法处理
   - k最近邻平均，使用k个最近邻平均值做预测，更加平滑，但边界点仍然无法处理
   - k最近邻线性回归，寻找拟合$NN(k, x_q)$的最佳直线，这个对边界点的拟合效果很好，但有突兀的点
3. knn密度估算
   - 密度估算：给定数据，估算查询点的概率密度
   - 随着k的增加，估计得到的密度函数逐渐平滑

### 2. Structure Learning
找到最大化$P(G|D)$的图结构G，其中D是可获得数据
对于任意的图结构和数据，学习贝叶斯网络的结构是NP-hard问题
结构学习的步骤分为两个，首先基于$P(G|D)$计算贝叶斯网络的贝叶斯得分，其次是在网络空间中寻找得分最高的贝叶斯网络

#### Bayesian Structure Scoring
引进一些记号
- $r_i$表示$X_i$中实例的数量
- $q_i$表示$X_i$的父亲的数量，如果没有父亲，则为1
- $\pi_{ij}$表示$X_i$的第j个父亲
- $P(X_i=k|\pi_{ij})=\theta_{ijk}$表示其中的参数
- $m_{ijk}$表示给定$\pi_{ij}$，$X_i=k$出现的次数

![20200318204056.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318204056.png)

令$\theta_{ij}=(\theta_{ij1}...\theta_{ijr_i})$，则$P(\theta|G)=\prod_{i=1}^{n}\prod_{j=1}^{q_i}p(\theta_{ij})$
用贝叶斯规则计算$P(G|D)=P(G)P(D|G)=P(G)\int{P(D|\theta, G)p(\theta|G)d\theta}$,然后得到Bayesian score
![20200318105657.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318105657.png)
Bayesian score的一个很好的性质是，平衡了模型复杂度和数据之间的关系

#### Directed Graph Search
贝叶斯网络结构的数量随着节点个数的增加，超指数增长
因为在贝叶斯网络上评分时，枚举会造成指数复杂度，需要好的搜索策略
K2是最常用的之一，多项式时间完成，但不保证找到全局最优解
思想是从没有边的图开始，根据一个假定好的节点顺序进行迭代，每次依据最大得分来贪心地给节点添加一个父节点
![20200318112612.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318112612.png)
局部搜索算法也可以用来寻找最大值，通常也叫作爬山法或梯度上升
![20200318112740.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318112740.png)
![20200318210513.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318210513.png)
注意给图带来环的操作是无效的，也就是说，邻居不包括有环图
局部搜索算法有时会陷入局部最优，可以使用随机重启、模拟退火、Tabu(禁忌搜索)、遗传算法，Memetic(文化基因算法)等进行优化

### 3. Markov Equivalence Classes
贝叶斯网络结构编码了一组条件独立假设
如果两个图编码了一组相同的条件独立假设，则称这两个图是马尔科夫等价的
两个图是马尔科夫等价的，当且仅当他们有相同的边(不考虑方向)，且有相同的V型结构(是两个不同的节点指向同一个节点，由同一个节点指向另外两个节点的不算V型结构)
![20200318212816.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318212816.png)

### 4. Partially Directed Graph Search
马尔科夫等价类可以被表示为一个部分有向图
部分有向图搜索，就是在马尔科夫等价类内搜索
![20200318213500.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200318213500.png)

## 5. 总结
- 不确定性来自不完全信息和由于实际或理论的限制，不能对未来很好预测
- 建立鲁棒的决策系统，考虑不确定性十分重要
- 贝叶斯网络简洁的表示了变量的分布和变量之间的关系
- 网络的结构是对条件独立性假设的一种编码
- 对多变量模型编码时，贝叶斯模型是flexible
- 在网络结构特定时，推理可以变得比较高效
- 贝叶斯理论和极大似然法可以用于推理模型参数和结构
