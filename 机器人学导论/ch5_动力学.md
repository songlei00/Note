# ch5 机器人动力学

## 1. 概念
1. 机器人动力学是研究机器人的运动和作用力之间的关系
2. 正动力学：给定关节的驱动力或力矩，求机器人的运动(关节或末端执行器的位移、速度、加速度)，常用于机器人的仿真研究
3. 逆动力学：根据末端运动对应的关节的运动，求解所需要的关节驱动力、力矩，常用于运动控制，实现关节力矩补偿，达到良好的动态性能

## 2. 方法
1. 拉格朗日方程法：通过动、势能与广义力的关系，建立机器人动力学方程
2. 牛顿欧拉方程法：用构件质心的平动和相对质心的转动表示机器人构件的运动，利用动静法建立基于牛顿欧拉方程的动力学方程
3. 高斯原理法：利用力学中的高斯小约束原理，把动力学问题转化为极值问题求解

TODO

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