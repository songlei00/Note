# Ontology
## 1. What is the Semantic Web
语义网络是本体，知识表示的一种应用
RDF(RDF三元组，主语谓语宾语SPO，主语和宾语只能是个体individual)，知识图谱的低层的一种技术支撑
OWL，一种制作ontology的语言，基于描述逻辑，分为Tbox和Abox的部分，Tbox描述框架型知识，与个体没有关系，Abox高度与个体相关。RDF不具备Tbox的部分，在我们现在的阶段，可以理解为是Abox，而OWL则是在RDF的基础上扩展了Tbox
SPARQL，一种查询语言，类似传统数据库中的SQL
## 2. What is an Ontology
完整世界的概念化模型，首先会定义这个领域所有词汇

## 3. Semantics
这里主要讲了一些语义方面的知识
![20200408085722](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408085722.png)
![20200408085754](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408085754.png)

- O is consistent if there exists some model I of O
- O entails $\alpha$，($O $)，左边式子的所有model都满足右边式子
- A is satisfiable。。。，Ontology层面用consistent，class层面用satisfiable

Protege中的推理会做如下的见检查
![20200408091625](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408091625.png)

## 4. OWL和FOL的转化
![20200408092648](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408092648.png)
需要注意的是，最后一个是这种形式：$t_x(r\ only\ C) = \forall y.r(x, y)\rightarrow t_y(C)$

## 5. Object Oriented Formulation
Ontology和面向对象的一些类似之处，比如individual和一个类的实例类似，class和类类似，等等