# Knowledge Acquisition
表示这一章好乱。。。好像没有什么重点
## 1. 什么是KA
KA is the transfer of declarative statements from source to sink
- Source：领域专家，他们对领域内的知识知道很多，并且很准确，知道如何准确详细地表达这些知识，有metaknowledge
- Immediate Sink，用自然语言或半自然语言描述的文本
- Ultimate Sink，A document encoded in a formal/actionable KR language. I.e., an OWL Ontology!

KA的过程就是要将领域专家所描述的知识，转化为机器能够直接处理的形式化的语言知识， This KA is often called Knowledge Elicitation
![20200314105600.png](https://raw.githubusercontent.com/s974534426/img_for_notes/master/20200314105600.png)

## 2. Eliciting Knowledge
我们可以要求专家DE将知识写下来，但这样存在一些问题
- 他们知道的太多了
- 很多知识也许会用到，但却不嗯给你准确想起
- 他们对应用的目标等等知道的过少，需要从特定的角度去解释，但DE不太了解应该从这个角度
- 过于昂贵

### KE Knowledge Engineer
和DE相对，KE是KA方面的专家，知道target formalism，知道如何进行知识的开发，但不一定是领域方面的专家

### Elicitation Technique Requirements 做KA的要求
- 最小化DE需要的时间
- 减少DE所需要的KE的知识
- 支持multiple sources，多个DE可能理解不同，如何达成一致
- KEs must understand enough，KE也需要对domain的知识有一些了解
- Always assume DE not invested

## 3. Elicitation Techniques
### Pre-representation 形成协议
- Starting point! Experts interact with a KE
- Focused on “protocols”
- Protocol-generation
  - Interview，可以一问一答，提出一些问题，由DE回答等等
- Protocol-analysis
  - 得到视频或文字后，如何转化为最终形式

Protocol：协议，是DE和KE之间的一个协议，对每个人的分工，知识需要表示为什么形式达成一致

### Post-representation (modelling) 形成协议后的调整
- Experts interact with a (proto)representation (& KE)
- Testing and generating

#### Modelling Technology
主要讲分类方法
1. Being picky
2. Sorting techniques，用于找到人们比较和排序概念的方式，能够揭示类别、性质、优先级等等知识
3. Hierarchy-generation techniques，建立层级关系
4. Matrix based techniques，
5. Limited-information and constrained-processing tasks，限制DE的时间或获得的信息
Card Sorting，将卡片分为一堆，然后对每堆进行辨别(这里可能引出新的概念)，
3 Card Trick，随机挑选三张，找出其中更加相似的两张

最终得到的知识需要不断删减，改进Winnowing

## 4. Task，以sushi menu为例，该怎么做KA
1. Capture，(Look at the Menu)
2. Extract，(List of terms， put them on cards)
3. Organise, (Hierarchy)
4. Encode,(OWL in protege)

由DE完成前三步，KE完成最后一步
