## 1. 位姿描述
刚体参考点的位置和刚体的姿态统称为刚体的位姿
1. 位置在三维空间中直角坐标系下可以用$^Ap=[p_x, p_y, p_z]^{\top}$表示，左上角的A表示在A坐标系下
2. 为了规定刚体B的方位，设坐标系B与刚体固连，然后就可以用坐标系B的三个单位主矢量$x_B, y_B, z_B$(其实就是坐标系B的xyz轴单位矢量在A下的表示)相对于坐标系A的方向余弦组成的矩阵来表示相对于A的方位，矩阵为：
$$_B^AR=[^Ax_B, ^Ay_B, ^Az_B]=\left[\begin{matrix}
r_{11} & r_{12} & r_{13} \\
r_{21} & r_{22} & r_{23} \\ 
r_{31} & r_{32} & r_{33} \\ 
\end{matrix}\right] $$
    姿态直观理解就是机器人的朝向(这里就不是把机器人看做质点了)，描述这个坐标系需要确定他的三个坐标轴，所以上面的矩阵其实就是通过描述坐标系B在A下三个坐标轴的方向来确定的坐标系B
![20200227130425.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200227130425.png)
3. 旋转矩阵是正交矩阵，即$_B^AR^{\top} = _B^AR^{-1}$
4. 需要记住的特殊的旋转矩阵
$$ R(x, \theta) = \left[\begin{matrix}
    1 & 0 & 0 \\
    0 & cos\theta & -sin\theta \\
    0 & sin\theta & cos\theta \\
\end{matrix}\right] $$
$$ R(y, \theta) = \left[\begin{matrix}
    cos\theta & 0 & sin\theta \\
    0 & 1 & 0 \\
    -sin\theta & 0 & cos\theta \\
\end{matrix}\right] $$
$$ R(z, \theta) = \left[\begin{matrix}
    cos\theta & -sin\theta & 0 \\
    sin\theta & cos\theta & 0 \\
    0 & 0 & 1 \\
\end{matrix}\right] $$

## 2. 坐标变换

## 3. 齐次坐标变换
对方向和位置的表示
对齐次变换矩阵的拆分
对某个向量旋转时的题目的理解

## 4. 物体的变换和变换方程
复合变换
左乘和右乘
逆变换

## 5. 欧拉角和rpy角

## 6. 通用旋转变换