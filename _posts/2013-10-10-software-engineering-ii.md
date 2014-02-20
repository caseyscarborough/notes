---
layout: post
title:  "Software Engineering: Factory Method Pattern"
date:   2013-10-10 14:10:00
categories: [notes, software engineering]
---

These are the patterns we've covered so far:

* Singleton
* Abstract Factory
* Simple Factory
* Strategy

## Factory Method

* [PPT Slides](https://www.dropbox.com/s/9a3s2tm0wfw4sts/04.FactoryMethodPattern.pptx)
* [DoFactory Reference](http://www.dofactory.com/Patterns/PatternFactory.aspx)

### UML Diagram

![](http://www.dofactory.com/Patterns/Diagrams/factory.gif)

### Participants

The classes and/or objects participating in this pattern are:

* Product (Page)
  * defines the interface of objects the factory method creates
* ConcreteProduct (SkillsPage, EducationPage, ExperiencePage)
  * implements the Product interface
* Creator (Document)
  * declares the factory method, which returns an object of type Product. Creator may also define a default implementation of the factory method that returns a default ConcreteProduct object.
  * may call the factory method to create a Product object.
* ConcreteCreator (Report, Resume)
  * overrides the factory method to return an instance of a ConcreteProduct.
