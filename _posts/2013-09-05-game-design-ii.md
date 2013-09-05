---
layout: post
title:  "Game Design II: Game Input"
date:   2013-09-05 09:50:00
categories: [notes, game design]
---

## Resources

* [Powerpoint slides](https://www.dropbox.com/s/jqb26a3yncbttq8/XNA4-04.Game%20Input.pptx)

## Outline

* Introduction
* Input device
* Keyboard
* Mouse
* Game Pad

## Introduction

Input is a general term referring to the process of receiving actions from the user. In XNA Game Studio, the __Microsoft.Xna.Framework.Input__ namespace provides support for most input devices.

Input Device   | Windows   | Xbox 360   | Windows Phone
-------------- | --------- | ---------- | -------------
Gamepad        | Yes       | Yes        | *
Keyboard       | Yes       | Yes        | Yes
Mouse          | Yes       |            | Yes
TouchPanel     |           |            | Yes
Accelerometer  |           |            | Yes
Microphone     | Yes       | Yes        | Yes

## Keyboard Related Classes

* Keyboard Class
  * GetState
* KeyboardState Structure
  * IsKeyDown
  * IsKeyUp
  * GetPressedKeys
* Keys Enumeration
* KeyState Enumeration
  * Down
  * Up


### Steps to detect keyboard

* Declare a `KeyboardState` object to hold the last known keyboard state.

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  GraphicsDeviceManager graphics;
  SpriteBatch spriteBatch;
  KeyboardState oldKBState;
}
```

* Assign this object a value in your initialization method.

```c#
protected override void Initialize()
{
  // TODO: Add your initialization logic here
  oldKBState = Keyboard.GetState();
  base.Initialize();
}
```

* Call GetState to retrieve the current keyboard state.

```c#
protected override void Update(GameTime gameTime)
{
  // Allows the game to exit
  if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
    this.Exit();
  KeyboardState newKBState = Keyboard.GetState();
}
```

* Compare the values in your newKBState object to the values in the oldKBState object
  * Keys pressed in the newKBState object that were not pressed in the oldKBState object were pressed during this frame. Conversely, keys pressed in the oldKBState object that are not pressed in the newKBState object were released during this frame.

```c#
// Is the SPACE key down?
if (newKBState.IsKeyDown(Keys.Space))
{
  // If not down last update, key has just been pressed.
  if (!oldKBState.IsKeyDown(Keys.Space))
  {
  backColor = new Color(backColor.R, backColor.G, (byte)~backColor.B);
  }
}
else if (oldKBState.IsKeyDown(Keys.Space))
{
  // Key was down last update, but not down now, so
  // it has just been released.
}
```

* Update oldKBState object to the newKBState object before leaving Update.

```c#
protected override void Update(GameTime gameTime)
{
  ...

  oldKBState = newKBState;
  base.Update(gameTime);
}
```

* E.g. KeyboardDemo

```c#
protected override void Update(GameTime gameTime)
{
  ...
  KeyboardState kbState = Keyboard.GetState();

  if (kbState.IsKeyDown(Keys.K))
  backColor = Color.Black;
  else if (kbState.IsKeyDown(Keys.W))
  backColor = Color.White;
  else if (kbState.IsKeyDown(Keys.R))
  backColor = Color.Red;
  else if (kbState.IsKeyDown(Keys.G))
  backColor = Color.Green;
  else if (kbState.IsKeyDown(Keys.B))
  backColor = Color.Blue;
  else if (kbState.IsKeyDown(Keys.Y))
  backColor = Color.Yellow;

  base.Update(gameTime);
}
```

## Examples

Adding a checker and moving it with the keyboard.

Add checker in the Game1 class Content. The following only shows additional code for each method.

```c#
public class Game1 : Microsoft.Xna.Framework.Game {
  Texture2D checkerPiece;
  Vector2 checkerPosition;

  public Game1() {
    // ...

    this.isMouseVisible = true;                   // Make the mouse visible
    this.Window.AllowUserResizing = true;         // Allow window resizing
    this.graphics.PreferredBackBufferWidth = 800; // Set the window width and height
    this.graphics.PreferredBackBufferHeight = 600;
  }

  protected override void Initialize() {
    position = Vector2.Zero;
    base.Initialize();
  }

  protected override void LoadContent() {
    checkerPiece = Content.Load<Texture2D>("checkerRed");
  }

  protected override void Update(GameTime gameTime) {
    KeyboardState kbState = Keyboard.GetState();
    // if -> key is pressed move checkerpiece to right.
    // if ^ key is pressed move arrow up
    // ... etc
    if (kbState.IsKeyDown(Keys.Right) || kbState.IsKeyDown(Keys.D)) position.X++;
    if (kbState.IsKeyDown(Keys.Left) || kbState.IsKeyDown(Keys.A)) position.X--;
    if (kbState.IsKeyDown(Keys.Down) || kbState.IsKeyDown(Keys.S)) position.Y--;
    if (kbState.IsKeyDown(Keys.Up) || kbState.IsKeyDown(Keys.W)) position.Y++;

    base.Update(gameTime);
  }

  protected override void Draw() {
    spriteBatch.Begin();
    spriteBatch.Draw(checkerPiece, position, Color.White);
    spriteBatch.End();
  }
}
```

Making a jumpable checker game:

```c#
public class Game1 : Microsoft.Xna.Framework.Game {
  Texture2D checkerPiece;
  KeyboardState oldState;
  Vector2 position;

  public Game1() {
    // ...
    this.isMouseVisible = true;                   // Make the mouse visible
    this.Window.Title = "Arrow Keys";             // Set the title
    this.Window.AllowUserResizing = false;        // Allow window resizing
    this.graphics.PreferredBackBufferWidth = 512; // Set the window width and height
    this.graphics.PreferredBackBufferHeight = 512;
  }

  protected override void Initialize() {
    position = Vector2.Zero;
    oldState = Keyboard.GetState();
    base.Initialize();
  }

  protected override void LoadContent() {
    checkerPiece = Content.Load<Texture2D>("checkerRed");
    board =  Content.Load<Texture2D>("checkerBoard");
  }

  protected override void Update(GameTime gameTime) {
    KeyboardState newState = Keyboard.GetState();

    if (oldState.IsKeyUp(Keys.Right) || newState.IsKeyDown(Keys.Right)) position.X++;
    if (oldState.IsKeyDown(Keys.Left) || newState.IsKeyDown(Keys.Left)) position.X--;
    if (oldState.IsKeyDown(Keys.Down) || newState.IsKeyDown(Keys.Down)) position.Y--;
    if (oldState.IsKeyDown(Keys.Up) || newState.IsKeyDown(Keys.Up)) position.Y++;

    oldState = newState;
    base.Update(gameTime);
  }

  protected override void Draw() {
    spriteBatch.Begin();
    spriteBatch.Draw(checkerBoard, Vector2.Zero, Color.White);
    spriteBatch.Draw(checkerPiece, position, Color.White);
    spriteBatch.End();
  }
}
```

## Mouse Related Classes

* Mouse Class
  * GetState
  * SetPosition
* MouseState Structure
  * LeftButton, MiddleButton, RightButton
  * XButton1, XButton2
  * ScrollWheelValue
  * X, Y
* ButtonState Enumeration
  * Pressed
  * Released
* Game.IsMouseVisible
