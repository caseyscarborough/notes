---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-13 14:10:00
categories: [notes, software engineering]
---

## Course Description

* Professor: Dr. Junfeng Qu
* Course Number: CSCI 3240
* Class Times: Tues. & Thurs. 2:10PM-3:25PM
* Textbook: _Software Engineering A Practitioner’s Approach, 7e_ by Alan Roger S. Pressman &middot; ISBN-13: 978-0073375977

## Course Objectives

1. Be able to solve complex and significant problems with professional skill, by formulating efficient and effective algorithmic solutions to a wide variety of sophisticated problems normally encountered in real-world computing and in academe.
  * Students will apply and follow software development life cycle, evolution and methodologies
to develop software
  * Students will be able to integrate reusable code and code from large-scale APIs into an existing or future software system
2. Be able to express algorithms clearly and correctly in a variety of programming languages. - Students will be able to construct a working system prototype designed
  * Students will be able to create and implement test plans that include unit, integration, systems, and acceptance testing
  * Students will be able to plan and conduct design and code reviews
3. Be able to demonstrate sufficient foundational knowledge of the following main subject areas of computer science: operating systems, databases, networks, graphics, software engineering, game design and implementation, and web technologies.
  * Students will apply a software development methodology to determine and assign responsibilities for development team members
  * Students will develop and implement incremental, iterative or modern software development methods.
4. Have an understanding of ethical responsibilities related to the areas of computing and the workplace.
  * Students will understand software development ethics and their responsibilities
5. Have mastery of the theoretical underpinnings of Computer Science.
  * Students will be able evaluate an object-oriented design
  * Students will master and use UML notation to model computer software systems
6. Apply breadth of computer science knowledge to either post-baccalaureate study or a career field.
  * Students will give an effective technical presentation
  * Students will write clear and accurate technical documents

## References

#### Software Engineering

* [Object-Oriented Reengineering Patterns](http://www.iam.unibe.ch/~scg/OORP/) by Serge Demeyer, Stephane Ducasse, and Oscar Nierstraz.
* [Code Complete](http://proquest.safaribooksonline.com/0735619670), Second Edition by Steve McConnell.
* [Agile and Iterative Development: A Manager’s Guide](http://proquest.safaribooksonline.com/0131111558) by Craig Larman.
* [Software Engineering Body of Knowledge](http://www.computer.org/portal/web/swebok)
* [Joel on Software](http://www.amazon.com/Joel-Software-Occasionally-Developers-Designers/dp/1590593898) by Joel Spolsky.

#### Design Patterns

* [Design Patterns in C#](http://proquest.safaribooksonline.com/0321126971) by Steven John Metsker.
* [Software Design Patterns](http://en.wikipedia.org/wiki/Software_design_pattern) 
* [Design Patterns in C#](http://www.amazon.com/dp/0321718933)
* [Practical Open Source Software Exploration](http://quaid.fedorapeople.org/TOS/Practical_Open_Source_Software_Exploration/html/index.html)

# Lecture Notes

## Software Quality

* In 2005, _ComputerWorld_ [Hil05] lamented that:
  * "bad software plagues nearly every organization that uses computers, causing lost work hours during computer downtime, lost or corrupted data, missed sales opportunities, high IT support and maintenance costs, and low customer satisfaction."
* A year later, _InfoWorld_ [Fos06] wrote about the
  * "the sorry state of software quality" reporting that the quality problem had not gotten any better.
* Today software quality remains an issue, but who is to blame?
  * Customers blame developers, arguing that sloppy practices lead to low-quality software.
  * Developers blame customers (and other stakeholders), arguing that irrational delivery dates and a continuing stream of changes force them to deliver software before it has been fully validated.

## Quality

* The _American Heritage Dictionary_ defines quality as:
  * "a characteristic or attribute of something."
* For software, two kinds of quality my be encountered:
  * __Quality of design__ encompasses requirements, specifications, and the design of the system.
  * __Quality of conformance__ is an issue focused primarily on implementation
  * __User satisfaction__ = Compliant product + Good quality + Delivery within budget schedule

### A Pragmatic View

* The __transcendental view__ argues that quality is something that you immediately recognize, but cannot explicitly define.
* The __user view__ sees quality in terms of an end-user's specific goals. If a product meets those goals, it exhibits quality.
* The __manufacturer's view__ defines quality in terms of the original specification of the product. If the product conforms to the spec, it exhibits quality.
* The __product view__ suggests that quality can be tied to inherent characteristics (e.g., functions and features) of a product.
* Finally, the __value-based view__ measures quality based on how much a customer is willing to pay for a product. In reality, quality encompasses all of these views and more.

## Software Quality

* Software quality can be defined as:
  * An effective software process applied in a manner that creates a useful product that provides measurable value for those who produce it and those who use it.
* This definition has been apdapted from and replaces a more manufacturing-oriented view presented in earlier editions of this book.