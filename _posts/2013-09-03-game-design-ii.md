---
layout: post
title:  "Game Design II: Sprite Animation"
date:   2013-09-03 09:50:00
categories: [notes, game design]
---

## Special Topics

Each group will be picking a following topic to learn about and give a presentation on.

__Creating water, sky, and particles in the game__

* Water simulation
* Sky rendering in game
* Particle system (eg. explosion, fire, etc.)

__Game File I/O and Terrain Rendering__

1. Save data file on digital media
2. Using XML in game
3. Array, matrix
4. Saving and loading game data

__NPC Management__

* Path finding
* State Machine
* Dialog Construction

__Networking__

* LAN
* Web
* Game state sync
* MMOG design architecture

__Game State, Video & Audio & Camera__

1. Game sstates management
2. Video with XNA
3. Cameral control in game
4. XNA Audio in Game programmming
  * XACT
  * Simple API

__Level editor/Mgmt__

__AI in Game__

1. Steering behavir
2. Flocking
3. Decision Trees
4. Fuzzy logic
5. Minmaxing/Tree pruning with Strategic game

__Collision Detection__

1. Collision with stationary objects
2. Momentum
3. Rotation after collision
4. Collision detection algorithms
  * Sprite basic collision detection (image, per pixel)
  * Boundaries methods
  * Polygonal Collision
  * SAT algorithm
  * Grid based collision detection


## Lecture Notes


### Sprite Animation

* Sprite Sheet
* Play List
* Frame Rate & Animation Speed

### Sprite Sheet

In order to decrease the numner of image file, we often compose a sprite sheet that has a different actions of image. See the image below, where the sprite sheet shows the three rings rotating.

<p align="center">
  <img src="/img/threerings.png" width="300">
</p>

### Sprite 2D

Organize each sprite in the sprite sheet into a 2D array. The origin of the sprite at (i, j) is (i x w, j x w).

<p align="center">
  <img src="/img/sprite2D.png" width="300">
</p>

### Play List

Sprite sheets often have a couple of actions. The play list records the necessary sprites and their order. For instance below, the order for punching is 0, 10, 12, 11, 12, 10.

<p align="center">
  <img src="/img/playlist.png">
</p>

## Animating a Sprite Sheet

You can animate the three rings sprite sheet by creating a new Visual Studio Windows Game project, load the [threerings.png](/img/threerings.png) file into the project's content, and add the following into the Game1.cs file.

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.GamerServices;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using Microsoft.Xna.Framework.Media;
 
namespace AnimateSprite
{
    // This is the main type for your game
    public class Game1 : Microsoft.Xna.Framework.Game
    {
        GraphicsDeviceManager graphics;
        SpriteBatch spriteBatch;
 
        // Texture stuff
        Texture2D texture;
        Point frameSize = new Point(75, 75);  // (width, height)
        Point currentFrame = new Point(0, 0); // (i, j)
        Point sheetSize = new Point(6, 8);    // (col, row)
        
        // Framerate stuff
        int timeSinceLastFrame = 0;
        int millisecondsPerFrame = 50;
 
        public Game1()
        {
            graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
        }
 
        /// Allows the game to perform any initialization it needs to before starting to run.
        /// This is where it can query for any required services and load any non-graphic
        /// related content.  Calling base.Initialize will enumerate through any components
        /// and initialize them as well.
        protected override void Initialize()
        {
            base.Initialize();
        }
 
        /// LoadContent will be called once per game and is the place to load
        /// all of your content.
        protected override void LoadContent()
        {
            // Create a new SpriteBatch, which can be used to draw textures.
            spriteBatch = new SpriteBatch(GraphicsDevice);
            // Load the threerings texture
            texture = Content.Load<Texture2D>("threerings");
        }
 
        /// UnloadContent will be called once per game and is the place to unload
        /// all content.
        protected override void UnloadContent()
        {
            // Unload any non ContentManager content here
        }
 
        /// Allows the game to run logic such as updating the world,
        /// checking for collisions, gathering input, and playing audio.
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Update(GameTime gameTime)
        {
            // Allows the game to exit
            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
                this.Exit();
 
            // Update logic
            timeSinceLastFrame += gameTime.ElapsedGameTime.Milliseconds; if (timeSinceLastFrame > millisecondsPerFrame)
            {
                timeSinceLastFrame -= millisecondsPerFrame; ++currentFrame.X;
                if (currentFrame.X >= sheetSize.X)
                {
                    currentFrame.X = 0; ++currentFrame.Y;
                    if (currentFrame.Y >= sheetSize.Y) currentFrame.Y = 0;
                }
            }
            base.Update(gameTime);
        }
 
        /// This is called when the game should draw itself.
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.White);
            spriteBatch.Begin(SpriteSortMode.FrontToBack, BlendState.AlphaBlend);
            spriteBatch.Draw(texture, Vector2.Zero,
            new Rectangle(currentFrame.X * frameSize.X,
            currentFrame.Y * frameSize.Y,
            frameSize.X, frameSize.Y), Color.White, 0, Vector2.Zero,
            1, SpriteEffects.None, 0); spriteBatch.End();
            base.Draw(gameTime);
        }
    }
}
```

Download this file from [here](https://gist.github.com/caseyscarborough/ffb81d31ec56f2038ffc/raw/94c0d16c97a337b466c3b3a3c23a078753cd8142/Game1.cs).
