---
layout: post
title:  "Software Engineering Practicum"
date:   2013-08-29 14:10:00
categories: [notes, software engineering]
---

Draw a Control Flow Diagram for the following Java sort algorithm.

```c#
public static void BubbleSort( int [] num ) {
    int j;
    boolean flag = true; // set flag to true to begin first pass
    int temp;            // holding variable

    while ( flag ) {
        flag= false;     // set flag to false awaiting a possible swap
        for( j=0;  j < num.length -1;  j++ ) {
            if ( num[ j ] < num[j+1] ) {  // change to > for ascending sort
                temp = num[ j ];          // swap elements
                num[ j ] = num[j+1];
                num[ j+1 ] = temp;
                flag = true;              // shows a swap occurred  
            } 
        } 
    } 
}
```