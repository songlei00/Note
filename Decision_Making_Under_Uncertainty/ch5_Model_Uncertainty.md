# ch5 Model Uncertainty
强化学习系统：状态转移模型和奖赏模型未知，需要从经验中学习

挑战：探索与利用、信度分配、泛化

## 1. Bandit
n臂赌博机问题，拉h次摇臂，是一个有限MDP问题，有1个状态，n个行动，步数为h，奖赏函数未知

为了简化，假设奖赏为1

### 贝叶斯模型估计
假设先验分布为$Beta(1, 1)$，摇臂i以概率$\theta_i$输出获胜

对摇臂i，记录获胜次数$w_i$，失败次数$l_i$

则第i个摇臂的后验概率为$Beta(w_i+1, l_i+1)$

计算当前的获胜概率为$\rho_i = P(win_i | w_i, l_i) = \int_0^1\theta_i*Beta(\theta_i | w_i+1, l_i+1)d\theta_i = \frac{w_i+1}{w_i+l_i+2}$

上式中是根据全概率公式展开的，$\theta_i$为$P(win_i | \theta_i, w_i, l_i)$，即当前摇臂以$\theta_i$概率输出获胜时获胜的概率，后面为$P(\theta_i | w_i, l_i)$

## 2. 探索策略
1. 无向搜索策略，不适用之前行动的结果指导非贪心行动的选择，比如而$\epsilon$-greedy，乐观初始化
2. 有向搜索策略，使用。。。，比如上置信界搜索，随机梯度上升

### 贪心
真实行动值$q^*(a)=E[R_t | A_t=a]$，为选择a的期望奖赏

行动值$Q_t(a)$，为在t时刻之前，选择a的平均奖赏，用行动值作为真实行动值的估计

#### epsilon贪心

#### 增量实现
对行动值更新使用增量的方式$Q_{n+1}=Q_n+\alpha[R_n-Q_n]$

$$NewEstimate\leftarrow OldEstimate+StepSize[Target-OldEstimate]$$

#### 乐观初始化
给所有初始行动值一个乐观值，即初始的Q稍微高一些，这样会鼓励对未探索或探索次数少的行动进行探索

#### 上置信界探索
UCB行动选择$A_t = argmax_a[Q_t(a) + c\sqrt{\frac{lnt}{N_t(a)}}]$

#### 随机梯度上升
根据softmax分布选择行动，$$P(A_t=a) = \frac{e^{H_t(a)}}{\sum_{b=1}^ke^{H_t(b)}} = \pi_t(a)$$

每一步采取行动获得奖赏后进行更新，$$H_{t+1}(A_t) = H_t(A_t)+\alpha(R_t-\overline{R_t})(1-\pi_t(A_t))$$
$$H_{t+1}(a)=H_t(a)=\alpha(R_t-\overline{R_t})\pi_t(a), forall a\neq A_t$$

即根据超参数$\overline{R_t}$，对所有行动奖赏进行更新

## 3. 最优探索策略

## 4. 基于极大似然模型的方法
保存转移的次数$N(s, a, s')$和奖赏之和$\rho(s, a)$，估计方法：

$$N(s, a) = \sum_{s'}N(s, a, s')$$

$$T(s'|s, a) = N(s, a, s')/N(s, a)$$

$$R(s, a) = \rho (s, a)/N(s, a)$$

之后假定我们估计的模型正确，使用MDP方法进行推理

![20200515161716](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200515161716.png)

第10行是基于估计的模型，求解MDP问题，得到新的Q值，后面讲的一些方法也主要是如何更新Q值

![2020](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/%E5%8A%A0%E5%9B%BE.png)

### 1. 随机更新
在第十行中，更新的复杂度很高，避免的方法是Dyna，Dyna的更新方式

1. 在当前状态执行如下更新

$$Q(s, a) = R(s, a) + \gamma \sum_{s'} T(s'|s, a)max_{a'}Q(s', a')$$

2. 随机选择一些状态和行动，更新状态和行动对上的Q值
3. 更新后使用某一策略来选择要执行的行动

#### 模型和规划
模型：可以用于预测环境如何对agent的行动做出响应

分布模型：能产生下一个状态和立即奖赏的概率分布

样本模型：能从下一个状态和奖赏的概率分布中产生一个样本状态和奖赏

#### Q规划算法
特点：需要给定一个样本模型作为输入

![20200515215316](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200515215316.png)

不同点：这里是规划，样本模型是作为输入给定；Q-learning是学习，不需要已知样本模型

#### Dyna-Q算法
结合了Dyna和Q规划

同时使用真实经验和仿真经验

在这个方法中，真实经验同时用于学习模型和值函数，仿真经验只用于更新值函数，仿真就是伪代码中内层那n个循环

![20200515215713](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200515215713.png)

#### Dyna-Q+

使用探索奖金鼓励探索$r+\kappa \sqrt{\tau}$

### 2. Prioritized Updates 优先级更新
使用优先队列找到最需要更新U值的状态。

![20200515162436](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200515162436.png)

![20200515215822](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200515215822.png)

## 5. 基于贝叶斯模型的方法
特点：不依赖于启发式探索策略，能在探索和利用之间最优平衡

### 模型参数的信念状态
$\theta$的先验信念状态，对离散空间，用狄利克雷分布乘积表示$b_0(\theta) = \prod_s\prod_a Dir(\theta_{(s, a)}| \alpha_{(s,a)})$

$b_t$，在t步后，$\theta$的后验信念状态

$$b_t(\theta) = \prod_s \prod_a Dir(\theta_{(s, a)} | \alpha_{(s, a)} + m_{(s, a)})$$

### 贝叶斯自适应MDPs
将模型未知的MDP问题形式化为模型已知，更高维的MDP

行动空间、奖赏函数与基础MDP完全相同

转移函数：$T(s', b' | s, b, a) = \delta_{\tau (s, b, a, s')}$(b')P(s' | s, b, a)

$$P(s' | s, b, a) = \int_{\theta} b(\theta)P(s' | s, \theta, a)d\theta = \int_{\theta} b(\theta) \theta_{(s, a, s')} d\theta$$

### 求解方法
汤普森采样

## 6. 无模型方法
无模型方法不需要创建精确的转移和奖励模型

当问题的维度很高时，这种方法很attractive

### 蒙特卡洛方法
只适用于情节式任务，在每个情节结束后，更新函数

$$U$$

#### 蒙特卡洛预测
输入策略$\pi$，循环中进行一系列的采样，然后进行更新

### 时序差分法


### 1. Incremental Estimation

### 2. Q-learning

### 3. Sarsa
名字来自他使用$(s_t, a_t, r_t, s_{t+1}, a_{t_1})$更新Q

使用实际采取的行动更新Q，而不是像在Q-learning中一样，使用最好的行动

$Q(s_t, a_t) = Q(s_t, a_t) + \alpha (r_t, \gamma Q(s_{t+1}, a_{t+1}) - Q(s_t, a_t))$

## 7. 资格迹
### $\lambda$回报
各目标值的一种特殊的加权平均组合

$G_t^{\lambda} = (1-\lambda) \sum_{n=1}^{\infty} \lambda^{n-1} G_{t: t+n}$

$t+n\geq T$时，$G_{t: t+n} = G_t$，$G_t^{\lambda} = (1-\lambda) \sum_{n=1}^{T-t-1} \lambda^{n-1} G_{t: t+n} + \lambda ^{T-t-1}G_t$

### 离线$\lambda$回报算法
只适用情节式，使用$\lambda$回报$G_t^{\lambda}$作为目标值进行更新

$$U(S_t) = U(S_t) + \alpha [G_t^{\lambda} - U(S_t)]$$

与离线TD($\lambda$)在效果上等价

是向前看的观点

### 资格迹
资格迹在离散稀疏奖赏时很有用

状态s处的资格迹：状态s处的一个变量，随时间变化

累计迹更新公式：

$$ Z_t(s)=\left\{
\begin{aligned}
\gamma \lambda Z_{t-1}(s), if\ s\neq S_t \\
\gamma \lambda Z_{t-1}(s) + 1, if\ s= S_t
\end{aligned}
\right.
$$

替代迹更新公式：

$$ Z_t(s)=\left\{
\begin{aligned}
\gamma \lambda Z_{t-1}(s), if\ s\neq S_t \\
1, if\ s= S_t
\end{aligned}
\right.
$$

荷兰迹更新公式：

$$ Z_t(s)=\left\{
\begin{aligned}
\gamma \lambda Z_{t-1}(s), if\ s\neq S_t \\
(1-\alpha)\gamma \lambda Z_{t-1}(s) + 1, if\ s= S_t
\end{aligned}
\right.
$$

$\alpha \rightarrow 0$，趋近累计迹

$\alpha \rightarrow 1$，趋近替代迹

相同的是，没有访问的装填都是以$\gamma \lambda$衰减

### TD($\lambda$)
比较复杂，具体看课件

![20200521195144](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200521195144.png)

![20200521195427](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200521195427.png)

### Sarsa($\lambda$)
![20200521195427](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/1.%20%E8%AE%A1%E7%AE%97%E5%BD%93%E5%89%8D%E7%8A%B6%E6%80%81TD%E8%AF%AF%E5%B7%AE%0A2.%20%E6%9B%B4%E6%96%B0%E8%B5%84%E6%A0%BC%E8%BF%B9%0A3.%20%E6%9B%B4%E6%96%B0%E5%80%BC%E5%87%BD%E6%95%B0.png)

### Q($\lambda$)
![20200521195854](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200521195854.png)

## 8. Generalization
### 半梯度预测和控制
看不懂。。。

### 近似和抽象
#### 局部近似
![20200521202905](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200521202905.png)

#### 全局近似

### 深度Q网络
