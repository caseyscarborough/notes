---
layout: post
title:  "Software Engineering: Data Flow Testing"
date:   2013-09-05 14:10:00
categories: [notes, software engineering]
---

## Bubble Sort Data Flow

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

<p align="center">
  <img src="/img/data-flow-bubble-sort.png">
</p>