# October 2023

### Tuesday, 17 {#17}

#### C++ {#17#c++}

Read more of [A Tour of C++](https://www.stroustrup.com/tour3.html).

#### Maintenance {#17#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/261589) to update [Tracy](https://github.com/wolfpld/tracy) in [Nixpkgs](https://github.com/NixOS/nixpkgs).

#### [`mpv`](https://mpv.io) {#17#mpv}

Turns out you can create per-directory configuration files (`mpv.conf`) and make them loaded automatically if you enable the [`use-filedir-conf`](https://mpv.io/manual/stable/#options-use-filedir-conf) option. So, for example, you can select an audio stream, a subtitles stream, a size and a position of the subtitles, for all files in a directory. Really useful when watching series!

### Monday, 16 {#16}

#### C++ {#16#c++}

Read more of [A Tour of C++](https://www.stroustrup.com/tour3.html). Already diving in complexities like [the rule of three/five/zero](https://en.cppreference.com/w/cpp/language/rule_of_three). Added locally a `pkg-config` file to the [Nixpkgs](https://github.com/NixOS/nixpkgs) package for [Microsoft's Guidelines Support Library](https://github.com/Microsoft/GSL) to make it work with Meson.

### Friday, 13 {#13}

#### C++ {#13#c++}

Started reading [A Tour of C++](https://www.stroustrup.com/tour3.html).

### Thursday, 12 {#12}

#### [Kirk](../../git.md#kirk) {#12#kirk}

Finished reading the [GDB manual](https://sourceware.org/gdb/current/onlinedocs/gdb).

### Wednesday, 11 {#11}

#### [Kirk](../../git.md#kirk) {#11#kirk}

Finished setting up additional linters ([`clang-tidy`](https://clang.llvm.org/extra/clang-tidy), [`scan-build`](https://clang-analyzer.llvm.org/scan-build.html), and [PVS-Studio](https://pvs-studio.com)). Surprisingly, there was only one new warning that I found useful: I didn't initialize a variable in one place, and `clang-tidy` notified me about that.

Read a part of the [GDB manual](https://sourceware.org/gdb/current/onlinedocs/gdb).

### Monday, 9 {#9}

#### Algorithms & Data Structures {#9#algorithms-and-data-structures}

Started reading [Cracking the Coding Interview](https://www.amazon.com/dp/0984782850).

#### Japanese {#9#japanese}

Dropped learning the language since I don't see the pragmatic reasoning of its usage anymore.

### Friday, 6 {#5}

#### Counter-Strike: Source {#6#counter-strike-source}

Wrote the blog post after finally figuring out how to fix the issues with the fonts.

### Thursday, 5 {#5}

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
