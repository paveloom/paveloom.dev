# October 2023

### October, 5 {#5}

#### Counter-Strike: Source {#5#counter-strike-source}

Worked on fixing some of the issues with the [game](https://en.wikipedia.org/wiki/Counter-Strike:_Source) (almost finished with a blog post on fixing issues with fonts on Linux). Found my old `custom` folder and configs on an old laptop!

### Wednesday, 4 {#4}

#### [Kirk](../../git.md#kirk) {#4#kirk}

Set up [PVS-Studio](https://pvs-studio.com/en/pvs-studio), started going through the warnings.

### Tuesday, 3 {#3}

#### Japanese {#3#japanese}

Switched from the [Tae Kim's Guide to Learning Japanese](https://guidetojapanese.org/learn/complete) to [IMABI](https://imabi.org) for proper explanations.

#### [Kirk](../../git.md#kirk) {#3#kirk}

Started learning how to use [PVS-Studio](https://pvs-studio.com/en/pvs-studio). Since I got a trial key yesterday and packaged the CLI tools to [Nixpkgs](https://github.com/NixOS/nixpkgs) today, I will look into it first before returning to [`rr`](https://github.com/rr-debugger/rr) and [GDB](https://www.sourceware.org/gdb).

Excited to find out what their implementation of [MISRA C](https://en.wikipedia.org/wiki/MISRA_C) will find in my code!

#### Maintenance {#3#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/258817) to add [PVS-Studio](https://pvs-studio.com/en/pvs-studio) to [Nixpkgs](https://github.com/NixOS/nixpkgs).

### Monday, 2 {#2}

#### Maintenance {#2#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/258646) to add [VTFEdit](https://developer.valvesoftware.com/wiki/VTFEdit) to [Nixpkgs](https://github.com/NixOS/nixpkgs). That's a rather old Windows application (circa 2005--2011), but it's rather important for people who'd like to have high quality sprays in [Source](https://en.wikipedia.org/wiki/Source) games. So, I used [Wine](https://en.wikipedia.org/wiki/Wine_(software)) and [`winetricks`](https://github.com/Winetricks/winetricks) to make it work!
