# ALC的扩展
## 1. 可终止性
Blocking

## 2. Soundness 正确性

Soundness正确性：通过tableaux得出时satisfiable的，那他真的是satisfiable的

Completeness完备性：只要真实为satisfiable的，一定能算出来

## 3. Extending ALC
### 1. Qualified Number Restrictions
$\leq n\ r.C, \geq n\ r.C$

增加之后会增加Q，ALCQ

不增加的话，可能会出现表达力不够的问题

Unqualified number restrictions，即ALCN，ALCQ是包含ALCN的。ALCN里面，r后面必须是True，但ALCQ中，可以是任意的C

在DL lite中，也有数量限制的语法的，但必须形式是$\leq n\ r.T$，range必须是T而不能是任意的concept

### 2. Inverse Roles
添加inverse role

ALCI

el本身是tacticable的，但扩展了inverse后，会到指数

C Included In exists r.D
query:exists r.D
得到C
r设定为inverse role
exists r-.C
得到D

C Included In exists r.D => D Included In exists r-.C 不成立，可以用tableaux证明

r(a,b) = r-(b,a)如果是individual，就可以成立

### 3. Transitive Roles and Role hierarchies
加入ALC+transitive => s ALCS

需要注意isPartOf不是transitive的关系

### 4. Role hierarchy
增加hierarchy后：ALCH

例子：$hasSon \sqsubseteq hasChild$

同时增加transitive role和role hierarchy后，扩展为ALCSH

### 5. Nominals
ALCO

Nominal:只有一个元素的集合

注意：和individual不同，individual指的是论语中的元素。Nominal是包含单个元素的集合，是concept，不是individual

简写可以写两个

好处，比如法国公民的表示，法国是individual，可以写成$\exists citizen\ of\ \{France\}$

### 6. SHOIQ
扩展了上面五种后，叫做SHOIQ