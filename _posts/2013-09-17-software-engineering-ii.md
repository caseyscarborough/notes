---
layout: post
title:  "Software Engineering: Design Principles"
date:   2013-09-17 14:10:00
categories: [notes, software engineering]
---

# SOLID

## Resources

* [Powerpoint Slides](https://www.dropbox.com/s/8emlktuwgyirfe2/SOLID.pptx)

## SOLID

* SRP 
  * Single Responsibility Principle
* OCP
  * Open/Closed Principle
* LSP
  * Liskov Substitution Principle
* ISP
  * Interface Segregation Principle
* DIP
  * Dependency inversion principle

## Single Responsibility Principle

A class should only havea single responsibility.

```c#
Public class BankAccount {

  public BankAccount(){}
  
  public string AccountNum { get; set; }
  public decimal AccountBalance { get; set; }
  
  public decimal CalculateInterest(){
    // calculate interest
  }
}
```

A bank account should only be responsible for properties of the Bank Account.

```c#
public interface IBankAccount {
  string AccountNumber { get; set; }
  decimal AccountBalance { get; set; }
}

public class BankAccount : IBankAccount {
  public string AccountNumber { get; set; }
  public decimal AccountBalance { get; set; }
}
```

Add any new Business Rule in Calculation of Interest, we don't need to change BankAccount class. InterestCalculator class requires no changes, in case we need to add a new Property AccountHolderName.  So that's correct implementation of Single Responsibility Principle. 

```c#
public interface IInterestCalculator {
  decimal CalculateInterest();
}

public class InterestCalculator : IInterestCalculator {
  public decimal CalculateInterest (IBankAccount account) {
    // Write your logic here
    // return 1000;
  }
}
```

## Open Closed Principle

* Software entities (classes, modules, methods, etc.) should be open for extension, but closed for modification.

### Open

* Open for extension. 
  * This means that the behavior of the module can be extended. 
  * As the requirements of the application change, we can extend the module with new behaviors that satisfy those changes. i.e. we are able to change what the module does.

### Closed

* Closed for modification. 
  * Extending the behavior of a module does not result in changes to the source, or binary, code of the module. 
  * The binary executable version of the module whether in a linkable library, a DLL, or a .EXE file remains untouched.

### Solution

* The answer is abstraction. 
* In C# or any other object-oriented programming language (OOPL), it is possible to create abstractions that are fixed and yet represent an unbounded group of possible behaviors. 
* The abstractions are abstract base classes, and the unbounded group of possible behaviors are represented by all the possible derivative classes.


```c#
public interface Shape {
  void Draw();
}

public class Square : Shape {
  public void Draw() {
    // draw a square
  }
}

public class Circle : Shape {
  public void Draw() {
    // draw a circle
  }
}

public void DrawAllShapes(IList shapes) {
  foreach(Shape shape in shapes)
    shape.Draw();
}
```

* In many ways, the Open/Closed Principle is at the heart of object-oriented design. 
* Conformance to this principle is what yields the greatest benefits claimed for object-oriented technology: 
  * flexibility, reusability, and maintainability. 
* Yet conformance to this principle is not achieved simply by using an object-oriented programming language. Nor is it a good idea to apply rampant abstraction to every part of the application. Rather, it requires a dedication on the part of the developers to apply abstraction only to those parts of the program that exhibit frequent change. 
* Resisting premature abstraction is as important as abstraction itself.

## Liskov Substition Principle

* Objects in a program should be replaced with instances of their subtypes without altering the correctness of that program.
* Subtypes must be substitutable for their base types.
* You should always be able to use a base class or interface instead of the actual implementation and still get the expected result. If you can't, your breaking LSP.

```c#
public interface ISwan {
  void Swim();
}
public class Swan : ISwan {
  public void Swim() {
    //do something to swim
  }
}
public class ElectricSwan : ISwan {
   public void Swim() {
      if (!isTurnedOn)
        return;
      //swim logic  
   }
}

//Driven code:
void MakeSwanSwim(ISwan swan) {
  swan.Swim();
}
```

This breaks the LSP, because ElectricSwan cannot be substitutable for it's base type. Here are two solutions:

```c#
void MakeSwanSwim(ISwan swan) {
  if (swan is ElectricSwan)
    ((ElectricSwan)swan).TurnOn();
  swan.Swim();
}
```
This solution breaks Open/Closed principle and has to be implemented everywhere (and therefore still generate instable code). 

```c#
public class ElectricSwan : ISwan {
  public void Swim() {
    if (!IsTurnedOn)
      TurnSwanOn();
    //swim logic  
  }
}
```

This is the correct solution.

Take a look at the following. This also violates the LSP since Prisoner is used as a free Person, which is not correct.

```c#
class Person {
  void walkNorth (int meters) {...}   // No failure or exception allowed
  void walkEast (int meters) {...}    // No failure or exception allowed
}

class Prisoner extends Person {
  void walkNorth (int meters) {...}   // No failure or exception allowed
  void walkEast (int meters) {...}    // No failure or exception allowed
}
```

## Interface Segregation Principle 

* Many client-specific interfaces are better than one general-purpose interface
* Clients should not be forced to depend on methods that they do not use.  Interfaces belong to clients, not to libraries or hierarchies.
* The Interface Segregation principle ensures that Interfaces are developed so that each of them have their own responsibility and thus they are specific, easily understandable, and re-usable.

### Example

* A `Manager` class which represent the person which manages the workers. 
* Two types of `workers` some average and some very efficient workers. 
* Both types of workers works and they need a daily launch break to eat. 
* But now some `robots` came in the company they work as well, but they don't eat so they don't need a lunch break. 
* The new Robot class need to 
  * implement the IWorker interface because robots works. 
  * don't have to implement it because they don't eat.

```java
interface IWorker {
  public void work();
  public void eat();
}

class Worker implements IWorker{
  public void work() {
    // ....working
  }
  public void eat() {
    // ...... eating in launch break
  }
}
class SuperWorker implements IWorker{
  public void work() {
    //.... working much more
  }
  public void eat() {
    //.... eating in launch break
  }
}
class Manager {
  IWorker worker;
  public void setWorker(IWorker w) {
    worker=w;
  }
  public void manage() {
    worker.work();
  }
}
```

Solution:

```java
// interface segregation principle - good example
interface IWorker extends IFeedable, IWorkable {
}
interface IWorkable {
  public void work();
}
interface IFeedable{
  public void eat();
}

class Worker implements IWorkable, IFeedable{
  public void work() {
    // ....working
  }
  public void eat() {
    //.... eating in launch break
  }
}
```

## Dependency Inversion Principle

* One should depend upon Abstraction.  Do not depend upon concretions.
* __Abstractions should not depend on details.  Details should depend upon abstractions.__

### Example

```c#
public class Toyota {
  TE _engine;
  public Toyota() {
    _engine = new TE();
  }
}
// This is a problem, because of closed coupling.

public class Toyota {
  IEngine _engine;
  public Toyota(IEngine engine) {
    if( engine == null)
      throw new ArgumentNullException();
    _engine = engine;
  }
}
```
