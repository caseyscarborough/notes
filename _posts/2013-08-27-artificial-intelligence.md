---
layout: post
title:  "Artificial Intelligence"
date:   2013-08-27 12:45:00
categories: [notes, artificial intelligence]
---

## 3.2 Example Problems

### Vacuum World

The first example we examine is the vacuum world.

<p align="center">
  <img src="/img/vacuum-world.png">
</p>

* __States__: The state is determined by the agent location, and the dirt locations. There are two locations, each of which can be dirty or clean, and can or cannot have the vacuum cleaner in the current location. This gives us 2 * 2^2 = 8 possible world states.
* __Initial state__: Any state can be designed as the initial state.
* __Actions__: In this simple environment, each state has three actions: _Move left_, _move right_, and _suck_.
* __Transition model__: The actions ahve their expected effects, except that moving _Left_ in the leftmost square, _Right_ in the rightmost square, and _Sucking_ in a clean environment have no effect.
* __Goal test__: This checks whether all the squares are clean.
* __Path cost__: Each step costs 1, so the path cost is the number of steps in the path.

### Sliding Puzzle

The Sliding Puzzle is an _NP_ problem. That is,
> A Nondeterministic Polynomial time problem is one that we can quickly determine if a solution exists or not, regardless of how long it will take to get to the solution.

<p align="center">
  <img src="/img/sliding-puzzle.png">
</p>

* __States__: A state description specifies the location of each of the eight tiles and the blank in one of the nine squares.
* __Initial state__: Any state can be designated at the initial state. Note that any give goal can be reached from exactly half of the possib;e initial states.
* __Actions__: The simplest formulation defines the actions as movements of the blank space _Left, Right, Up,_ or _Down_. Different subsets of these are possible depending on where the blank is.
* __Transition model__: Given a state and action, this returns the resulting state. For Example, if we apply _Left_ to the start state in the figure above, the resulting state has the 5 and the blank switched.
* __Goal test__: This checks whether the state matches the goal configuration shown in the figure above.
* __Path cost__: Each step costs 1, so the path cost is the number of steps in the path.