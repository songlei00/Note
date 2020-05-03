# Week8 ALC: terminological part
EL上的推理是tractable，而ALC不是
## 1. ALC syntax
介绍了最基础的ALC中可以使用的符号class names，role names，intersection等等，其他也可以增加一些比如数量限制exactly 4，但这不输出最基本的ALC的内容，所以没有在这里列出来

这些概念里面的内容需要注意，在ALC中已经有了绝大多数的语法，有了thing, nothing, and, or, exist, forall,

![20200408185835](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408185835.png)
主要看一下任意$\forall$是怎么interpretation的，从自然语言的语义上来说，$\forall r.A$，就是x需要和$A^I$中的所有的元素都有关系r，或者与所有的都没有，也就是，如果有，则全部一定是

## Domain and Range Restrictions in ALC
$\exist r.T \sqsubseteq C$表示r的domain被C限制

$\exist r^-.T\sqsubseteq C$表示r的range被C限制，这种不是标准ALC中的语法，我们可以用$T\sqsubseteq \forall r.C$表示。这种的理解是，r的range为C，所以任意的话，就能得到全集thing

## Disjoint Classes
在EL中，不能表示disjoint(因为没有nothing)，在ALC中，可以用$A\sqcap B \sqsubseteq \bot$或$A \sqsubseteq \neg B$

## Typical mistake for $\forall$

## Reasoning
### Without TBox
首先考虑没有TBox的推理，有两类问题

1. Subsumption，判断$C\sqsubseteq D$是否存在模型
2. Concept satisfiability

并且$\emptyset \models C\sqsubseteq D$当且仅当$C\sqcap \neg D$不可满足，所以在ALC中，subsumption可以规约为可满足性问题

ALC中的可满足性问题不是tractable的，复杂度介于NP完全和exp完全之间，这里的算法复杂度为指数

这里课件上给了两个例子

### Tableau Methods
证明concept可满足性的方法，步骤

1. 转化为Negation Nornal Form的形式(所有的negation都在concept name前面)
2. 然后不断推理
3. concept可满足当且仅当分支结束时，没有冲突出现

之后给了一些例子，并且证明了tableau算法的Soundness，completeness，termination

### With TBox
1. Subsumption，$T \models C \sqsubseteq D$
2. Satisfiability，存在一个解释是T的model并且在C上可满足

Satisflablity with TBox是ExpTime Conplete问题

Reasoning with TBoxes，判断$T \cup \{x:C\}$是否有model