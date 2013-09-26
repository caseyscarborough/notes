---
layout: post
title:  "Software Engineering: Homework Review"
date:   2013-09-24 14:10:00
categories: [notes, software engineering]
---

## Homework 1 Review

#### Problem 1
Draw a control flow graph for the following sample code. Determine the cyclomatic complexity of the graph.

```ruby
sum_of_all_positive_numbers(a, num_of_entries, sum) 
  sum = 0
  init = 1
  while(init <= num_of_entries)
    if a[init] > 0
      sum = sum + a[init]
    endif
    init = init + 1 
  endwhile
end sum_of_all_positive_numbers
```

<img src="/img/hw1-1.png">


```c++
int binsearch(int X, int V[], int n){ int low, high, mid;
  low = 0;
  high = n ‐ 1;
  while (low <= high) {
    mid = (low + high)/2; 
    if (X < V[mid])
      high = mid ‐ 1; 
    else if (X > V[mid])
      low = mid + 1; 
    else
      return mid; 
  }
  return ‐1;
}
```

1. Draw a CFG for binsearch().
2. From the CFG, identify a set of entry–exit paths to satisfy the complete statement coverage criterion. 3. Identify additional paths, if necessary, to satisfy the complete branch coverage criterion.
4. For each path identified above, derive their path predicate expressions.
5. Solve the path predicate expressions to generate test input and compute the corresponding expected outcomes.
6. Are all the selected paths feasible? If not, select and show that a path is infeasible, if it exists.

<img src="/img/hw1-2.png">

#### Predicate Expressions

Path:

low <= high = T<br>
X < V[mid] = F<br>
X > V[mid] = F<br>

Substitute values:<br>
0 < (n-1) = T
X < V[(n-1)/2] = F
X > V[(n-1)/2] = F


All def criteria is 

Find a global definition of the node, and find a c-use and there is a def-clear path between the nodes.
