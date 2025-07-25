+++
title = "The Legend of Zelda: A Link Between Worlds > Azahar"
+++

The following is the game-specific information for Azahar.

See [Azahar](@/notes/Azahar.md) for general information.

See also the [parent note](@/notes/The_Legend_of_Zelda_A_Link_Between_Worlds/_index.md).

## Gotchas

### Fullscreen

It might be necessary to focus the game window twice on GNOME (once through Alt-Tab select, then again by pressing Super twice, then F4 to unpause).

### StreetPass

**Do not** talk to Gramps in the game and **do not** enable the StreetPass. Otherwise, you will not be able to load the save file anymore!

If that happened to you anyway, delete the `~/.local/share/azahar-emu/nand/data/00000000000000000000000000000000/sysdata/00010026` folder [1].

## Settings

The following are per-game settings accessed by choosing Properties in the context menu of the game.

### Enhancements

Set Internal Resolution to 2x.

### Graphics

Set Graphics API to OpenGL.

### Audio

Set emulation method to HLE (fast).

Disable audio stretching.

## Controls

The following are settings accessed by going to Emulation > Configure > Controls in the main menu.

### Input

Create a separate profile for the game, and set the following controls.

Face Buttons:

- A: `;`
- B: `L`
- X: `O`
- Y: `K`

Directional Pad:

- Left: `G`
- Right: `J`
- Up: `Y`
- Down: `H`

Circle Pad:

- Left: `A`
- Right: `D`
- Up: `W`
- Down: `S`

Shoulder Buttons:

- L: `Q`
- R: `E`
- ZL: `I`
- ZR: `P`

## References

  1. [Reddit: *So I activated StreetPass on my Zelda A Link Between Worlds and when loading the game or starting a new file crashes the game*](https://www.reddit.com/r/Citra/comments/1elr2zn/comment/lgwn2sl)
