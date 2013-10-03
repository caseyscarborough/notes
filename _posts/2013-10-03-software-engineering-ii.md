---
layout: post
title:  "Software Engineering: Singleton Design Pattern"
date:   2013-10-03 14:10:00
categories: [notes, software engineering]
---

## Resources

* [PPT Slides](https://www.dropbox.com/s/o9iq511oaystck2/06.Singleton%20Pattern.pptx)
* [DoFactory Singleton Pattern](http://www.dofactory.com/Patterns/PatternSingleton.aspx)

## Singleton Pattern

* Intent
  * Ensure a class only has one instance, and provide a global point of access to it
* Motivation
  * Sometimes we want just a single instance of a class to exist in the system 
  * For example, we want just one window manager. Or just one factory for a family of products.
  * We need to have that one instance easily accessible
  * And we want to ensure that additional instances of the class can not be created

## Where to use

* Singleton should be considered only if all three of the following criteria are satisfied:
  * Ownership of the single instance cannot be reasonably assigned
  * Lazy initialization is desirable
  * Global access is not otherwise provided for
e.g.
* When you need to ensure there's one instance of an object, available to a number of other classes. 
* When you need to provide a registry, or something like a thread pool. Logging is also another popular use of Singletons, providing one single access point to an applications log file. 

## Implementation

OK, so how do we implement the Singleton pattern?

We'll use a static method to allow clients to get a reference to the single instance and we’ll use a private constructor!

```java
/**
* Class Singleton is an implementation of a class that
* only allows one instantiation.
*/
public class Singleton {
  
  // The private reference to the one and only instance.
  private static Singleton uniqueInstance = null;
  
  // An instance attribute.
  private int data = 0;

  /**
  * Returns a reference to the single instance.
  * Creates the instance if it does not yet exist.
  * (This is called lazy instantiation.)
  */
  public static Singleton instance() {
  if(uniqueInstance == null) uniqueInstance = new Singleton();
  return uniqueInstance;
  }

  /**
  * The Singleton Constructor.
  * Note that it is private!
  * No client can instantiate a Singleton object!
  */
  private Singleton() {}
  // Accessors and mutators here!
  }
}
```

## Real world implementation

```c#
// Singleton pattern -- Real World example

using System;
using System.Collections.Generic;
using System.Threading;
 
namespace DoFactory.GangOfFour.Singleton.RealWorld
{
  /// <summary>
  /// MainApp startup class for Real-World
  /// Singleton Design Pattern.
  /// </summary>
  class MainApp
  {
    /// <summary>
    /// Entry point into console application.
    /// </summary>
    static void Main()
    {
      LoadBalancer b1 = LoadBalancer.GetLoadBalancer();
      LoadBalancer b2 = LoadBalancer.GetLoadBalancer();
      LoadBalancer b3 = LoadBalancer.GetLoadBalancer();
      LoadBalancer b4 = LoadBalancer.GetLoadBalancer();
 
      // Same instance?
      if (b1 == b2 && b2 == b3 && b3 == b4)
      {
        Console.WriteLine("Same instance\n");
      }
 
      // Load balance 15 server requests
      LoadBalancer balancer = LoadBalancer.GetLoadBalancer();
      for (int i = 0; i < 15; i++)
      {
        string server = balancer.Server;
        Console.WriteLine("Dispatch Request to: " + server);
      }
 
      // Wait for user
      Console.ReadKey();
    }
  }
 
  /// <summary>
  /// The 'Singleton' class
  /// </summary>
  class LoadBalancer
  {
    private static LoadBalancer _instance;
    private List<string> _servers = new List<string>();
    private Random _random = new Random();
 
    // Lock synchronization object
    private static object syncLock = new object();
 
    // Constructor (protected)
    protected LoadBalancer()
    {
      // List of available servers
      _servers.Add("ServerI");
      _servers.Add("ServerII");
      _servers.Add("ServerIII");
      _servers.Add("ServerIV");
      _servers.Add("ServerV");
    }
 
    public static LoadBalancer GetLoadBalancer()
    {
      // Support multithreaded applications through
      // 'Double checked locking' pattern which (once
      // the instance exists) avoids locking each
      // time the method is invoked
      if (_instance == null)
      {
        lock (syncLock)
        {
          if (_instance == null)
          {
            _instance = new LoadBalancer();
          }
        }
      }
 
      return _instance;
    }
 
    // Simple, but effective random load balancer
    public string Server
    {
      get
      {
        int r = _random.Next(_servers.Count);
        return _servers[r].ToString();
      }
    }
  }
}
```