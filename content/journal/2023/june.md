# June 2023

### Thursday, 29 {#29}

#### [Groovy](../../git.md#groovy) {#29#groovy}

Fixed build dependencies for the blueprints, set up the package in the Nix flake.

### Wednesday, 28 {#28}

#### [`dotfiles`](../../git.md#dotfiles) {#28#dotfiles}

Changed my [Neovim](https://neovim.io) config, making it so that LSP clients (managed both via [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) and [`null-ls`](https://github.com/jose-elias-alvarez/null-ls.nvim)) are attached *after* a [Direnv](https://github.com/direnv/direnv) environment is exported. This is something that bothered me for a *long* time, and I finally fixed it (took me the whole day!).

Also, nuked the default `S` and `s` keybindings, those were rather annoying.

### Tuesday, 27 {#27}

#### [Groovy](../../git.md#groovy) {#27#groovy}

Added a configuration header. Read the [Blueprint](https://jwestman.pages.gitlab.gnome.org/blueprint-compiler)'s documentation. The tool is pretty neat! Waiting on [the bump](https://github.com/NixOS/nixpkgs/pull/238303) in the [Nixpkgs](https://github.com/NixOS/nixpkgs), though.

### Monday, 26 {#26}

#### [Groovy](../../git.md#groovy) {#26#groovy}

Set up a basic skeleton for the project, including the build scripts for common types of resources. Also, finally tried out [Blueprint](https://jwestman.pages.gitlab.gnome.org/blueprint-compiler).

### Sunday, 25 {#25}

#### C {#25#c}

Went through the [C reference on `cppreference.com`](https://en.cppreference.com/w/c).

#### [Groovy](../../git.md#groovy) {#25#groovy}

Moved my build system setup from the playground to the repository. Next up: reading into [Gtk](https://docs.gtk.org/gtk4), [GLib](https://docs.gtk.org/glib), [GObject](https://docs.gtk.org/gobject) (and maybe more). I also found [Devhelp](https://gitlab.gnome.org/GNOME/devhelp) to be useful for having these references offline and of the same version as the libraries in the current Nix environment.

### Friday, 23 {#23}

#### Documentation

I've been looking for options to implement [the documentation system](https://documentation.divio.com) for my future C project. Here are the variants so far:

- [`m.css`](https://mcss.mosra.cz) + [Doxygen](https://www.doxygen.nl) + [Doxygen C++ theme](https://mcss.mosra.cz/documentation/doxygen) (reference) + [MkDocs](https://www.mkdocs.org) + [Material for MkDocs](https://squidfunk.github.io/mkdocs-material) (everything else)
- [Sphinx](https://www.sphinx-doc.org) + [Doxygen](https://www.doxygen.nl) + [Breathe](https://breathe.readthedocs.io) (everything)
    - [Example](https://nanobench.ankerl.com)

### Thursday, 22 {#22}

#### C {#22#c}

Finished reading the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book.

I'm up for reading the [`cppreference.com`](https://cppreference.com) now for the up-to-date state of the language. By the way, while reading the aforementioned book, I've been using [Zeal](https://github.com/zealdocs/zeal) for having this reference offline and having a proper search engine for it.

#### `glibc`

Holy moly, [the GNU C Library (`glibc`) manual](https://www.gnu.org/software/libc/manual) is 1228 pages long in the PDF form... Anyhoo, coming from [Zig](https://ziglang.org), I'm used to being able to read the source code of the standard library, and it's somewhat convoluted to do since [GNU](https://www.gnu.org) folks prefer to use a stack of old technologies like [`gitweb`](https://git-scm.com/docs/gitweb) for Git web interface, [Mailman](https://list.org) for electronic mail discussion and e-newsletter lists, [Bugzilla](https://www.bugzilla.org) for tracking issues. I don't mind that, though, so I just cloned their repo locally.

#### GR {#22#gr}

Worked on [the PR review remarks](https://github.com/NixOS/nixpkgs/pull/238469), including creating [a PR to the upstream](https://github.com/sciapp/gr/pull/179).

### Wednesday, 21 {#21}

#### C {#21#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book.

Reading the chapter about the UNIX System Interface, getting some [Fortran](https://en.wikipedia.org/wiki/Fortran) flashbacks.

#### Private torrent trackers {#21#private-torrent-trackers}

I'm using 3 private trackers right now, and it's getting somewhat cumbersome managing the profiles on them. Today I finally found a torrent that doesn't exist on public trackers.

### Tuesday, 20 {#20}

#### C {#20#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book.

Played around more with the styles of the code (via [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html)). I'm one of those `AlwaysBreakAfterReturnType: AllDefinitions` type of guys...

#### Zigmod {#20#zigmod}

Worked on making builds via my `buildZigmodPackage` function avoid unnecessary builds of the fixed-output derivations for dependencies while making the build more deterministic (by requiring a lock file). [This pull request](https://github.com/NixOS/nixpkgs/pull/217229) is one of my earliest contributions to [Nixpkgs](https://github.com/NixOS/nixpkgs), and it's still work-in-progress!

### Monday, 19 {#19}

#### C {#19#c}

Started playing around with `struct`s. Added [`cpplint`](https://github.com/cpplint/cpplint) to the [Meson](https://mesonbuild.com) build file in my playground.

#### GR {#19#gr}

Spent a lot of time figuring out how to make the [Nix derivation](https://github.com/NixOS/nixpkgs/pull/238469) work on [Darwin](https://en.wikipedia.org/wiki/Darwin_(operating_system)). Even tried enabling [Objective-C](https://en.wikipedia.org/wiki/Objective-C) compilation by patching the [CMake](https://en.wikipedia.org/wiki/CMake) build file. Turns out the fixes are pretty simple: don't build the QtWayland module and use the Darwin specific `stdenv`.

### Sunday, 18 {#18}

#### C {#18#c}

Okay, I got it: you get a `:::c *char` if you just return an array, and you get a `:::c char (*)[SIZE]` if you return a pointer to an array with a known size. Here's a revised version of the yesterday's snippet:

??? "Explanations"

    ```c
    #include <stdio.h>

    // Constant `char`
    const char x1 = 'a';

    // Function returning a `char`
    char x2() { return x1; }

    // Pointer to a function returning a `char`
    char (*x3)() = &x2;

    // Array of `char`s
    char x4[] = {'b', x1};

    // Array of pointers to constant `char`s
    const char(*x5[]) = {&x1};

    // Array of pointers to functions returning a `char`
    char (*x6[])() = {&x2};

    // Function returning a pointer to an array of
    // pointers to functions returning a `char`
    char (*(*x7())[])() { return &x6; }

    // Function returning a pointer to an array of `char`s
    char *x8() { return x4; }

    // Array of pointers to functions returning
    // a pointer to an array of `char`s
    char *(*x9[])() = {x8};

    // Function returning a pointer to a fixed size array of `char`s
    char (*x10())[2] { return &x4; }

    // A fixed size array of pointers to functions returning
    // a pointer to a fixed size array of `char`s
    char (*(*x11[1])())[2] = {x10};

    // Print 'a' thrice
    int main() {
        char x = (*x7())[0]();
        printf("%c\n", x);
        x = x9[0]()[1];
        printf("%c\n", x);
        x = (*x11[0]())[1];
        printf("%c\n", x);
    }
    ```

#### GR {#18#gr}

Added a [package](https://github.com/NixOS/nixpkgs/pull/238469) for the [GR framework](https://gr-framework.org) to [Nixpkgs](https://github.com/NixOS/nixpkgs). It's my preferred plotting backend for quick plots via the [Plots](https://docs.juliaplots.org) package for [Julia](https://julialang.org) (I prefer [PGFPlotsX](https://kristofferc.github.io/PGFPlotsX.jl) for quality plots, though). With this package you will be able to easily use GR (just set the `GRDIR` variable) without having to resort to [`patchelf` hacks](https://gist.github.com/konfou/d12c0a26fc0d3b432dc9d23c86701fcb).

### Saturday, 17 {#17}

#### C {#17#c}

Here are a couple of scary looking type definitions in C (from [K&R](https://en.wikipedia.org/wiki/The_C_Programming_Language)):

- `:::c char (*(*x())[])()`
- `:::c char (*(*x[3])())[5]`

I couldn't figure out (yet) how to make my compiler happy about the last one (ain't a fan of pointers to fixed size arrays, seems like), but here are my explanations so far:

??? "Explanations"

    ```c
    #include <stdio.h>

    // Constant `char`
    const char x1 = 'a';

    // Function returning a `char`
    char x2() { return x1; }

    // Pointer to a function returning a `char`
    char (*x3)() = &x2;

    // Array of `char`s
    char x4[] = {x1, x1};

    // Array of pointers to constant `char`s
    const char(*x5[]) = {&x1};

    // Array of pointers to functions returning a `char`
    char (*x6[])() = {&x2};

    // Function returning a pointer to an array of
    // pointers to functions returning a `char`
    char (*(*x7())[])() { return &x6; }

    // Function returning a pointer to an array of `char`s
    char *x8() { return x4; }

    // Array of pointers to functions returning
    // a pointer to an array of `char`s
    char *(*x9[])() = {x8};

    // Print 'a' twice
    int main() {
        char x = (*x7())[0]();
        printf("%c\n", x);
        x = *(x9[0])();
        printf("%c\n", x);
    }
    ```

Also, check out [this pretty cool example](https://stackoverflow.com/a/2192802) of how to construct such definitions easily.

#### TorrentLeech

Okay, here's a hot tip if you're a [TorrentLeech](https://www.torrentleech.org) user: add 100 torrents slightly more than 10 MB and let the flow of [TL Points](https://wiki.torrentleech.org/doku.php/tl_points) commence!

Also, according to my testing, the points are updated at 40-20 minutes intervals. Specifically, at every 23d and 42d minute of each hour.

### Friday, 16 {#16}

#### C {#16#c}

Finished reading the [60 terrible tips for a C++ developer](https://pvs-studio.com/en/blog/posts/cpp/1053) article, and it's pretty good. Although, I still don't like that [OOP](https://en.wikipedia.org/wiki/Object-oriented_programming) abominations (especially those implemented in [C++](https://en.wikipedia.org/wiki/C%2B%2B)) are still pushed nowadays. Really, programs are just data structures and algorithms.

#### Mouse pad

Ordered a mouse pad today. Turns out there is some distinction in quality, and since I need it to be small, I'm forced to use cloth as the top material (which is not necessarily bad, but might be a problem if it gets dirty). And you still sorta inevitably have to overpay for a brand logo.

#### Objectivism

Watched the [Top 10 (+1) Things Leonard Peikoff Did For Me (and You)](https://www.youtube.com/watch?v=UU0oXMSHiN4) and it was really pleasant to listen to [Robert Nasir](https://robertnasir.com) genuinely and passionately explaining how [the man, the myth, the legend](https://peikoff.com) affected his life. It also made me think about how all-encompassing and enduring, yet close to the ground [Objectivism](https://en.wikipedia.org/wiki/Objectivism) can be, and I definitely need to pick it up sooner than later.

### Thursday, 15 {#15}

#### Apartment

Spent some time looking into how adults buy/rent apartments and stuff.

I think it's better to get a decent (some?) income first, though.

#### Static analyzer

Was reading the [60 terrible tips for a C++ developer](https://pvs-studio.com/en/blog/posts/cpp/1053) article today (and still haven't finished it). I'm not planning to touch [C++](https://en.wikipedia.org/wiki/C%2B%2B) in the foreseeable future, but I'm planning to switch to [C](https://en.wikipedia.org/wiki/C_(programming_language)) as my primary language, and this article is still quite useful. Ended up setting [`cppcheck`](https://cppcheck.sourceforge.io/) as a custom target in the [Meson](https://mesonbuild.com) build file in my playground project for [K&R](https://en.wikipedia.org/wiki/C_(programming_language)). I already had set up [ASan](https://clang.llvm.org/docs/AddressSanitizer.html) and [UBSan](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html) (which I find to be better than dynamic analysis via [Valgrind](https://valgrind.org)), and I guess I will be able to fit some more analyzers.

### Wednesday, 14 {#14}

#### C {#14#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book.

#### MTU

Now that I'm home, I was wondering whether there are issues with my home network configuration. I found out that my whole [MTU](https://en.wikipedia.org/wiki/Maximum_transmission_unit) configuration was inefficient. Here's what I did.

Before going forward, it makes sense to check what value of MTU your [ISP](https://en.wikipedia.org/wiki/Internet_service_provider) is recommending. For example, for [PPPoE v2](https://en.wikipedia.org/wiki/Point-to-Point_Protocol_over_Ethernet) it's 1492, but for [DS-Lite](https://en.wikipedia.org/wiki/DS-Lite) over PPPoE (which is what my ISP uses) it's 1452.

To find out the optimal MTU value for your currently active wireless network (assuming the interface is `wlo1`), disable VPN and run

```bash
ping -s $(( $(cat /sys/class/net/wlo1/mtu) - 28)) -M do "8.8.8.8" -c 1
```
The 28 bytes are subtracted because of the `ping` itself (see explanation [here](https://stackoverflow.com/a/38179753)). If your MTU is too high, you will see an error similar to

```
ping: local error: message too long, mtu=1452
```

where the specified value is the optimal MTU. Set it for your network (if you're using `NetworkManager`, you can do so via `nmtui`). Make sure you reconnect to the network, so the interface is recreated. You can check the current value of MTU by running `ip a`. Run the following command and make sure you receive a response:

```bash
ping -s $(( $(cat /sys/class/net/wlo1/mtu) - 28)) -D "8.8.8.8" -c 1
```

The [overhead of the Wireguard protocol](https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html) is 60 bytes if you're using IPv4 only or 80 bytes if you're using IPv6. Subtract the appropriate value and use the result as MTU in your Wireguard configs.

It also makes sense to benchmark your upload and download speeds after the changes on sites like [speedtest.net](https://www.speedtest.net) (use the closest server to your actual physical location for reliability) and compare them to the ones claimed by your ISP.

### Tuesday, 13 {#13}

#### C {#13#c}

Read some more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book. Playing around with pointers arithmetic right now.

### Monday, 12 {#12}

#### BookBrainz

I will be switching to [BookBrainz](https://bookbrainz.org) for linking to books going forward. Even though it's very much a work-in-progress, it seems to be the only viable open source bibliographical database. I've been using [Goodreads](https://en.wikipedia.org/wiki/Goodreads) before, but it's proprietary and owned by Amazon (big yikes). [Open Library](https://openlibrary.org) is fine, but I much prefer [MetaBrainz](https://metabrainz.org)'s products as a happy [MusicBrainz](https://musicbrainz.org) and [ListenBrainz](https://listenbrainz.org) user.

#### C {#12#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book. I learned today that the [C2x standard](https://en.wikipedia.org/wiki/C2x) will introduce traditional one-byte booleans, and that using `goto`s is okay to break out of a nested loop or to handle cleanup code from multiple locations.

#### Zigmod {#12#zigmod}

Spent some time refining the [derivation](https://github.com/NixOS/nixpkgs/pull/217229) for [Zigmod](https://github.com/nektro/zigmod).

### Sunday, 11 {#11}

#### Nix

Was researching ways of sandboxing [Nix](https://nixos.org) applications today (again). Aside from [Flatpak](https://www.flatpak.org) (which I use now) and [`firejail`](https://firejail.wordpress.com) (which I tried last time), I looked into [`bubblewrap`](https://github.com/containers/bubblewrap), [`bubblejail`](https://github.com/igo95862/bubblejail), [`nixpak`](https://github.com/nixpak/nixpak), [AppArmor](https://www.apparmor.net). All of these new ones pretty much expect you to write your own profiles when necessary, which is rather inconvenient. Compared to others, AppArmor doesn't require you to wrap the binaries and works as a kernel module based on system policies, which is very close to what I'd like. And yet, I missed easily declaring [Spotify](https://www.spotify.com) in conjunction with [`spicetify`](https://spicetify.app) (via [`spicetify-nix`](https://github.com/the-argus/spicetify-nix)); having better plugin support (e.g., for [`mpv`](https://mpv.io), [OBS](https://obsproject.com) and [VLC](https://www.videolan.org/vlc)); having [KeePassXC](https://keepassxc.org)'s browser integration working. So I nuked all Flatpaks and switched back to native packages. This is probably gonna bite me someday, but hey, whatever.

### Saturday, 10 {#10}

#### Meson {#10#meson}

Finished reading the manuals and playing around with [Meson](https://mesonbuild.com), [Ninja](https://ninja-build.org) and [Ccache](https://ccache.dev). Ready for some blazingly fast builds!

### Friday, 9 {#9}

#### Meson {#9#meson}

Home at last. Reading into [Meson](https://mesonbuild.com).

### Tuesday, 6 {#6}

#### [PMG](../../git.md#pmg) {#6#pmg}

Defended my diploma today and received an "excellent" rating! This work is finally finished.

Dobby is free!

### Monday, 5 {#5}

#### [PMG](../../git.md#pmg) {#5#pmg}

We gathered with groupmates today to discuss the presentations. Applied some stylistic changes as a result.

### Sunday, 4 {#4}

#### [PMG](../../git.md#pmg) {#4#pmg}

Aight, done did it: compressed the presentation under 10 minutes.

My legs hurt from walking in circles so much (pretty much the whole day on feet).

### Saturday, 3 {#3}

#### [PMG](../../git.md#pmg) {#3#pmg}

Committed the code of the presentation, rehearsed and reduced the text more (turns out there's really not that much you can fit under 10 minutes). I might reduce it even more, will do some more timing tomorrow.

### Friday, 2 {#2}

#### [PMG](../../git.md#pmg) {#2#pmg}

Spent most of the day just walking outside in circles, preparing the speech for the presentation. It's kinda chilly out there.

### Thursday, 1 {#1}

#### [PMG](../../git.md#pmg) {#1#pmg}

Worked on the presentation a bit more.

#### Private torrent trackers {#1#private-torrent-trackers}

Yesterday RARGB was [discontinued](https://web.archive.org/web/20230531105653/https://rarbg.to/index80.php). That's rather sad since it was one of the best *public* torrent trackers out there. [TorrentLeech](https://www.torrentleech.org), one of the popular *private* trackers, [gives away invites](https://reddit.com/r/OpenSignups/comments/13wwg7w/torrentleech_tl_opens_signups_invite_code) on the occasion, and today I got one. This is my first private tracker (and I've been torrenting for more than 10 years), so I learned about ratios, hit-and-runs, and more.

Here's my opinion so far: it doesn't make any sense to download releases that are not marked as `FREELEECH` (releases that don't count into the downloading count, meaning they don't affect the ratio, which is the division of uploaded to downloaded), since the pool of people is much smaller than on public trackers, and everyone downloading is obliged to be seeding, too. I can't really compete with people using seedboxes. Since `FREELEECH` releases are always seeded, you can get high-quality content (which is what is usually marked with this tag) quite easily.

TL Points are a joke, though, not gonna lie. I counted that it will take me about a year (without bonuses) of seeding to repay for the 3 GB I've downloaded today.
