---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-15 14:10:00
categories: [notes, software engineering]
---

## References

* [Software Quality slides](https://www.dropbox.com/s/rq0pf5or11ff9ch/0.1.SW.Quality.Chapter_14.ppt)
* [SQA slides](https://www.dropbox.com/s/qgobb950vabz0hg/0.2.SoftwareQualityAssurance.ppt)

## Software Quality

### Five Views of Software Quality

* Transcendental view
* User view
* Manufacturing view
* Product view
* Value-based view

### McCall's Quality Factors and Criteria

* Correctness
* Reliability
* Efficiency
* Integrity
* Usability
* Maintainability
* Testability
* Flexibility
* Portability
* Reusability
* Interoperability

<p align="center">
  <img src="http://csis.pace.edu/~marchese/cs615sp/L9/fg1.gif">
</p>

### The ISO 9126 Quality Characteristics

* The ISO 9126 document is the product of an international effort.
* It attempts to set a standard for quality.

See Slide 30, _McCall's quality model vs ISO 9126 model_.

## "Good Enough" Software

_Good enough_ software delivers high quality functions and features that end-users desire, but at the same time it delivers other more obscure or specialized functions and features that contain known bugs.

Arguments against _good enough_:
* It is true that “good enough” may work in some application domains and for a few major software companies. After all, if a company has a large marketing budget and can convince enough people to buy version 1.0, it has succeeded in locking them in.
* If you work for a small company be wary of this philosophy. If you deliver a “good enough” (buggy) product, you risk permanent damage to your company’s reputation.
* You may never get a chance to deliver version 2.0 because bad buzz may cause your sales to plummet and your company to fold.
* If you work in certain application domains (e.g., real time embedded software, application software that is integrated with hardware can be negligent and open your company to expensive litigation.

## Cost of Quality

* _Prevention costs_ include
  * quality planning
  * formal technical reviews
  * test equipment
  * training
* _Internal failure costs_ include
  * rework
  * repair
  * failure mode analysis
* _External failure costs_ are
  * complaint resolution
  * product return and replacement
  * help line support
  * warranty work

## Quality and Risk

> _People bet their jobs, their comforts, their safety, their entertainment, their decisions, and their very lives on computer software. It better be right._ SEPA, Chapter 1

For example, in November 2000 at a hospital in Panama, 28 patients received massive overdoses of gamma rays during treatment for a variety of cancers. In the months that followed, five of these patients died from radiation poisoning and 15 others developed serious complications. What caused this tragedy? _A software package_, developed by a U.S. company, was modified by hospital technicians to compute modified doses of radiation for each patient.

It is VERY IMPORTANT for our software to be of quality!

## Negligence and Liability

* Work begins with the best of intentions on both sides, but by the time the system is delivered, things have gone bad.

* The system is late, fails to deliver desired features and functions, is error-prone, and does not meet with customer approval.

* Litigation ensues.

## Quality and Security

> _Software security relates entirely and completely to quality. You must think about security, reliability, availability, dependability—at the beginning, in the design, architecture, test, and coding phases, all through the software life cycle [process]. Even people aware of the software security problem have focused on late life- cycle stuff. The earlier you find the software problem, the better. And there are two kinds of software problems. One is bugs, which are implementation problems. The other is software flaws and problems in the design. People pay too much attention to bugs and not enough on flaws._ <br />Gary McGraw

Dr. Qu mentions that security does not completely depend on a quality project.

## Achieving Software Quality

Critical success factors:
* Software Engineering Methods
* Project Management Techniques
* Quality Control
* Quality Assurance

# Software Quality Assurance

## Quality management activities

* Quality assurance
  * Establish organisational procedures and standards for quality.
* Quality planning
  * Select applicable procedures and standards for a particular project and modify these as required.
* Quality control
  * Ensure that procedures and standards are followed by the software development team.
Quality management should be separate from project management to ensure independence.

For instance, McDonald's has good quality assurance, since you can buy one of their burgers from anywhere and typically they will taste the same from anywhere.

> All code in any code-base should look like a single person typed it, no matter how many people contributed.

## What is Software Quality Assurance?

SQA is the process of assuring people that every effort has been made to ensure that software products have the desired level of _reliability_, _maintainability_, _usability_, and _saleability_.

_See slide 15 in SQA for the SQA Life Cycle_.

## Software Independent Verification & Validation

Software IV&V is a _systems engineering_ process employing rigorous methodologies for evaluating the correctness and quality of the software product _throughout_ the software life cycle.

* __Independent__
  * Technical: IV&V prioritizes its own efforts
  * Managerial: Independent reporting route to Program Management
  * Financial: Budget is allocated by program and controlled at high level such that IV&V effectiveness is not compromised
* __Verification__ (Are we building the product right?)
  * The process of evaluating a system or component to determine whether the products of a given development phase satisfy the conditions imposed at the start of that phase (IEEE/ANSI)
* __Validation__ (Are we building the right product?)
  * The process of evaluating a system or component during or at the end of the development process to determine whether it satisfies specified requirements (IEEE/ANSI)

### IV&V Benefits

* __Technical__
  * Better software/system Performance
  * Higher Confidence in Software Reliability
  * Compliance between Specs & Code
  * Criteria for Program Acceptance
* __Management__
  * Better Visibility into Development
  * Better Decision Criteria 
  * Second Source Technical Alternative
  * Reduced maintenance cost
  * Reduced Frequency of Operational Change