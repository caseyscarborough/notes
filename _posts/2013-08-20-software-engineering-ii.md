---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-20 14:10:00
categories: [notes, software engineering]
---

## Resources

* [Lecture Slides](https://www.dropbox.com/s/g3ej3jz0yekp427/0.3.SWE.TestingStrategies.Chapter_17.ppt)

## Software Testing Strategies

Testing is the process of exercising a program with the specific intent of finding errors prior to delivery to the end user.

### What Testing Shows

* Errors
* Requirements conformance
* Performance
* An indication of quality

<p align="center">
  <img src="/img/se-1.jpg">
</p>

### Strategic Approach

* To perform effective testing, you should conduct effective technical reviews. By doing this, many errors will be eliminated before testing commences.
* Testing begins at the component level and works "outward" toward the integration of the entire computer-based system.      
* Different testing techniques are appropriate for different software engineering approaches and at different points in time.
* Testing is conducted by the developer of the software and (for large projects) an independent test group.
* Testing and debugging are different activities, but debugging must be accommodated in any testing strategy. 

Typically, the development used in modern day uses a test driven development cycle, where the developer writes the code and the tests simultaneously.

### Who tests the software?

<p align="center">
  <img src="/img/se-2.png">
</p>

### Testing Strategy

<p align="center">
  <img src="/img/se-3.png">
</p>

We begin by _testing-in-the-small_ and move toward _testing-in-the-large_.

__For conventional software__:

* The module (component) is our initial focus
* Integration of modules follows

__For OO software__:

* Our focus when _testing in the small_ changes from an individual module (the conventional view) to an OO class that encompasses attributes and operations and implies communication and collaboration

Dr. Qu points out the following image:

<p align="center">
  <img src="/img/richards-guide-to-se.jpeg">
</p>

## Unit Testing

<p align="center">
  <img src="/img/se-4.png">
</p>

<p align="center">
  <img src="/img/se-5.png">
</p>

## Unit Test Environment

<p align="center">
  <img src="/img/se-6.png">
</p>

## Integration Testing Strategies

Options:

* the _big bang_ approach
* an incrememntal construction strategy

### Top Down Integration

<p align="center">
  <img src="/img/top-down-integration.png">
</p>

### Bottom Up Integration

<p align="center">
  <img src="/img/bottom-up-integration.png">
</p>

### Sandwich Testing

<p align="center">
  <img src="/img/sandwich-testing.png">
</p>

## Regression Testing

* __Regression testing__ is the re-execution of some subset of tests that have already been conducted to ensure that changes have not propagated unintended side effects
* Whenever software is corrected, some aspect of the software configuration (the program, its documentation, or the data that support it) is changed. 
* Regression testing helps to ensure that changes (due to testing or for other reasons) do not introduce unintended behavior or additional errors.
* Regression testing may be conducted manually, by re-executing a subset of all test cases or using automated capture/playback tools.

## Smoke Testing

A common approach for creating _daily_ or _nightly builds_ for product software. 

Smoke testing steps:

* Software components that have been translated into code are integrated into a “build.” 
* A build includes all data files, libraries, reusable modules, and engineered components that are required to implement one or more product functions.
* A series of tests is designed to expose errors that will keep the build from properly performing its function. 
* The intent should be to uncover “show stopper” errors that have the highest likelihood of throwing the software project behind schedule.
* The build is integrated with other builds and the entire product (in current form) is smoke tested daily. 
* The integration approach may be top down or bottom up.* 


## Object Oriented Testing

Begins by evaluating the correctness and consistency of the analysis and design models.

Testing strategy changes:

* the concept of the ‘unit’ broadens due to encapsulation
* integration focuses on classes and their execution across a ‘thread’ or in the context of a usage scenario
* validation uses conventional black box methods

Test case design draws on conventional methods, but also encompasses special features

## OO Testing Strategy

__Class testing is the equivalent of unit testing__:

* operations within the class are tested
* the state behavior of the class is examined

__Integration applied three different strategies__:

* thread-based testing—integrates the set of classes required to respond to one input or event
* use-based testing—integrates the set of classes required to respond to one use case
* cluster testing—integrates the set of classes required to demonstrate one collaboration


## Web Application Testing

* The content model for the WebApp is reviewed to uncover errors. 
* The interface model is reviewed to ensure that all use cases can be accommodated. 
* The design model for the WebApp is reviewed to uncover navigation errors. 
* The user interface is tested to uncover errors in presentation and/or navigation mechanics.
* Each functional component is unit tested.
* Navigation throughout the architecture is tested. 
* The WebApp is implemented in a variety of different environmental configurations and is tested for compatibility with each configuration. 
* Security tests are conducted in an attempt to exploit vulnerabilities in the WebApp or within its environment.
* Performance tests are conducted.
* The WebApp is tested by a controlled and monitored population of end-users. The results of their interaction with the system are evaluated for content and navigation errors, usability concerns, compatibility concerns, and WebApp reliability and performance.

## High Order Testing

* Validation testing
  * Focus is on software requirements
* System testing
  * Focus is on system integration
* Alpha/Beta testing
  * Focus is on customer usage
* Recovery testing
  * forces the software to fail in a variety of ways and verifies that recovery is properly performed
* Security testing
  * verifies that protection mechanisms built into a system will, in fact, protect it from improper penetration
* Stress testing
  * executes a system in a manner that demands resources in abnormal quantity, frequency, or volume
* Performance Testing
  * test the run-time performance of software within the context of an integrated system


