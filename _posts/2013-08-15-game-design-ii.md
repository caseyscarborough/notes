---
layout: post
title:  "Game Design & Programming II"
date:   2013-08-15 9:50:00
categories: [notes, game design]
---

## Creating a New Project in VS2012

* Open Visual Studio 2012 and go to new project.
* Select Windows Game 4.0.
* Make project name _MyFirstXNAProg_ and create project.

View the following page for a more detailed description:
* [Creating a Windows Game or Library Project](http://msdn.microsoft.com/en-us/library/bb203928.aspx)

## Main XNA Libraries

* Microsoft.Xna.Framework
* Microsoft.Xna.Framework.Audio
* Microsoft.Xna.Framework.Content
* Microsoft.Xna.Framework.Graphics
* Microsoft.Xna.Framework.Input
* Microsoft.Xna.Framework.Media

You can view the documentation for these classes in the [XNA Framework Class Library](http://msdn.microsoft.com/en-us/library/bb203940.aspx).

## Game1.cs

The following is a simple description of some of the methods and attributes of the `Game1` class.

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  // Used to control and handle the graphics
  GraphicsDeviceManager graphics;
  // Handles input files, such as .jpg, .png files, .etc.
  SpriteBatch spriteBatch;

  // Constructor
  public Game1()
  {
    graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";
  }

  // Initialization function to perform any actions needed before
  // the game starts
  protected override void Initialize()
  {
    base.Initialize();
  }

  // This method is called once per game and is used to load all content.
  // This includes graphics, audio, sprites, etc.
  protected override void LoadContent()
  {
    // Load any content here
    spriteBatch = new SpriteBatch(GraphicsDevice);
    // etc...
  }

  // Unload content is called once per game and is the place to 
  // unload all content
  protected override void UnloadContent()
  {
    // TODO: Unload any non ContentManager content here
  }

  // Allows the game to run logic such as updating the world,
  // checking for collisions, gathering input, and playing audio.
  protected override void Update(GameTime gameTime) 
  {
    if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
      this.Exit();

    base.Update(gameTime);
  }
}
```

### Adding resources

* Right click MyFirstXNAProgContent -> Add -> Existing Item... _(Shift + Alt + A)_
* We will be loading in a .png file called [dot.png](http://www.clker.com/cliparts/9/1/5/2/119498475589498995button-red_benji_park_01.svg.thumb.png) (you must save the file with this name).

Afterwards, you can add the dot.png file to the Game1 class using the Texture2D class.

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  // Used to control and handle the graphics
  GraphicsDeviceManager graphics;
  // Handles input files, such as .jpg, .png files, .etc.
  SpriteBatch spriteBatch;

  // Load the png file
  Texture2D dot;
}
```

Now we use the LoadContent() method to load the content.

```c#
protected override void LoadContent()
{
  // Add to the end
  dot = Content.Load<Texture2D>("dot");
}
```

We will then add our drawing code to the Draw() method.

```c#
protected override void Draw(GameTime gameTime)
{ 
  GraphicsDevice.Clear(Color.CornflowerBlue);

  // Start drawing code
  spriteBatch.Begin();
  spriteBatch.Draw(dot, Vector2.Zero, Color.White);
  spriteBatch.End();

  base.Draw(gameTime);
}
```

If you run the project, you should then see the project window open with your reddot.png photo displayed in the window.

### Manipulating the Resource

If your image is too large, you can use a photo editing software such as [Gimp](http://www.gimp.org/downloads/) or [Paint.NET](http://www.getpaint.net/) to resize the photo to 30x30px or so.

Also, change the transparency and alpha to 0, to allow our dot to have transparency.

