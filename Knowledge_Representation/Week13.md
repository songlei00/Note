# First-order Predicate Logic
## Ontology Languages Based on First order predicate Logic
具体的语言有Common Logic，CycL，KIF

比描述逻辑更有表达力，但推理是undecidable

## DOLCE
DOLCE定义了general concepts例如participation，dependence，constitution

例如DOLCE中，$P(x, y)$表示x is a part of y

- $PP(x, y) = P(x, y) \cap \neg P(y, x)$定义了proper parthood
- $O(x, y) = \exist z(P(z, x)\cap P(z, y))$定义了overlap
- $AT(x) = \neg \exist PP(y, x)$定义了atoms

## Systax of FOPL, signature
FOPL中signature包括

- $V$变量的集合，例如$x, x_0, ..., y, ...$
- $P$，谓词符号的集合，每个谓词有arity，arity为0时，就类似命题；为1时，表示为$A, A_0, ..., B, B_1, ...$，为unary predicate，是concept name，arity为2时，叫做binary predicate，表示为$r, r_0, ..., s, s_0, ...$，与描述逻辑中的关系role对应

这里就可以体现出一阶逻辑的表达力更强，参数可以为任意，而描述逻辑，只能为1或2，除此之外，也还有FOL比DL表达力强的更多地方

$x_1 = x_2$不一定在里面，如果在，则说成FOL with equality，课件中是直接就加在了FOL中

## Formulas
对公式进行了递归定义

## 将concept inclusion转化为FOPL
知识一定是转化为$\forall$(即前面一定是forall x)

## Interpretation
一个interpretation包括一个domain和一个interpretation function，将every k-ary predicate symbol P to a k-ary relation over domain

标准转化，就是需要用到的时候不需要证明

Variable assignment，将每一个变量解释为一个论域中的元素
一阶逻辑中引入了variable assignment (看一下之前的随笔)

![20200519201806](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200519201806.png)

上面的满足关系中，左边有$I$和$\alpha$，I是用来解释predicate symbol的，$\alpha$是用来解释variable的

## FOPL Ontologies and Reasoning
An FOPL ontology T is finite set of closed FOPL formulas

$I \models T$ if and only if $I \models F$ for all $F \in T$

$T \models F$ if and only if, for all interpretations $I$ the following holds: if $I \models T$, then $I \models F$

$T \models F$对FOPL是undecidiable

## Query
Ground sentence F is of the form $P(c_1, ..., c_n)$, where $P$ is an n-ary predicate and $c_1, ..., c_n$ are individual symbols，没有variable

A database instance is a finite set $D$ of ground sentences，数据库中所有的individual的集合用Ind(D)表示

A n-ary query Q is a mapping that takes as input a database instance $D$ and outputs a set $Q(D)$ of n-tuples from $Ind(D)$

只输出yes，no的为boolean

## Assumptions
Query回答的结果与我们的assumption有关，包括closed world assumption(CWA)和open world assumption(OWA)

在关系数据库中，我们是closed world assumption

$answer(F(x_1, ..., x_n), D) = \{ (a_1, ..., a_n) | I_D \models F(a_1, ..., a_n) \}$


## Complexity of querying relational databases
Data complexity，只考虑数据库的大小

Conbined Complexity，比data complexity更高，考虑数据库的大小和query的大小

Data complexity is in LogSapce, so it is polytime and therefore tractable. Combined complexity is PSpace-complete, therefore, not tractable

## Open World Semantics
certain answer，此时要基于D判断，而前面用的是I



# Using Abox to save data

