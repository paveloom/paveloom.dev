+++
title = "Eden > Quickstart"
+++

See also the [parent note](@/notes/Eden/_index.md).

To start emulating Nintendo Switch games via Eden, you will need

- Encryption keys
- Nintendo Switch firmware
- Game files

At the time of writing, Eden supports Nintendo Switch firmware up to version 19.0.1. You need to make sure the encryption keys and the firmware files are for the same version.

You can get the encryption keys from [Prodkeys](https://prodkeys.net). Choose Yuzu on the main page, then choose a version of the encryption keys. Put the keys into the `~/.local/share/eden/keys` folder.

You can get the firmware from [Zoria's repo](https://github.com/THZoria/NX_Firmware/releases). Install it via *Tools > Install Firmware* in Eden.

You can get the games (in either NSP or XCI formats) from [NXBrew.net](https://nxbrew.net). Put the files in the application folder that you chose in Eden.

To install DLCs or updates, use *File > Install Files to NAND* dialog in Eden.

To install modes, choose *Open Mod Data Location* in the per-game context menu. Put the modes (as directories) in that location.

To enable/disable DLCs, updates, or modes, access the *Add-Ons* tab in the *Configure Game* dialog in the per-game context menu.
