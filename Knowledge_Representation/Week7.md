# Week7 OWL API
## 1. Main Building Blocks
- OWLOntology
- OWLOntologyManager
- OWLAxiom
  - SubclassOf
  - EquivalentClasses
  - DisjointClasses
- OWLEntity
  - OWLClass
  - OWLObjectProperty
  - OWLDataProperty
  - OWLIndividual

### 1. OWL Entity
Ontology中的entity包含不同的元素，例如classes，properties，individuals，datatypes
知识图谱、RDF中entity则是对应ontology中的individual

### 2. OWL Class
Object Properties，体现了两个individual之间的关系
Data Propertied，体现了individual和某个数据之间的关系，例如hasName，hasAge
Property也要domains和ranges
Object property也可以有一些其他的特性characteristics，例如transitivity和inverse，例如isPartOf，hasPart就是inverse
Data property也有一些特性，例如functional

### 3. OWL Axiom
#### 分类
- Annotation Axioms，比如labels等等，类似于注释，不会对ontology的语义产生影响
- Declaration Axioms
- Import Axioms
- Logical Axioms，逻辑关系，比如supers，equivalences，property characteristics(上面说的那几个)，facts about particular individuals(types, relationships, values)

## 2. 使用java
### 1. 创建maven的project
Maven在依赖性管理上比较方便(也许要学一学java了)，只需要import使用的包就可以了
然后新建maven project就可以了，group id是公司名称，artifact id是项目名称，然后修改为JVM13

### 2. API使用
#### Manager
程序首先必须有一个OWLOntologyManager，这个可以理解为一个管理的类，所有的东西都必须用他管理
``` java
OWLOntologyManager manager = OWLManager.createOWLOntologyManager();
```

#### 添加删除axiom
在Ontology层面管理时，用OWLManager管理，如果要增加删除axiom，需要用DataFactory

#### 简单的例子
其他具体用法可以查阅手册

``` java
// Manager
OWLOntologyManager manager = OWLManager.createOWLOntologyManager();

// Create Ontology
OWLOntology o1 = manager.createOntology();

// Load Ontology from file
File file = new File("/home/songlei/Desktop/code/java/A1-hierarchy-181220049.owl");
OWLOntology pizza = manager.loadOntologyFromOntologyDocument(file);
// System.out.println("pizza: " + pizza);

// Load Ontology from IRI
IRI pizzaIRI = IRI.create("https://protege.stanford.edu/ontologies/pizza/pizza.owl");
OWLOntology pizza2 = manager.loadOntology(pizzaIRI);
// System.out.println("pizza2: " + pizza2);

// Store Ontology
// File output = new File("./PizzaFunctional.owl");
// manager.saveOntology(pizza2, new FunctionalSyntaxDocumentFormat(), new FileOutputStream(output));

// Add and Delete Axiom
IRI iri = IRI.create("https://i.love.aischool");
OWLOntology o = manager.createOntology(iri);
OWLDataFactory df = o.getOWLOntologyManager().getOWLDataFactory();
OWLClass person = df.getOWLClass(iri + "#Person");
OWLClass student = df.getOWLClass(iri + "#Student");
OWLObjectProperty hasChild = df.getOWLObjectProperty(iri + "#hasChild");
OWLDeclarationAxiom da = df.getOWLDeclarationAxiom(person);
OWLSubClassOfAxiom scoa = df.getOWLSubClassOfAxiom(student, person);
OWLEquivalentClassesAxiom eca = df.getOWLEquivalentClassesAxiom(student, df.getOWLObjectSomeValuesFrom(hasChild, student), person);

o.add(da);
o.add(scoa);
o.add(eca);
o.remove(da);
System.out.println("o: " + o);

for(OWLAxiom axiom: o.getAxioms()) {
    System.out.println("axiom: " + axiom);
}

// The number of Ontologies
// System.out.println("manager = " + manager.getOntologies().size());
```
