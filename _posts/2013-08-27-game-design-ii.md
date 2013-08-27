---
layout: post
title:  "Game Design & Programming II"
date:   2013-08-27 09:50:00
categories: [notes, game design]
---

# Adding and Moving the Background

The next step in the game is to move the character. We can do this using [Parallax Scrolling](http://en.wikipedia.org/wiki/Parallax_scrolling). The first step is to find a background.

After finding the background, load it into the Content.

Add the following to the Game Class:

```c#
Texture2D background;
int backgroundPosition = 0;
```

In the LoadContent() method:

```c#
// Load the background.
background = Content.Load<Texture2D>("background");
```

Then draw the background __before__ the dot in the Draw() method.

```c#
spriteBatch.Draw(background, new Vector2(backgroundPosition, 0), Color.White);
```

We can then move the background by adding the following to the Update() method:

```c#
backgroundPosition--;
```

Now if you run the game, you'll notice the background moves. The problem is that the background does not repeat. We can resolve this issue by adding the following code to the Update and Draw methods.


Update:

```c#
// Shift background to the right if it reaches the end.
if (backgroundPosition < -background.Width) { backgroundPosition += background.Width; }
```

Draw:

```c#
// Draw a second background between the first one and the dot to fill in the "gap."
spriteBatch.Draw(background, new Vector2(backgroundPosition + background.Width, 0), Color.White);
```