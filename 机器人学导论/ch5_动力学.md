# ch5 机器人动力学

## 5. 拉格朗日动力学通用方程推导
步骤
1. 计算给定点(各个连杆的质心)的速度
2. 计算总的动能
3. 计算总的势能
4. 建立拉格朗日函数
5. 建立拉格朗日方程

### 动能计算
![20200402145546.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402145546.png)

![20200402145629.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402145629.png)

![20200402145938.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402145938.png)

![20200402150749.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402150749.png)

![20200402150801.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402150801.png)

### 势能计算
![20200402150848.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402150848.png)

### 得到拉格朗日函数
![20200402151341.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402151341.png)

### 求导
#### 对角速度$\dot{q}$求导
**只有当$\dot{q_k}$或者$\dot{q_j}$等于$\dot{q_p}$时，导数值才不是零**，这里有点难直接看出来
![20200402151425.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402151425.png)
对其中一个转置，可以发现是相等的($I_i$是对称矩阵)，然后得到更加简洁的式子
![20200402152149.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402152149.png)

#### 对时间t求导
中间用了几次转置，化简式子
![20200402152253.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402152253.png)

#### 对角度q求导
![20200402152611.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402152611.png)

### 得到动力学方程
![20200402152653.png](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200402152653.png)