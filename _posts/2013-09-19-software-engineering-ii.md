---
layout: post
title:  "Software Engineering: Design Patterns"
date:   2013-09-19 14:10:00
categories: [notes, software engineering]
---

# Resources

* [Introduction to Design Patterns](http://userpages.umbc.edu/~tarr/dp/spr06/cs446.html)
* [.NET Design Patterns](http://www.dofactory.com/Patterns/Patterns.aspx)
* [Java Design Patterns](http://javacamp.org/designPattern/)
* [Design Patterns in Java](http://www.tutorialspoint.com/design_pattern/)
* [OODesign](http://oodesign.com)

# Calculator Program

## Version 1

Create a new C# Console Application in Visual Studio. The following is the program (which is the really crappy version):

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorV1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please enter a number A? ");
            string A = Console.ReadLine();
            Console.WriteLine("Please enter an operator: + or -, * or /");
            string B = Console.ReadLine();
            Console.WriteLine("Please enter a number B? ");
            string C = Console.ReadLine();
            string D = "";

            // Bad to use all if statements, hinders branch predicion
            if (B == "+")
                D = Convert.ToString(Convert.ToDouble(A) + Convert.ToDouble(C));
            if (B == "-")
                D = Convert.ToString(Convert.ToDouble(A) - Convert.ToDouble(C));
            if (B == "*")
                D = Convert.ToString(Convert.ToDouble(A) * Convert.ToDouble(C));
            if (B == "/")
                D = Convert.ToString(Convert.ToDouble(A) / Convert.ToDouble(C));
        }
    }
}
```

## Version 2

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorV2
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.Write("Please enter a number A? ");
                string strNumberA = Console.ReadLine();
                Console.Write("Please enter an operator: + or -, * or / ");
                string strOperator = Console.ReadLine();
                Console.Write("Please enter a number B? ");
                string strNumberB = Console.ReadLine();
                string strResult = "";

                switch (strOperator)
                {
                    case "+":
                        strResult = Convert.ToString(Convert.ToDouble(strNumberA) + Convert.ToDouble(strNumberB));
                        break;
                    case "-":
                        strResult = Convert.ToString(Convert.ToDouble(strNumberA) - Convert.ToDouble(strNumberB));
                        break;
                    case "*":
                        strResult = Convert.ToString(Convert.ToDouble(strNumberA) * Convert.ToDouble(strNumberB));
                        break;
                    case "/":
                        if (strNumberB != 0)
                            strResult = Convert.ToString(Convert.ToDouble(strNumberA) / Convert.ToDouble(strNumberB));
                        else
                            Console.Write("Denominator can't be 0!");
                        break;
                }
                Console.WriteLine("The result is: " + strResult);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Your inputs have errors:" + ex.Message);
            }
        }
    }
}
```

## Version 3

This violates the open closed principle, since the class must be reopened for modification.

__Operation.cs__:

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorV3
{
    class Operation
    {
        public static double GetResult(Double numberA, double numberB, string operator)
        {
            double result = 0d;

            switch (operator)
            {
                case "+":
                    result = numberA + numberB;
                    break;
                case "-":
                    result = numberA - numberB;
                    break;
                case "*":
                    result = numberA * numberB;
                    break;
                case "/":
                    result = numberA / numberB;
                    break;
            }

            return result;
        }
    }
}
```

__Program.cs__:

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CalculatorV3
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Console.Write("Please enter a number A? ");
                string strNumberA = Console.ReadLine();
                Console.Write("Please enter an operator: + or -, * or / ");
                string strOperator = Console.ReadLine();
                Console.Write("Please enter a number B? ");
                string strNumberB = Console.ReadLine();

                string strResult = Convert.ToString(
                    Operation.GetResult(
                        Convert.ToDouble(strNumberA),
                        Convert.ToDouble(strNumberB),
                        strOperator
                    );
                );

                Console.WriteLine("The result is " + strResult);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Your inputs have errors:" + ex.Message);
            }
        }
    }
}
```

## Version 4

__Operation.cs__:
```c#
class Operation 
{
    
}
```

__OperationAdd.cs__:
```c#
class OperationAdd 
{
    
}
```

__OperationSub.cs__:
```c#
class OperationSub 
{
    
}
```

__OperationMul.cs__:
```c#
class OperationMul 
{
    
}
```

__OperationDiv.cs__:
```c#
class OperationDiv 
{
    
}
```

# Design Patterns Intro

