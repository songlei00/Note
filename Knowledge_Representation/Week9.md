## 1. 可终止性

Blocking

## 2. Soundness 正确性

Soundness正确性：通过tableaux得出时satisfiable的，那他真的是satisfiable的

Completeness完备性：只要真实为satisfiable的，一定能算出来

## 3. Extending ALC
### 1. Qualified Number Restrictions
增加之后会增加Q，ALCQ

不增加的话，可能会出现表达力不够的问题

Unqualified number restrictions，即ALCN，ALCQ是包含ALCN的。ALCN里面，r后面必须是True，但ALCQ中，可以是任意的C

### 2. Inverse Roles
ALCI
C Included In exists r.D
query:exists r.D
得到C
r设定为inverse role
exists r-.C
得到D

C Included In exists r.D => D Included In exists r-.C 不成立，可以用tableaux证明

r(a,b) = r-(b,a)如果是individual，就可以成立

el本身是tacticable的，但扩展了inverse后，会到指数

### 3. Transitive Roles and Role hierarchies
加入ALC+transitive => s ALCS

需要注意isPartOf不是transitive的关系

增加hierarchy后：ALCH

ALCSH

### 4. Nominals
ALCO

和individual不同，individual指的是论语中的元素

Nominal是包含单个元素的集合，是concept，不是individual，简写可以写两个

好处，比如法国公民如何表示，法国是individual，

### 5. SHOIQ
