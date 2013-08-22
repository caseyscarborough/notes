---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-22 14:10:00
categories: [notes, software engineering]
---

# Testing Conventional Application

## Testability

* __Operability__—it operates cleanly
* __Observability__—the results of each test case are readily observed
* __Controllability__—the degree to which testing can be automated and optimized
* __Decomposability__—testing can be targeted
* __Simplicity__—reduce complex architecture and logic to simplify tests
* __Stability__—few changes are requested during testing
* __Understandability__—of the design

## What is a __Good__ Test?

* A good test has a high probability of finding an error.
* A good test is not redundant.
* A good test should be “best of breed.”
* A good test should be neither too simple nor too complex.

## Exhaustive Testing

<p align="center">
  <img src="/img/exhaustive-testing.png">
</p>

## Selective Testing

<p align="center">
  <img src="/img/selective-testing.png">
</p>

## Black-Box Testing

<p align="center">
  <img src="/img/black-box-testing.png">
</p>

* How is functional validity tested?
* How is system behavior and performance tested?
* What classes of input will make good test cases?
* Is the system particularly sensitive to certain input values?
* How are the boundaries of a data class isolated?
* What data rates and data volume can the system tolerate?
* What effect will specific combinations of data have on system operation?


## White-Box Testing

* Testing based on _analysis of internal logic_ (design, code, etc.). (But _expected results_ still come from requirements.)
* Also known as _structural testing_.
* White-box testing concerns techniques for _designing_ tests.

Dr. Qu changes the slides too quickly. So I didn't get the rest of these points.

<p align="center">
  <img src="http://www.reactiongifs.com/wp-content/uploads/2013/02/GIF.gif">
</p>

## Cyclomatic Complexity

C is what McCabe calls the _Cyclomatic Complexity_ of a program.

<img src="http://latex.codecogs.com/gif.latex?%5Chuge%20v%20%3D%20e%20-n%20&plus;%202">

v: Complexity
e: Edges in Control Form Diagram
n: Nodes in Control Form Diagram

