
Predicate symbols，有参数，如果有参数，则是命题，如果有一个，是concept name，有两个，表示的是role

这里就可以体现出一阶逻辑的表达力更强，参数可以为任意，而描述逻辑，只能为1或2

还有FOL比DL表达力强的更多地方

## Systax of FOPL

$x_1 = x_2$不一定在里面，如果在，则说成FOL with equality，课件中是直接就加在了FOL中

标准转化，就是需要用到的时候不需要证明

## 转化为FOPL
知识一定是转化为$\forall$

## Semantics of FOPL: interpretation
unary predicate sysbol A含有一个参数的

一阶逻辑中引入了variable assignment (看一下之前的随笔)

符号(变量)和和domain中的元素


在DL中也有some forall，但这些没有作用在x上

I是用来解释predicate symbol的，$\alpha$是用来解释variable的

右上角的井号表示用一阶逻辑表示

$T \models F$对FOPL是undecidiable

查询语言

Ground sentence，没有variable，对应individual，

数据库中所有的individual用Ind(D)表示

## Querying
只输出yes，no的为boolean

纵行表示的

## Assumptions
CWA

OWA

21页很难，先看例子

## Complexity of querying relational databases
Data complexity

数据库的大小

Conbined Complexity，更高

考虑数据库的大小和query的大小

OWA，certain answer，此时要基于D判断，前面用的是I

# Using Abox to save data

