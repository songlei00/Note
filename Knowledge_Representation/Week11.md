# Week11
## 1. DL-lite: the terminological part
不是ALC的扩展,因为forall不在里面,是EL的扩展,EL是DL lite的子集,???后半句好像不太对

### 1. 语法
在语法上，有thing，nothing，and，exist，和数量限制$\geq n$，inverse role

在DL lite中r后面必须是true，即$\exists r. T$ 重要!!! light，在EL中，后面是可以为任意的concept

我认为我们没有把DL lite和EL合并为一种语言主要是在一些情况下，EL的表达力已经足够表达我们的任务，此时的推理也是tractable，没有必要用DL lite，只有在我们需要更强的表达力的时候，才应该考虑用DL lite等等

### 2. Domain Restriction
主语domain，谓语range

形式：$\exists r. T \sqsubseteq C$

表达的含义是：everything is done by something is something

例子：exerybody who manages something is a manager, $\exists manages. T \sqsubseteq Manager$

### 3. Range Restriction
形式：$\exists r^-. T \sqsubseteq C$

例子：everything that is managed by something is a project,  $\exists manages^-.T\sqsubseteq Project$

**DL lite不能表达Covering constraint，比如every Projectmanager is Visting Staff or AcademicStaff**，因为没有$\cup$

## 2. DL lite with or
DL-lite with or is an extersion of DL-lite，能够表达covering
 constraints，但加入or之后，复杂度变高

Checking satisfiability in DL-Lite with “or” is NP-complete. Checking subsumption is coNP-complete

## 2. Background on Decidability and Complexity
### 1. Decidability
对问题$T\models C \sqsubseteq D$，存在对任意的TBox $T$和concept在有限步后终止的算法

在前面讨论的，DL lite family，ALC和ALC的各种扩展，都是decidable的。

对一阶逻辑，基础的推理问题不是decidable的，这也是为什么一节逻辑没有被用于Ontology language的原因，一阶逻辑在命题为false时一定能推理出来，所以是sem-decidiable 

### 2. complexity
Tractable：存在多项式时间算法