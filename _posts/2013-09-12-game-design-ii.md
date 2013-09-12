---
layout: post
title:  "Game Design II: Gamepad Input and Audio"
date:   2013-09-12 09:50:00
categories: [notes, game design]
---

## Using the Gamepad

### Obtain the State of the Gamepad

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
```

### Check Whether the Gamepad is Connected

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
if (gps1.IsConnected)
{
   // The gamepad is connected.
} else {
   // The gamepad is discinnected.
}
```

### Check whether a button is pressed

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
if (gps1.Buttons.A == ButtonState.Pressed)
{
   // Button A is pressed.
}
```

<img src="/img/gamepad-buttons.png">

### Check whether DPad is pressed?

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
if (gps1.DPad.Left == ButtonState.Pressed)
{
   // The left button of DPad is pressed.
}
```


### Read the value of Thumb Sticks

The position (x,y) of the left/right thumbstick, x and y, is between -1.0 and 1.0.

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
Vector2 leftThumbStick = gps1.ThumbSticks.Left;
Vector2 rightThumbStick = gps1.ThumbSticks.Right;
```

### Get value of Triggers

Value of left/right trigger is between 0.0 to 1.0.

```c#
GamePadState gps1 = GamePad.GetState(PlayerIndex.One);
float leftTrigger = gps1.Triggers.Left;
float rightTrigger = gps1.Triggers.Right;
```


### Check functions of the Controller

```c#
GamePadCapabilities gpc1 = GamePad.GetCapabilities (PlayerIndex.One);
```


### Use Dpad to move object

```c#
public class Game1 : Microsoft.Xna.Framework.Game
{
  GraphicsDeviceManager graphics;
  SpriteBatch spriteBatch;
  Texture2D ball;
  Vector2 position;
  Vector2 velocity;

  protected override void LoadContent() {
    // Create a new SpriteBatch, which can be used to draw textures.
    spriteBatch = new SpriteBatch(GraphicsDevice);
    // TODO: use this.Content to load your game content here
    ball = Content.Load<Texture2D>("images/ball");
    position.X = (Window.ClientBounds.Width - ball.Width) / 2; position.Y = (Window.ClientBounds.Height - ball.Height) / 2; velocity = new Vector2(3);
  }

  protected override void Update(GameTime gameTime) {
    GamePadState gps = GamePad.GetState(PlayerIndex.One);
    // Allows the game to exit
    if (gps.Buttons.Back == ButtonState.Pressed) this.Exit();
    // TODO: Add your update logic here
    if (gps.DPad.Down == ButtonState.Pressed) position.Y += velocity.Y;
    if (gps.DPad.Up == ButtonState.Pressed) position.Y -= velocity.Y;
    if (gps.DPad.Left == ButtonState.Pressed) position.X -= velocity.X;
    if (gps.DPad.Right == ButtonState.Pressed) position.X += velocity.X;
    base.Update(gameTime); 
  }

  protected override void Draw(GameTime gameTime) {
    GraphicsDevice.Clear(Color.CornflowerBlue);
    // TODO: Add your drawing code here
    spriteBatch.Begin();
    spriteBatch.Draw(ball, position, Color.White); spriteBatch.End();
    base.Draw(gameTime);
  }
}
```

# Audio

## Resources

* [PPT Slides](https://www.dropbox.com/s/ekbci0wpedc3be2/XNA.4.0.Audio%20Video.pptx)

## XNA Audio

* `Microsoft.Xna.Framework.Audio` Namespace
* Supports __.wav__, __.wma__, and __.mp3__ formats
* Simple Audio Playback
  * `SoundEffect` Class
  * `SoundEffectInstance` Class
* XACT (Cross-Platform Audio Creation Tool)

## Simple Audio Playback 

```c#

public class Game1 : Microsoft.Xna.Framework.Game {
  GraphicsDeviceManager graphics; 
  SpriteBatch spriteBatch;
  SoundEffect crash; 
  SoundEffectInstance crashInst;

  // Load files and create instance
  protected override void LoadContent() {
    spriteBatch = new SpriteBatch(GraphicsDevice);
    crash = Content.Load<SoundEffect>("crash");
    crashInst = crash.CreateInstance();
  }

  // Play instance
  protected override void Update(GameTime gameTime) {
    GamePadState gamepad = GamePad.GetState(PlayerIndex.One); KeyboardState keyboard = Keyboard.GetState();
    ...
    //A button or key plays sound effect
    if (gamepad.Buttons.A == ButtonState.Pressed) crashInst.Play();
    if (Keyboard.GetState().IsKeyDown(Keys.A)) crashInst.Play();
    ... 
  }
}
```