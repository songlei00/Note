# ch6 State Uncertainty

## 1. Formulation
partially observable Markov decision process

POMDP中agent内部有一个状态估计器，输入为信念状态，行动，观察，输出为策略

部分可观察性
- 传感器仅能观察到环境的部分状态，多个不同状态的传感器数据相同
- 传感器缺陷：多次测量同一个状态获得的传感器数据可能不同

感知重名：不同真实状态往往对应于同一个观察结果

### 1. Example Problem
啼哭婴儿的例子

### 2. Partially Observation Markov Decision Processes

### 3. Policy Execution

### 4. Belief-State Markov Decision Processes
POMDP实际上是状态为信念状态的MDP

![20200604123533](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200604123533.png)

## 2. Belief Updating
信念状态用来表征与决策有关的、过去行动和观察序列的完整历史信息

策略是信念状态到行动的映射

值函数是从信念状态开始，执行策略$\pi$所能获得的期望折扣回报

信念状态更新是给定一个信念状态，在执行一个行动，获得一个观察后，使用贝叶斯估计来更新信念状态

### 1. Discrete State Filter
使用公式

$$b'(s') = \frac{O(o| s', a)}{P(o| b, a)}\sum_{s}T(s'| s, a)b(s)$$

### 2. Linear Gaussian Filter
状态转移和观察都是线性高斯形式

初始信念状态服从高斯分布

![20200604220333](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200604220333.png)

扩展卡尔曼滤波

### 3. Particle Filter
采用采样的方法更新信念状态

粒子滤波器

产生式模型

## 3. Exact Solution Methods
### 1. Alpha Vectors
$\alpha_a = R(., a)$

表示某个状态下采取不同行动的奖励的向量

### 2. Conditional Plans 条件规划
多步POMDP中，一个策略是一个条件规划，表示为一棵树

节点是采取的行动，边是观察，告诉agent得到什么观察后应该采取什么行动

类似于策略

### 3. Value Iteration
遍历所有的k步规划，丢掉次有规划，产生k+1步规划