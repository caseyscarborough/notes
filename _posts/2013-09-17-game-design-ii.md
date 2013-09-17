---
layout: post
title:  "Game Design II: Game Audio"
date:   2013-09-17 09:50:00
categories: [notes, game design]
---

Working with sound. Create a new project and add the following to Game1.cs.

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

namespace XNASound
{
    /// <summary>
    /// This is the main type for your game
    /// </summary>
    public class Game1 : Microsoft.Xna.Framework.Game
    {
        GraphicsDeviceManager graphics;
        SpriteBatch spriteBatch;

        GamePadState oldGamePadState;
        SpriteFont m_font;
        string disp = "Hello Musician!";
        SoundEffect cymbal;
        SoundEffect snare;
        SoundEffect kick;
        SoundEffect top;
        SoundEffect music;
        SoundEffectInstance musicInstance = null;
        Texture2D drumTexture;
        Rectangle drumRectangle;
        Song song;

        public Game1()
        {
            graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
        }

        /// <summary>
        /// Allows the game to perform any initialization it needs to before starting to run.
        /// This is where it can query for any required services and load any non-graphic
        /// related content.  Calling base.Initialize will enumerate through any components
        /// and initialize them as well.
        /// </summary>
        protected override void Initialize()
        {
            // TODO: Add your initialization logic here

            base.Initialize();
        }

        /// <summary>
        /// LoadContent will be called once per game and is the place to load
        /// all of your content.
        /// </summary>
        protected override void LoadContent()
        {
            // Create a new SpriteBatch, which can be used to draw textures.
            spriteBatch = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here
            cymbal = Content.Load<SoundEffect>("sound\\cymbalTing");
            kick   = Content.Load<SoundEffect>("sound\\kick");
            snare  = Content.Load<SoundEffect>("sound\\snare");
            top    = Content.Load<SoundEffect>("sound\\top");
            m_font = Content.Load<SpriteFont>("font\\m_font");
            
            music = Content.Load<SoundEffect>("sound\\music");
            musicInstance = music.CreateInstance();

            song = Content.Load<Song>("music\\Sleep Away");
            MediaPlayer.Play(song);

            drumTexture = Content.Load<Texture2D>("img\\drums");
            drumRectangle = new Rectangle(0, 0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height);
        }

        /// <summary>
        /// UnloadContent will be called once per game and is the place to unload
        /// all content.
        /// </summary>
        protected override void UnloadContent()
        {
            // TODO: Unload any non ContentManager content here
        }

        /// <summary>
        /// Allows the game to run logic such as updating the world,
        /// checking for collisions, gathering input, and playing audio.
        /// </summary>
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Update(GameTime gameTime)
        {
            // Allows the game to exit
            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
                this.Exit();

            // TODO: Add your update logic here
            GamePadState gamePad1 = GamePad.GetState(PlayerIndex.One);
            if(gamePad1.IsConnected) {
                if(oldGamePadState.Buttons.Start == ButtonState.Released && gamePad1.Buttons.Start == ButtonState.Pressed) {
                    if (musicInstance.State == SoundState.Playing)
                    {
                        musicInstance.Pause();
                    }
                    else
                    {
                        musicInstance.Play();
                    }
                }

                if (oldGamePadState.Buttons.A == ButtonState.Released && gamePad1.Buttons.A == ButtonState.Pressed)
                {
                    snare.Play();
                }

                // A button does snare
                // B button does kick
                // x button does cymbal
                // y button does top
            }
            base.Update(gameTime);
        }

        /// <summary>
        /// This is called when the game should draw itself.
        /// </summary>
        /// <param name="gameTime">Provides a snapshot of timing values.</param>
        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);

            // TODO: Add your drawing code here
            spriteBatch.Begin();
            spriteBatch.Draw(drumTexture, drumRectangle, Color.White);
            spriteBatch.DrawString(m_font, disp, Vector2.Zero, Color.Red);
            spriteBatch.End();
            base.Draw(gameTime);
        }
    }
}
```