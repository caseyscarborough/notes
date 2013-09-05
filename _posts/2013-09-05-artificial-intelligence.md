---
layout: post
title:  "Artificial Intelligence: A∗ Search"
date:   2013-09-05 12:45:00
categories: [notes, artificial intelligence]
---

### A∗ search: Minimizing the total estimated solution cost

The most widely known form of best-first search is called A∗ search (pronounced “A-star search”). It evaluates nodes by combining g(n), the cost to reach the node, and h(n), the cost to get from the node to the goal:

> _f(n) = g(n) + h(n)_

Since g(n) gives the path cost from the start node to node n, and h(n) is the estimated cost
of the cheapest path from n to the goal, we have:

> _f(n) = estimated cost of the cheapest solution through n_

Thus, if we are trying to find the cheapest solution, a reasonable thing to try first is the node with the lowest value of g(n) + h(n). It turns out that this strategy is more than just reasonable: provided that the heuristic function h(n) satisfies certain conditions, A∗ search is both complete and optimal. The algorithm is identical to _UNIFORM-COST-SEARCH_ except that A∗ uses g + h instead of g.

g(n) is the cost from the start node to the current node.
h(n) is the cont from that node to the goal state.

So from Arad to Arad, it will cost f(n) = 0 + 366. From Arad to Sibiu it will cost f(n) = 140 + 253. Etc...

<p align="center">
  <img src="/img/a-star-search.png">
</p>