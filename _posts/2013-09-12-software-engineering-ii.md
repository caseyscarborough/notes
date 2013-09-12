---
layout: post
title:  "Software Engineering: System Integration Testing"
date:   2013-09-12 14:10:00
categories: [notes, software engineering]
---

## Test Case Design Based on Intuition and Experience

* Also known as Error Guessing, Ad Hoc Testing, Artistic Testing, etc.
* Testers utilize intuition and experience to identify potential errors and design test cases to reveal them.
* Guidelines:
  * Design tests for reasonable but incorrect assumptions that may have been made by developers.
  * Design tests to detect errors in handling special situations or cases.
  * Design tests to explore unexpected or unusual program use or environmental scenarios.

Testing based on intuition and experience can be extremely effective. Test plans should reflect the explicit allocation of resources for this activity. Using intuition and experience, identify tests you would want to design for a subroutine that is to input and sort a list of strings based on a user-specified field.

# System Integration Testing

## Resources

* [PPT Slides](https://www.dropbox.com/s/xaf9qiq1mp12tq4/System%20Integration%20Testing.pptx)

## System Integration Techniques

* Common approaches to perform system integration testing
* Incremental
* Top-down
* Bottom-up
* Sandwich
* Big-bang

Pre-requisite:<br>
* A module must be available to be integrated
* A module is said to available for combining with other modules when the module’s check-in request form is ready

## Incremental

* A software image is a compiled software binary
* A build is an interim software image for internal testing within an organization
* Constructing a build is a process by which individual modules are integrated to form am interim software image.
* The final build is a candidate for system testing
* Constructing a software image involves the following activities
  * Gathering the latest unit tested, authorized versions of modules
  * Compiling the source code of those modules
  * Checking in the compiled code to the repository
  * Linking the compiled modules into subassemblies
  * Verifying that the subassemblies are correct
  * Exercising version control
* Integration testing is conducted in an incremental manner as a series of test cycles
* In each test cycle, a few more modules are integrated with an existing and tested build to generated larger builds
* The complete system is built, cycle by cycle until the whole system is operational for system-level testing.
* The number of SIT cycles and the total integration time are determined by the following parameters:
  * Number of modules in the system
  * Relative complexity of the module (cyclomatic complexity)
  * Relative complexity of the interfaces between the modules
  * Number of modules needed to be clustered together in each test cycle
  * Whether the modules to be integrated have boon adequately tested before
  * Turnaround time for each test-debug-fix cycle
* A release note containing the following information accompanies a build.
  * What has changed since the last build?
  * What outstanding defects have been fixed?
  * What are the outstanding defects in the build?
  * What new modules, or features, have been added?
  * What existing modules, or features, have been enhanced, modified, or deleted?
  * Are there any areas where unknown changes may have occurred?
* A test strategy is created for each new build and the following issues are addressed while planning a test strategy
  * What test cases need to be selected from the SIT test plan?
  * What previously failed test cases should now be re-executed in order to test the fixes in the new build? 
  * How to determine the scope of a partial regression tests?
  * What are the estimated time, resource deman, and cost to test this build?
* Creating a daily build is very popular among many organization
  * It facilitates to a faster delivery of the system
  * It puts emphasis on small incremental testing
  * It steadily increases number of test cases
  * The system is tested using automated, re-usable test cases
  * An effort is made to fix the defects that were found within 24 hours
  *  Prior version of the build are retained for references and rollback
  * A typical practice is to retain the past 7-10 builds


## Top Down

[http://en.wikipedia.org/wiki/Top-down\_and\_bottom-up_design](http://en.wikipedia.org/wiki/Top-down_and_bottom-up_design)

* Start from the top node, breadth-first.

* Advantages
  * The SIT engineers continually observe system-level functions as the integration process continue
  * Isolation of interface errors becomes easier because of the incremental nature of the top-down integration
  * Test cases designed to test the integration of a module M are reused during the regression tests performed after integrating other modules

* Disadvantages
  * It may not be possible to observe meaningful system functions because of an absence of lower level modules and the presence of stubs.
  * Test case selection and stub design become increasingly difficult when stubs lie far away from the top-level module.

## Bottom Up

* Start from the deepest nodes, depth-first.

* Advantages
  * One designs the behavior of a test driver by simplifying the behavior of the actual module
  * If the low-level modules and their combined functions are often invoked by other modules, then it is more useful to test them first so that meaningful effective integration of other modules can be done

* Disadvantages
  * Discovery of major faults are detected towards the end of the integration process, because major design decision are embodied in the top-level modules
  * Test engineers can not observe system-level functions from a partly integrated system. In fact, they can not observe system-level functions until the top-level test driver is in place

## Big-bang and Sandwich

* Big-bang Approach
  * First all the modules are individually tested
  * Next all those modules are put together to construct the entire system which is tested as a whole
* Sandwich Approach
  * In this approach a system is integrated using a mix of top-down, bottom-up, and big-bang approaches
  * A hierarchical system is viewed as consisting of three layers
  * The bottom-up approach is applied to integrate the modules in the bottom-layer
  * The top layer modules are integrated by using top-down approach
  * The middle layer is integrated by using the big-bang approach after the top and the bottom layers have been integrated
