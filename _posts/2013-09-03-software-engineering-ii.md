---
layout: post
title:  "Software Engineering: Data Flow Graphs"
date:   2013-09-03 14:10:00
categories: [notes, software engineering]
---

## Resources

* [Powerpoint Slides](https://www.dropbox.com/s/54dg9i2874iyf8s/0.7.2.TestingCase.WhiteBox.DataFlowTesting.pptx)

## Data Flow Graph

A data flow graph is a directed graph constructed as follows.

* A sequence of __definitions__ and __c-uses__ is associated with each __node__ of the graph.
* A set of __p-uses__ is associated with each __edge__ of the graph. 
* The entry node has a definition of each edge parameter and each nonlocal variable used in the program.
* The exit node has an undefinition of each local variable.

See the following function used to compute the average of selected integers in an array.

```c#
public static double ReturnAverage(int value[], int AS, int MIN, int MAX){
    int i, ti, tv, sum;
    double av;
    i = 0; ti = 0; tv = 0; sum = 0;

    while (ti < AS && value[i] != -999) {
        ti++;
        if (value[i] >= MIN && value[i] <= MAX) {
            tv++;
            sum = sum + value[i]; 
        }
        i++;
    }

    if (tv > 0) {
        av = (double) sum/tv;
    } else {
        av = (double) -999;
    }

    return av;
}
```

__Solution__:

<p align="center">
  <img src="/img/data-flow-graph.png">
</p>

__Draw a Data Flow Graph for the following:__

```java
public static void BubbleSort( int[] num ) {
  int j;
  boolean flag = true;
  int temp;

  while(flag) {
   
    flag = false;
    for(j=0; j < num.length - 1; j++) {
      
      if (num[j] < num[j+1]) {
        temp = num[j];
        num[j] = num[j+1];
        num[j+1] = temp;
        flag = true;
      }
    }
  }
}
```

### Variable Definitions and Uses

* A program variable is __DEFINED__ when it appears:
  * on the left hand side of an assignment statement (e.g., Y := 17)
  * in an input statement (e.g., input(Y))
  * as an OUT parameter in a subroutine call (e.g., DOIT(X:IN,Y:OUT))  

* A program variable is __USED__ when it appears:
  * on the right hand side of an assignment statement (e.g., Y := X+17)
  * as an IN parameter in a subroutine or function call (e.g., Y := SQRT(X))
  * in the predicate of a branch statement (e.g., if X>0 then...)

### Data Flow Terms

__Global c-use__: A c-use of a variable x in node i is said to be a global c-use
if x has been defined before in a node other than node i.

* Example: The c-use of variable tv in node 9 is a global c-use.

__Definition clear path__: A path (i – n1 – ... nm – j), m ≥ 0, is called a definition clear path (def-clear path) with respect to variable x

* from node i to node j, and from node i to edge (nm, j),
* if x has been neither defined nor undefined in nodes n1 – ... nm.
  * Example:(2–3–4–6–3–4–6–3–4–5)is a def-clear path w.r.t. tv in
  * Example:(2–3–4–5) and (2–3–4–6) are def-clear paths w.r.t. variable tv from node 2 to 5 and from node 2 to 6, respectively.

  
__A complete path is a path that contains the START NODE and the END NODE.__