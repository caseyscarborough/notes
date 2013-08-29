---
layout: post
title:  "Game Design & Programming II"
date:   2013-08-29 09:50:00
categories: [notes, game design]
---

# Adding Font to the Project

To add font to the project, you can begin by right-clicking the _Content_ section of the project and go to _Add_ -> _New Item_. Choose Visual C# on the left side and choose the type as _.spritefont_. See below:

<p align="center">
  <img src="/img/spritefont.png">
</p>

After loading, you can then edit the newly created XML file with the options that you'd like. An example is shown below (with comments reoved for brevity) using the _Consolas_ font with size 30.

```xml
<?xml version="1.0" encoding="utf-8"?>
<XnaContent xmlns:Graphics="Microsoft.Xna.Framework.Content.Pipeline.Graphics">
  <Asset Type="Graphics:FontDescription">
    <FontName>Consolas</FontName>
    <Size>30</Size>
    <Spacing>0</Spacing>
    <UseKerning>true</UseKerning>
    <Style>Regular</Style>
    <CharacterRegions>
      <CharacterRegion>
        <Start>&#32;</Start>
        <End>&#126;</End>
      </CharacterRegion>
    </CharacterRegions>
  </Asset>
</XnaContent>
```

After loading the font, add the font to the _Game_ class.

```c#
public class Game1 : Microsoft.Xna.Framework.Game {
    GraphicsDeviceManager graphics;
    SpriteBatch spriteBatch;
    SpriteFont font; // Add the SpriteFont

    // Omitted code...
}
```

Then, load the font by adding the following to the _LoadContent_ method.

```c#
protected override void LoadContent() {
    // Load the font resource named "font"
    font = Content.Load<SpriteFont>("font");
}
```

And draw the font by adding the following to the _Draw_ method below the line that says _Add your drawing code here_.

```c#
protected override void Draw(GameTime gameTime) {
    // Add your drawing code here
    spriteBatch.Begin();
    spriteBatch.DrawString(font, "Hello world!", new Vector2(10, 10), Color.White);
    spriteBatch.End();
}
```

If you run the project, you should then see something similar to the following.

<p align="center">
  <img src="/img/drawfont.png">
</p>