# Logic based Ontology Engineering
## 1. Debugging Ontologies using Axiom Pinpointing
检查ontology质量的方法：check一些本不应该被O语义蕴含inclusion $C \sqsubseteq D$，他们确实没有被语义蕴含

当这些不应该被蕴含的式子实际是蕴含的，则需要产生一个解释帮助debug

Minimal subsets(pinpointing sets)，最小的集合解释为什么F follows ontology

### Axiom Pinpointing
The pinpointing set $Pin(T, C\sqsubseteq D)$ of T w.r.t $C\sqsubseteq D$ consists of all minimal subsets T' of T such that $T' \models C \sqsubseteq D$

注意这里是所有模型，可能不止一个

### Algorithm problems
There can be exponentially many sets in $Pin(T; C \sqsubseteq D)$

Testing whether there exists a member of $Pin(T; C \sqsubseteq D)$ of size $\leq$ n is non-tractable, even for EL

However, computing ONE member of $Pin(T; C \sqsubseteq D)$ is tractable, given an oracle for subsumption (see next slide)

Hence, computing ONE member of $Pin(T; C \sqsubseteq D)$ for T, C and D in EL is tractable

### Finding ONE member of $Pin(T, C\sqsubseteq D)$
![20200526143648](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200526143648.png)

## 2. Modularity 模块化
Ontology不应该是很大的整体，而是尽量模块化

每个模块应该独立工作

为了简化，大多数情况下只考虑EL Tbox部分

### Signatures
类似数据库中的视图view，将需要的运算只关注在某个小部分，从而减少计算复杂度

A signature is a finite set of concept and role names

### Modules
Let T be a TBox. A subset M of T is called a module of T if $M \models C\sqsubseteq D \leftrightarrow T \models C \sqsubseteq D$, for all concept inclusion $C \sqsubseteq D$ with $sig(C \sqsubseteq D)\subseteq sig(M)$ 

如果只关注M之内的sig，则M和T是等价的，我们就可以在更小规模的M上运算

### General Result
Acyclic EL，不能自己定义自己

Let $M \subseteq O$ be such that $O$ \ $ M$ is an
- acyclic EL terminology such that no A with $A = C$ or $A \subseteq C$ in $O$ \ $M$ is in sig(M)

then M is a module of O

### Discussion of Complexity
Module checking检查子集是不是module，比satisfiablity和Subsumption更难

计算复杂度需要记住
- EL: Exptime-complete
- ALC: 2ExpTime-complete
- ALCQIO: undecidable
- 对EL的Tbox是tractable的

## Versioning
- Syntacitic diff
- Structural diff
- Logical diff

### Syntactic diff
但ontology不能完全基于语义，因为可能只是顺序发生变化，但语义没有变化，此时语法发生了变化，但没有意义

### Structural diff

### Logical diff
这里涉及到了推理，必须经过推理才能得到logical diff

### S-Modules
Let $M\sqsubseteq O$ and S a signature, M is called a s-module of O if $Diff_S(M, O) = \emptyset$

提取S-Module的算法，和前面类似
