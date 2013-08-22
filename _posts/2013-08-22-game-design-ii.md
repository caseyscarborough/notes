---
layout: post
title:  "Game Design & Programming II"
date:   2013-08-22 09:50:00
categories: [notes, game design]
---

## What is a Sprite?

A sprite is a two-dimensional image or animation that is integrated into a larger scene.

### Sprite Depth

The depth of the sprid id is defined between 0.0 to 1.0

* 0.0 represent close
* 1.0 represents far

### Color Key

Color key is used to define a certain color in the mage to be transparent. The transparent area will show the image of the background.

## Changing Transparency

Under the reddot.png properties you can set the _Content Processor_ -> _Color Key Color_ -> _Alpha_ channel to be 255, and the transparent color to white, or (255,255,255).

But in general, processing the image using an image processing software is _much better_ than using the Content Processor.

## Moving the Sprite

In the Game class:

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  // previous code ommitted...

  Vector2 dotPosition = new Vector2(1.0f, 1.0f);
  Vector2 dotSpeed = new Vector2(1.0f, 1.0f);

  // ...
}
```

And inside the Update function:

```c#
protected override void Update(GameTime gameTime)
{
  // ...

  dotPosition += dotSpeed;

  // ...
}
```

And update the following line in the Draw method:

```c#
spriteBatch.Draw(dot, dotPosition, Color.White);
```

If you run this code, you'll see that the sprite is now moving, but it has no boundaries. That is the next step.

## Creating Boundaries

When the sprite collides with a boundary, it needs to change direction.

Add the YMAX and XMAX variables to your game class:

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  int XMAX;
  int YMAX;
}
```

Add the following lines to the end your Game1 constructor:

```c#
public Game1()
{
  XMAX = graphics.PrefferedBackBufferWidth;
  YMAX = graphics.PreferredBackBufferHeight;
}
```

In the Update method (previous code omitted for brevity):

```c#
protected override void Update(GameTime gameTime)
{
  // If it hits the Y boundary, reverse the Y direction.
  if (dotPosition.Y >= (YMAX-dot.Height) || dotPosition.Y <= 0) {
    dotSpeed.Y = -dotSpeed.Y;
  }

  // If it hits the X boundary, reverse the X direction.
  if (dotPosition.X >= (XMAX-dot.Height) || dotPosition.X <= 0) {
    dotSpeed.X = -dotSpeed.X;
  }
}
```

## Game Class

View the documentation for the [Game Class](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.game.aspx).

* [Properties](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.game_properties.aspx)
* [Constructor](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.game.game.aspx)
* [Methods](http://msdn.microsoft.com/en-us/library/microsoft.xna.framework.game_methods.aspx)

There are seven different versions of the Draw method, so pick the right one!

One version of the Draw method shown below:

```c#
public void Draw(
  Texture2D texture,
  Vector2 position,
  Nullable<Rectangle> sourceRectangle,
  Color color,
  float rotation,
  Vector2 origin,
  float scale,
  SpriteEffects effects,
  float layerDepth
)
```

## Rotating the Sprite

Add the following to the game class:

```c#
int Angle = 0;
```

Add the following to the update class:

```c#
Angle = ++Angle % 360;
```

In the Draw method, change spriteBatch.Draw() to the following:

```c#
spriteBatch.Draw(
  dot,
  dotPosition,
  null, //Source
  Color.White,
  MathHelper.ToRadians(Angle),
  new Vector2(dot.Width / 2, dot.Height / 2),
  1.0f, // Scale
  SpriteEffects.None,
  0.0f
);
```


__Get the current code for Game.cs [here](/src/20130822_Game.cs).__ 
> _Note: My asset name for the dot is 'dot', as opposed to in lecture being myRedDot._