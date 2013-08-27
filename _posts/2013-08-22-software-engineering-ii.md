---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-22 14:10:00
categories: [notes, software engineering]
---

# Testing Conventional Application

* [Powerpoint Slides](https://www.dropbox.com/s/2uko03vu1cl3gax/chapter_18.ppt)

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


## Definition of White Box Testing
* Testing based on _analysis of internal logic_ (design, code, etc.). (But expected results still come from requirements.)
* Also know as _structural testing_.
* White-box testing concerns techniques for
* signing tests; it is _not a level of testing_.
* White-box testing techniques apply _primarily_ to lower levels of testing (e.g., unit and component).
* Complete path testing is not realistic goal for a program with loops

Dr. Qu changes the slides too quickly. So I didn't get the rest of these points. (All the points are here, I got them later, just thought I'd leave this though)

<p align="center">
  <img src="http://www.reactiongifs.com/wp-content/uploads/2013/02/GIF.gif">
</p>

## Types of Logic Coverage

* __Statement__: each statement executed at least once
* __Branch__: each branch traversed (and every entry point taken) at least once
* __Condition__: each condition True at least once and False at least once
* __Branch/Condition:__ both Branch and Condition coverage achieved
* __Compound Condition__: all combinations of condition values at every branch statement covered (and every entry point taken)
* __Path__: all program paths traversed at least once


## Control Flow Graph

The following function, `ReturnAverage`, computes the average of all the numbers in the input array in the positive range [MIN, MAX]. The maximum size of the array is AS. But, the array size could be smaller than AS in which case the end of input is represented by -999.

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

The following shows the control flow diagram for the above code.

<p align="center">
  <img src="/img/control-flow-diagram.png">
</p>


## Cyclomatic Complexity

C is what McCabe calls the _Cyclomatic Complexity_ of a program.

<img src="http://latex.codecogs.com/gif.latex?%5Chuge%20v%20%3D%20e%20-n%20&plus;%202">

v: Complexity

e: Edges in Control Form Diagram

n: Nodes in Control Form Diagram