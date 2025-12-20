+++
title = "Eden"
+++

The following is the game-specific information for Eden.

See [Eden](@/notes/Eden/_index.md) for general information.

## Settings

The following are per-game settings accessed by choosing *Configure Game* in the context menu of the game.

### Graphics

API Settings:

- API: Vulkan

Graphics settings:

- VSync Mode: Mailbox
- Anti-Aliasing Method: None

### Advanced Graphics

- GPU Accuracy: Normal
- DMA Accuracy: Default
- Anisotropic Filtering: Automatic
- ASTC Recompression Method: Uncompressed (Best quality)
- VRAM Usage Mode: Conservative
- [ ] Skip CPU Inner Invalidation
- [ ] Sync Memory Operations
- [x] Enable asynchronous presentation (Vulkan only)
- [ ] Force maximum clocks (Vulkan only)
- [x] Enable Reactive Flushing
- [x] Use asynchronous shader compilation (Hack)
- [ ] Fast GPU Time (Hack)
- [x] Use Vulkan pipeline cache
- [ ] Sync to framerate of video playback
- [x] Barrier feedback loops

### GPU Extensions

- Extended Dynamic State: 2
- [x] Vertex Input Dynamic State
- [ ] Provoking Vertex
- [ ] Descriptor Indexing
- [x] Sample Shading: 80%

## Controls

The following are settings accessed by going to Emulation > Configure > Controls in the main menu.

Create a separate profile for the game, and set the following controls for Player 1.

Left Stick:

- Left: `A`
- Up: `W`
- Down: `S`
- Right: `D`
- Pressed: `F`
- Modifier: `Shift`
- Modifier Range: 50%

D-Pad:

- Left: `Left`
- Up: `Up`
- Down: `Down`
- Right: `Right`

Bumpers:

- ZL: `Q`
- L: `I`
- ZR: `P`
- R: `E`

Buttons:

- Minus: `B`
- Plus: `M`

Face Buttons:

- X: `O`
- A: `;`
- Y: `K`
- B: `L`

Right stick:

- Left: `G`
- Up: `Y`
- Down: `H`
- Right: `J`
- Pressed: `N`
- Modifier: `U`
- Modifier Range: 50%

Motion:

- Motion 1: Mouse

   Press the button (the title will change to "Shake!"), then press left click elsewhere (the title will change to "Mouse"). You can adjust the gyro threshold by clicking an appropriate item in the context menu of the button. However, that settings appeared to change nothing in the game.

   The motion controls are required in certain parts of the game. To move the controller, do short swipes with LMB.
