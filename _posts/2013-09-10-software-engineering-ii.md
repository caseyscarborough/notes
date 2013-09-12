---
layout: post
title:  "Software Engineering: Black Box Testing"
date:   2013-09-10 14:10:00
categories: [notes, software engineering]
---

# Test Case Design: Black Box

## Resources

* [Powerpoint Slides](https://www.dropbox.com/s/qmx16h6gfogz38h/0.7.4.Test%20case%20design.BlackBox.pptx)

## Definition of Black Box Testing

* Testing based solely on analysis of requirements (specification, user documentation, etc.).
* Also know as functional testing.
* Black-box testing concerns techniques for designing tests; it is not a level of testing.
* Black-box testing techniques apply to all levels of testing (e.g., unit, component, product, and system).

## Black Box testing

* Equivalence partitioning
* Boundary-value analysis
* Cause-Effect graphing
* Error guessing

## Partition Testing

* Also known as _input space partitioning_ and _equivalence partitioning_.
* Can be thought of as exhaustive testing Las Vegas style...
* Idea is to partition the program’s input space based on a (small) number of _equivalence classes_ such that, according to the specification, every element of a given partition would be “handled” (i.e., mapped to an output) “in the same manner.”
* If the program is implemented in such a way that being “handled in the same manner” means that either
  * every element of a partition is mapped to a correct output, or
  * every element of a partition is mapped to an incorrect output,
* then testing the program with just one element from each partition would be _tantamount_ to exhaustive testing.
* Two types of equivalence classes are identified: __valid__ (corresponding to inputs deemed valid from the specification) and __invalid__ (corresponding to inputs deemed erroneous from the specification)
  * Valid would be for instance, passing in a positive double into the following function:<br> `public double getCircleArea(double radius) { ... }`
  * Invalid would be for instace, passing in a negative number or a non-double into the same function.
* In most multi-input cases, classes for individual inputs must be combined in some manner to partition the input space. (E.g., see City Tax Specification below.)
* However, it is sometimes convenient to identify multivariate classes which partition an input space directly.
* Consider the following specification...

## Partition Testing Example
__Program Specification__: An ordered pair of numbers, (x, y), are input and a message is output stating whether they are in ascending order, descending order, or equal. If the input is other than an ordered pair of numbers, an error message is output.

__Equivalence Classes__:<br>
{ (x, y) | x < y } (V) _Valid classes_ <br>
{ (x, y) | x > y } (V) <br>
{ (x, y) | x = y } (V) <br>
{ input is other than an ordered
pair of numbers } (I) _Invalid class_


# Valid (x, y) Input Space

<img src="/img/valid-space.png">


## Partition Testing Example (cont’d)

In this case, being “handled in the same manner” relates directly to the relationship between inputs x and y, so equivalence classes are more naturally defined in terms of (x,y) pairs. 

## Dealing with Complex Multiple-Input Situations

* In the example above, (x, y) input pairs were considered as a unit, yielding a set of disjoint classes partitioning the two-dimensional x, y (valid) input space.
* For more complex specifications, classes are often identified for INDIVIDUAL input variables, or even INDIVIDUAL ATTRIBUTES of individual input variables, yielding sets of possibly overlapping classes. For example...

> _Three numbers, x, y, and z, are input. If x is a whole number and less than 40, and if y is non-negative, the output is z+(y/x). If x is greater than or equal to 40, or if y is positive, or if z is odd and at least as large as x, then the output is..._ 