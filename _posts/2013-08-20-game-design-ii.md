---
layout: post
title:  "Game Design & Programming II"
date:   2013-08-20 9:50:00
categories: [notes, game design]
---

### Point Structure

See [Point Structure](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.point.aspx) documentation.

Used to express location of 2D.

[__Constructor__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.point.point.aspx):

```c#
public Point(int x, int y)
```

[__Public Fields__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.point_fields.aspx):

```c#
int X;
int Y;
```

__Example__:

```c#
Point p = new Point(3, 4);
Point q;
q.X = 3;
q.Y = p.Y + 4;
```

[__Public Properties__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.point_properties.aspx):

```c#
Point.Zero // Starting point at 0, 0
```

[__Public Methods__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.point_methods.aspx) (Example):

```c#
Point p = new Point(3, 4);
Point q = new Point(5, 6);
Point r = q;

if (p.Equals(q)) { ... }
if (p != q) { ... }
if (p == q) { ... }
```


### Rectangle Structure:

See [Rectangle Structure](http://msdn.microsoft.com/en-us/library/Microsoft.Xna.Framework.Rectangle.aspx) documentation.

[__Constructor__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.rectangle.rectangle.aspx):

```c#
public Rectangle(int x, int y, int width, int height)
```

[__Public Fields__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.rectangle_fields.aspx):

```c#
int Width, Height;
int X, Y;
``` 

__Example__:

```c#
Rectangle p = new Rectangle(10, 20, 56, 78);
Rectangle q = p;
q.X = p.Y * 3;
```

[__Public Methods__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.rectangle_methods.aspx):

```c#
rect.Location = Point.Zero; // Move r to 0, 0

// A rectangle can contain a point
public bool Contains(int x, int y)
public bool Contains(Point pt)
public void Contains(ref Point pt, out bool result)

// A rectangle can contain another rectangle
public void Contains(Rectangle r)
public void Contains(ref Rectangle r, out bool result)

// Intersections
public bool Intersects(Rectangle r)
public void Intersects(ref Retangle r, out bool result)

// Intersect, retrieve the part of the rectangles that overlaps.
public static Rectangle Intersect(Rectangle r1, Rectangle r2)
public static void Intersect(ref Rectangle r1, ref Rectangle r2, out Rectangle result)

// Union
public static Rectangle Union(Rectangle r1, Rectangle r2)
public static void Union(ref Rectangle r1, ref Rectangle r2, out Rectangle result)

// Inflate
public void Inflate(int h, int v)

// Offset
public void Offset(int dx, int dy)
public void Offset(Point amount)
```

__Example__:

```c#
// Point
Rectangle rect = new Rectangle(10, 20, 56, 78);
Point pt1 = new Point(12, 25);
rect.Contains(pt1);         // true
rect.Contains(1000, 2000);  // false

// Rectangle
Rectangle r1 = new Rectangle(15, 25, 10, 10);
rect.Contains(r1);          // true
r1.Location = new Point(180, 200);
rect.Contains(r1);          // false

// Intersections
r1 = new Rectangle(15, 25, 10, 10);
rect.Intersects(r1);        // true
r1.Location = new Point(180, 200);
rect.Intersects(r1);        // false

// Inflation
r1.Inflate(10, 20);
```

### Vector2 Structure

See [Vector2 Structure](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.vector2.aspx) documentation.

Vector has a direction, points don't. Vector is a float, points are integers.

[__Constructor__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.vector2.vector2.aspx):

```c#
public Vector2(float x, float y)
public Vector2(float v)
```

[__Public Fields__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.vector2_fields.aspx):

```c#
float X, Y;
```

[__Public Properties__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.vector2_properties.aspx):

```c#
Vector2.Zero  // 0, 0
Vector2.One   // 1, 1
Vector2.UnitX // Returns the unit vector for the x-axis.
Vector2.UnitY // Returns the unit vector for the y-axis.
```

[__Public Methods__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.vector2_methods.aspx):

```c#
// Add
public static Vector2 Add(Vector2 value1, Vector2 value2)
public static void add(ref Vector2 value1, ref Vector2 value2, out Vector2 result)
public static Vector2 operator + (Vector2 value1, Vector2 value2)

// Subtract
public static Vector2 Subtract(Vector2 value1, Vector2 value2)
public static void Subtract(ref Vector2 value1, ref Vector2 value2, out Vector2 result)
public static Vector2 operator - (Vector2 value1, Vector2 value2)

// Scalar multiplocation
public static Vector2 Multiply(Vector2 value1, float s)
public static void Multiply(ref Vector2 value1, ref float s, out Vector2 result)
public static Vector2 operator * (Vector2, float s)

// Component-wise multiplication
public static Vector2 Multiply(Vector2 value1, Vector2 value2)
public static void Multiply(ref Vector2 value1, ref Vector2 value2, out Vector2 result)
public static Vector2 operator * (Vector2 value1, Vector2 value2)

// Scalar division
public static Vector2 Divide(Vector2 value1, float s)
public static void Divide(ref Vector2 value1, ref float s, out Vector2 result)
public static Vector2 operator / (Vector2, float s)

// Component-wise division
public static Vector2 Divide(Vector2 value1, Vector2 value2)
public static void Divide(ref Vector2 value1, ref Vector2 value2, out Vector2 result)
public static Vector2 operator / (Vector2 value1, Vector2 value2)

// Negate
public statis Vector2 Negate(Vector2 value)
public static void Negate(ref Vector2 value1, out Vector2 result)
public static Vector2 operator - (Vector2 value1)

// Equals
public bool Equals(Vector2 value1)
public bool Vector2 operator == (Vector2 value1, Vector2 value2)
public bool Vector2 operator != (Vector2 value1, Vector2 value2)

// Distance
public static float Distance(Vector2 value1, Vector2 value2)
public static void Distance(ref Vector2 value1, ref Vector2 value2, out Vector2 result)
public static float DistanceSquared(Vector2 value1, Vector2 value2)
public static void DistanceSquared(ref Vector2 value1, ref Vector2 value2, out float result)
```

__Length__:

![equation](http://latex.codecogs.com/gif.latex?v%20%3D%20%28a%2C%20b%29)
<br />![equation](http://latex.codecogs.com/gif.latex?length%28v%29%20%3D%20sqrt%28a%5E2%20&plus;%20b%5E2%29)
<br />![equation](http://latex.codecogs.com/gif.latex?%28length%28v%29%29%5E2%20%3D%20a%5E2%20&plus;%20b%5E2)

```c#
// Length
public float Length()
public float LengthSquared()
```

__Product__:

![equation](http://latex.codecogs.com/gif.latex?u%20%3D%20%28a%2C%20b%29)
<br />![equation](http://latex.codecogs.com/gif.latex?v%20%3D%20%28c%2C%20d%29)
<br />![equation](http://latex.codecogs.com/gif.latex?u%20%5Ccdot%20v%20%3D%20ac%20&plus;%20bd)

```c#
// Product
public static float Dot(Vector2 u, Vector2 v)
public statis void Dot(ref Vector2 u, ref Vector2 v, out float result)

// Normalize
public void Normalize()
public static Vector2 Normalize(Vector2 value)
public static void Normalize(ref Vector2 value, out Vector2 result)

// Max & Min
public static Vector2 Max(Vector2 u, Vector2 v)
public static void Max(ref Vector2 u, ref Vector2 v, out Vector2 r)
public static Vector2 Min(Vector2 u, Vector2 v)
public static void Min(ref Vector2 u, ref Vector2 v, out Vector2 r)

// Clamp - Restricts a value to be within a specific range
public static Vector2 Clamp(Vector2 value1, Vector2 min, Vector2 max)
public static void Clamp(ref Vector2 value1, ref Vector2 min, ref Vector2 max, out Vector2 result)
```

Example:

```c#
// Addition
Vector2 v = new Vector(3, 4);     // v = (3, 4)
Vector2 u = new Vector(5.0f);     // u = (5, 5)
Vector2 w;
w = Vector2.Add(u, v);            // w = (8, 9)
Vector2.Add(ref u, ref v, out w); // w = (8, 9)
w = u + v;                        // w = (8, 9)

// Subtraction
w = new Vector();
w = Vector2.Subtract(u, v);            // w = (-2, -1)
Vector2.Subtract(ref u, ref v, out w); // w = (-2, -1)
w = u - v;                             // w = (-2, -1)

// Normalize
Vector2 u = new Vector2(3, 4);
u.Normalize();
```

### GraphicsDeviceManager Class

See [GraphicsDeviceManager Class](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.graphicsdevicemanager.aspx) documentation.

[__Public Methods__](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.graphicsdevicemanager_methods.aspx):

```c#
public void ToggleFullScreen()
```

Dr. Qu ran out of time.