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

