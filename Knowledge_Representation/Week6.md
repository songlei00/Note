# Week6 Patterns

## 1. Patterns of axioms
Patterns就类似一个模板，方便建造ontology

**这里有一个比较重点的是**：在ontology中，有一个open world assumption，如果一件事情没有在O中说明，则他有可能是真的，也可能是假的。在推理时，不能带上自己的主观看法，而是要完全根据所给信息推理。与之对应的是closed world assumption，没有提到的都认为是错的

Patterns包括
- Naming Patterns
- Logical Patterns
- Content Patterns

### 1. Naming Patterns
命名规则
命名：class name一般用单数，首字母大写，多个词时要用驼峰法；individual全部小写，不同单词用下划线划分；Property name首字母小写，用驼峰结构
所有的classes和individuals都要有label，creator，也就是有合适的注释

### 2. Logical Patterns
逻辑层面
1. Property Closure Pattern
用来说明某个class只由一些东西构成
```
Class A
    SubClassOf ...
        P some B1
        ...
        P some Bn
        P only (B1 or ... or Bn)
```

2. Covering Pattern
Class X is covered by classes Y1, ... Yk
```
Class Y1 SubClassOf X
...
Class Yk SubClassOf X
Class X SubClassOf (Y1 or ... or Yk)
```

3. Partitions Pattern
任何X中的元素都是Yi中的元素并且**只能是其中一个**
比前面多一个disjoint，就是disjoint和covering一起用
```
Class Small SubClassOf Size
Class Medium SubClassOf Size
Class Large SubClassOf Size
DisjointClasses: Small, Midium, Large
Class Size SubClassOf (Small or Medium or Large)
```

4. Entity Property Quality Pattern
![20200408110141](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408110141.png)

5. 还有很多。。。

### 3. Content Patterns
内容层面
#### Properties
1. Inverse
2. Number restrictions，比如exactly 4

#### Possible Properties of Part-Whole Relations(P-W-R)
主要是构建Ontology时，如何准确选取，不能全用isPartOf，要不然会不准确
主要从三个方面区分
- functional
- homeomerous，这部分和其他部分是否是一样的
- invariant，去掉这一部分后，原来的整体还是那个整体吗

1. isComponentOf，functional，non-homeomeric,separable
2. isIngredientOf,non-functional, non-homeomeric, non-separable，比如卡布奇诺中的牛奶，面包中的面粉
3. isPortionOf，non-functional, homeomeric, separable，面包中的一片
4. isSpatialPartOf，non-functional, homeomeric, non-separable,比如南京和中国的关系
5. isMemberOf，non-funcional, non-homeomeric, separable, 比如树和森林

![20200408120359](https://raw.githubusercontent.com/s974534426/Img_for_notes/master/20200408120359.png)

## 2. Competency Questions(CQ)
一方面可以帮助设计，提出一些顾客会问的问题，在设计Ontology的时候就需要考虑进去
一方面可以测试Ontology，提出一些问题，看Ontology能不能回答之类
