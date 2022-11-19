# How to create a high quality spray for Source games?

First, prepare an image: you'll need to make it square. Optionally, you can also resize it
to the sides of power of 2, with the 512 pixels maximum.

Now, open [VTFEdit](https://developer.valvesoftware.com/wiki/VTFEdit). Import the image (File > Import).

Make sure that the following options are checked out in `General`:

- Normal Format: DXT1
- Alpha Format: DXT5
- Texture Type: Animated Texture

Enable `Resize` and `Clamp`. Set maximum width and height to 512. Don't generate `Mipmaps`
and `Normal Maps`. Leave everything else as-is.

After importing, check the following flags in the bottom-left pane:

- Clamp S
- Clamp T
- Anisotropic
- No Mipmap
- No Level Of Detail
- Eight Bit Alpha

Leave every other flag unchecked.

If you're wondering why transparent regions of your image are black, check View > Mask.

That's it. Save the spray as a `.vtf` file (File > Save As...) and generate the `.vmt` file
(Tools > Create VMT File). Drop these two files in the `.../materials/vgui/logos` directory
in your game folder.

Make sure your spray doesn't surpass the 512 Kb limit. Otherwise, it will be invisible in
the game.

Choose the `.vtf` file as a new spray in the game.
