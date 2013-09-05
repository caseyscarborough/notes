---
layout: post
title:  "Artificial Intelligence: Uninformed Search Strategies"
date:   2013-09-03 12:45:00
categories: [notes, artificial intelligence]
---

## Uninformed Search Strategies

### Breadth-first Search

__Breadth-first search__ is a simple strategy in which the root node is expanded first, then all the successors of the root node are expanded next, then their successors, and so on. In general, all the nodes are expanded at a given depth in the search tree before any nodes at the next level are expanded.

* Time complexity:<br><img src="http://latex.codecogs.com/png.latex?%5Cdpi%7B120%7D%20%5Clarge%20O%28b%5Ed%29">
* Space complexity:<br><img src="http://latex.codecogs.com/png.latex?%5Cdpi%7B120%7D%20%5Clarge%20O%28b%5Ed%29">

### Depth-first Search

__Depth-first search__ always expands the deepest node in the current frontier of the search tree (see below). The search proceeds immediately to the deepest level of the search tree, where the nodes have no successors. As those nodes are expanded, they are dropped from the frontier, so then the search “backs up” to the next deepest node that still has unexplored successors.

<p align="center">
  <img src="/img/depth-first-search.png">
</p>

* Time complexity:<br><img src="http://latex.codecogs.com/png.latex?%5Cdpi%7B120%7D%20%5Clarge%20O%28b%5Em%29">
* Space complexity:<br><img src="http://latex.codecogs.com/png.latex?%5Cdpi%7B120%7D%20%5Clarge%20O%28b%5Ccdot%20m%29">

### Depth-limited Search

The embarrassing failure of depth-first search in infinite state spaces can be alleviated by supplying depth-first search with a predetermined depth limit l. That is, nodes at depth l are treated as if they have no successors. This approach is called __depth-limited search__.

### Iterative deepening depth-first search

__Iterative deepening search__ (or iterative deepening depth-first search) is a general strategy, often used in combination with depth-first tree search, that finds the best depth limit. It does this by gradually increasing the limit—first 0, then 1, then 2, and so on—until a goal is found. This will occur when the depth limit reaches d, the depth of the shallowest goal node. The algorithm is shown in Figure 3.18. Iterative deepening combines the benefits of depth-first and breadth-first search. Like depth-first search, its memory requirements are modest: O(bd) to be precise. Like breadth-first search, it is complete when the branching factor is finite and optimal when the path cost is a nondecreasing function of the depth of the node.

<p align="center">
  <img src="/img/iterative-deepening.png">
</p>

### Bidirectional search

The idea behind __bidirectional search__ is to run two simultaneous searches—one forward from the initial state and the other backward from the goal—hoping that the two searches meet in the middle (Figure 3.20). The motivation is that <img src="http://latex.codecogs.com/gif.latex?b%5E%5Cfrac%7Bd%7D%7B2%7D"> + <img src="http://latex.codecogs.com/gif.latex?b%5E%5Cfrac%7Bd%7D%7B2%7D"> is much less than <img src="http://latex.codecogs.com/gif.latex?b%5Ccdot%20d">, or in the figure, the area of the two small circles is less than the area of one big circle centered on the start and reaching to the goal. Thus, the time complexity of bidirectional search using breadth-first searches in both directions is <img src="http://latex.codecogs.com/gif.latex?O%28b%5E%5Cfrac%7Bd%7D%7B2%7D%29">. The space complexity is also <img src="http://latex.codecogs.com/gif.latex?O%28b%5E%5Cfrac%7Bd%7D%7B2%7D%29">.