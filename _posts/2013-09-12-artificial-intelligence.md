---
layout: post
title:  "Artificial Intelligence: Heuristics"
date:   2013-09-12 12:45:00
categories: [notes, artificial intelligence]
---

## Solving the Sliding Puzzle

Heuristic 1: count the number of misplaced tiles.<br>
Heuristic 2: sum of distance by which each tile is out of place.<br>
Heuristic 3: multiply the number of tile reversals by two.<br>

```
2 8 3  H1: 5
1 6 4  H2: 6
- 7 5  H3: 0

2 8 3  H1: 3
1 - 4  H2: 4
7 6 5  H3: 0

2 8 3  H1: 5
1 6 4  H2: 6
7 5 -  H3: 0
```