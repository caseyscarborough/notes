---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-27 14:10:00
categories: [notes, software engineering]
---

# White Box & Control Flow Testing

## Resources

* [Powerpoint Slides](https://www.dropbox.com/s/d7tmi3pal1aio67/0.7.1.TestingCase.WhiteBox.ControlFlowTesting.pptx)



## Path Selection Criteria

* Program paths are selectively executed.
* Question: What paths do I select for testing?
* The concept of path selection criteria is used to answer the question.
* Advantages of selecting paths based on defined criteria:
  * Ensure that all program constructs are executed at least once.
  * Repeated selection of the same path is avoided.
  * One can easily identify what features have been tested and what not.
* Path selection criteria
  * Select all paths.
  * Select paths to achieve complete statement coverage.
  * Select paths to achieve complete branch coverage.
  * Select paths to achieve predicate coverage.

## Branch Coverage Criteria

>  _Branch Coverage requires that each branch will have been traversed, and that every program entry point will have been taken, at least once._

* A branch is an outgoing edge from a node in a CFG.
  * A condition node has two outgoing branches – corresponding to
the True and False values of the condition.
* Covering a branch means executing a path that contains the branch.
* 100% branch coverage means selecting a set of paths such that each branch is included on some path.
* Also known as _Edge Coverage_.
* Ignores branches within boolean expressions which occur due to short- circuit operators

My thoughts on today's lecture:

<img src="http://i.imgur.com/qh14c.gif">

## Generating Test Input

* Having identified a path, a key question is how to make the path execute, if possible.
  * Generate input data that satisfy all the conditions on the path.
* Key concepts in generating test input data
  * Inputvector
  * Predicate
  * Path condition
  * Predicateinterpretation
  * Path predicate expression
  * Generating test input from path predicate expression

### Input vector

* An input vector is a collection of all data entities read by the routine whose values must be fixed prior to entering the routine.
* Members of an input vector can be as follows. • Input arguments to the routine
  * Global variables and constants
  * Files
  * Contents of registers (in Assembly language programming)
  * Network connections
  * Timers

### Predicate

* A predicate is a logical function evaluated at a decision point.
* Example: ti < AS is a predicate in node 3.
* Example: The construct OB is a predicate in node 5.

### Path predicate

* A path predicate is the set of predicates associated with a path.
* An example path
  * 1-2-3(T)-4(T)-5-6(T)-7(T)-8-9-3(F)-10(T)-12-13.

The path predicate for the path shown in Figure 4.10.

```
ti < AS          ≡ True
value[i] != -999 ≡ True 
value[i] >= MIN  ≡ True 
value[i] <= MAX  ≡ True 
ti < AS          ≡ False
tv > 0           ≡ True