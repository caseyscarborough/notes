---
layout: post
title:  "Artificial Intelligence"
date:   2013-08-15 12:45:00
categories: [notes, artificial intelligence]
---

## Chapter 2

### Agents and Environments

* An __agent__ is anything that can be viewed as perceiving its __environment__ through __sensors__ and acting upon that __environment__ through __actuators__.
* An __agent__ could be a human, a software program, a thermostat, a robot, etc.
* A human agent has eyes, ears, and other organs for __sensors__ and hands, legs, vocal tract, for __actuators__.
* __Actuators__ are used to act on the environment based on the sensor data.
* We use the term __percept__ to refer to the agent's perceptual inputs at any given instant.
* An agent's __percept sequence__ is the complete history of everything the agent has ever perceived.
* An agent's behavior is described by the __agent function__ that maps any given percept sequence to an action. The agent function is what the agent will do based on a previous perception.
* The _agent function_ is an abstract mathematical description, the _agent program_ is a concrete implementation, running with some physical systems.

To illustrate these concepts, we use the vaccuum cleaner world. It has two locations, _A_ and _B_. It perceives which location it's in and whether it's clean or dirty. If it's dirty, it _sucks_, if it is clean, it _moves_ to the other location.

<p align="center">
  <img src="http://caseyscarborough.github.io/class-notes/images/20130815-artificial-intelligence.png">
</p>

### Good Behavior

* A __rational agent__ is one that does the right thing--conceptually speaking, every entry in the table for the agent function is filled out correctly.
* What is the right thing?
  * We determine this by considering the _consequences_ of the agent's behavior.
  * An agent generates actions on an environment based on the percepts it gets. If the sequence produced by these actions is desirable, then the agent has performed well.
  * This notion of _desirability_ is captured by a __performance measure__ that evaluates any given sequence of _environment states_.

#### Rationality

What is rational depends on four things: 
* The performance measure that defines the criterion fo success.
* The agent's prior knowledge of the environment.
* The actions that the agent can perform.
* The agent's percept sequence to date.

This leads to a definition of a rational agent:
> _For each possible percept sequence, a rational agent should select an action that is expected to maximize its performance measure, given the evidence provided by the percept sequence and whatever built-in knowledge the agent has._

We need to be careful to distinguish between rationality and __omniscience__, which means it knows the _actual_ outcome of its actions and can act accordingly. This is impossible in reality.

Rationality maximizes _expected_ performance, while perfection maximizes _actual_ performance.

### The Nature of Environments

__Task environments__ are essentially the _problems_ to which the rational agents are the _solutions_.

We can describe a performance measure by using the PEAS (Performance, Environment, Actuators, and Sensors) description.

<p align="center">
  <img src="http://caseyscarborough.github.io/class-notes/images/20130815-artificial-intelligence-2.png">
</p>

We must determine the __performance measure__ to which we would like our automated taxi driver to aspire.

Desirable qualities include:
* Getting to the correct destination
* Minimizing fuel consumption and wear and tear
* Minimizing trip time or cost
* Minimizing violations of traffic laws and disturbances
* Maximizing passenger safety and comfort
* Maximizing profits

## To Do

* Quiz on Chapters 1 and 2 next Thursday, Aug. 22, 2013.