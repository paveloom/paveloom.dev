+++
title = "The Legend of Zelda: A Link Between Worlds"
+++

*The Legend of Zelda: A Link Between Worlds* is a 2013 action-adventure game developed and published by Nintendo for the Nintendo 3DS. The game is the 17th in *The Legend of Zelda* series and is a sequel to the 1991 title *The Legend of Zelda: A Link to the Past*.

- [The Cutting Room Floor](https://tcrf.net/The_Legend_of_Zelda:_A_Link_Between_Worlds)
- [Wikipedia](https://en.wikipedia.org/wiki/The_Legend_of_Zelda:_A_Link_Between_Worlds)

## Azahar

The following is the game-specific information for Azahar.

See [Azahar](@/notes/Azahar.md) for general information.

### Gotchas

#### Fullscreen

It might be necessary to focus the game window twice on GNOME (once through Alt-Tab select, then again by pressing Super twice, then F4 to unpause).

#### StreetPass

**Do not** talk to Gramps in the game and **do not** enable the StreetPass. Otherwise, you will not be able to load the save file anymore!

If that happened to you anyway, delete the `~/.local/share/azahar-emu/nand/data/00000000000000000000000000000000/sysdata/00010026` folder [1].

### Settings

The following are per-game settings accessed by choosing Properties in the context menu of the game.

#### Enhancements

Set Internal Resolution to 2x.

#### Graphics

Set Graphics API to OpenGL.

#### Audio

Set emulation method to HLE (fast).

Disable audio stretching.

### Controls

The following are settings accessed by going to Emulation > Configure > Controls in the main menu.

#### Input

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
