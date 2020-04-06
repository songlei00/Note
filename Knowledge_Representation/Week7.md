# Week7 OWL API
## OWL Axiom
Ontology中的entity包含不同的元素，例如class，datatype，知识图谱、RDF中entity则是对应ontology中的individual

Pretege中的
DataProperty,例如一个人的年龄hasAge
ObjectProperty，例如isPartOf，hasPart

## 使用java
### 1. 创建maven的project
Maven在依赖性管理上比较方便(也许要学一学java了)，只需要import使用的包就可以了
然后新建maven project就可以了，group id是公司名称，artifact id是项目名称，然后修改为JVM13
### 2. API使用
#### Manager
程序首先必须有一个OWLOntologyManager，这个可以理解为一个管理的类，所有的东西都必须用他管理
``` java
OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
```

#### 创建Ontology
``` java
OWLOntology o1 = manager.createOntology();
```
