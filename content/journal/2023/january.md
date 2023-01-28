# January 2023

### Saturday, 28 {#28}

#### FFmpeg

Read ["FFmpeg - The Ultimate Guide"](https://img.ly/blog/ultimate-guide-to-ffmpeg) today. It turned out to be pretty superficial material. They link to the [wiki](https://trac.ffmpeg.org/wiki) and the [documentation](https://www.ffmpeg.org/documentation.html), though, which I find as much better resources, so I guess the article is fine as a sort of introduction.

#### [`ffmpeg-static`](../../git.md#ffmpeg-static) {#27#zig-gir-ffi}

Build [`ffplay`](https://ffmpeg.org/ffplay.html), too.

Just an FYI: I have lots of examples for building libraries statically in this repository.

#### GitHub Actions

Here's an example of checking for the event name:

```yaml
if: github.event_name == 'workflow_dispatch'
```

#### `mkdocs-section-index`

Ironically, got site builds breaking with the new version of `mkdocs-material`. Filed an [issue](https://github.com/oprypin/mkdocs-section-index/issues/13).

#### Podman

If you get any kind of "No space left on device" error while operating on a volume inside a container, try to delete the dangling volumes:

```bash
podman volume rm $(podman volume ls -f "dangling=true" -q)
```

Similarly, you can clean up dangling images:

```bash
podman rmi -f $(podman images -f "dangling=true" -q)
```

#### Tenacity

Just wanted to check out the progress on [Tenacity](https://tenacityaudio.org). Ended up in their [Flatpak repo](https://github.com/tenacityteam/tenacity-flatpak-nightly) again, and I'm surprised I've never noticed that they build an [OCI image](https://github.com/orgs/tenacityteam/packages/container/package/tenacity-flatpak-nightly) to distribute the bundle, and they imitate a Flatpak repo using [GitHub Pages](https://github.com/tenacityteam/tenacity-flatpak-nightly/tree/gh-pages). Pretty neat stuff, I might borrow the idea in the future.

#### [`zig-gir-ffi`](../../git.md#zig-gir-ffi) {#28#zig-gir-ffi}

Documentation strings are done for methods and functions. Handling the array type seems to be a problem.

I still have the ["Don't Write Comments"](https://www.youtube.com/watch?v=Bf7vDBBOBUA) video on my mind. I didn't agree with it first, but for this project I'm leaning more towards restraining the amount of comments and documentation strings. The ["Why, not what"](https://www.youtube.com/watch?v=Bf7vDBBOBUA&lc=UgxXL3g8Gn0xjkymGo94AaABAg) advice is a good one, too.

### Friday, 27 {#27}

#### Python-Markdown {#27#python-markdown}

The [SmartyPants](https://python-markdown.github.io/extensions/smarty) extension converts ASCII dashes, quotes and ellipses to their HTML entity equivalents. Very handy.

#### Slav Art

Just an FYI: you can download lossless music from [Qobuz](https://www.qobuz.com/us-en/shop), [Deezer](https://www.deezer.com/en/channels/explore), and [Tidal](https://tidal.com/browse) for free using the Slav Art's bot. Here's an [invite](https://divolt.xyz/invite/TStW7rFg) to their [Revolt](https://revolt.chat) server called Divolt. Here's an [invite](https://discord.gg/85wE4nFyjG) to their Discord server, which is used as a backup. You can also download music from Spotify, SoundCloud, YouTube Music, and JioSaavn, but in a lossy format.

#### Soulseek

You can check out my music collection by searching for `paveloom` in a [Soulseek](https://en.wikipedia.org/wiki/Soulseek) client. I would recommend the [Nicotine+](https://nicotine-plus.org) client.

#### Stoicism

Pretty good quote from today's [Daily Stoic](https://dailystoic.com) email:

> Believe me, it is the sign of a great man, and one who is above human error, not to allow his time to be frittered away.

--- [Seneca the Younger](https://en.wikipedia.org/wiki/Seneca_the_Younger), ["On the Shortness of Life"](https://en.wikipedia.org/wiki/De_Brevitate_Vitae_%28Seneca%29), 49 AD

#### Zig {#27#zig}

Makes sense to use [`std.mem.allocSentinel`](https://ziglang.org/documentation/0.10.0/std/#root;mem.Allocator.allocSentinel) if you need a sentinel-terminated slice from an array allocation.

#### [`zig-gir-ffi`](../../git.md#zig-gir-ffi) {#27#zig-gir-ffi}

Just a reminder: if you're dealing with parsing XML using [XPath](https://www.w3.org/TR/xpath-31), make sure you register the namespaces first. Here's an [example](https://grantm.github.io/perl-libxml-by-example/namespaces.html) from the Perl bindings for [`libxml2`](https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home). They also have pretty good [examples](https://grantm.github.io/perl-libxml-by-example/xpath.html) for the XPath expressions.

Aight, the generation of callables is almost ready. Left to do:

- Documentation strings;
- Some types are not handled yet;
- A dependency on the object of the same name;
- Casting;
- Perhaps, something else.

Also, I can see the design shaping: `from` and `toString` methods for all types. Gotta make it like that for the object generation source file, too.

### Thursday, 26 {#26}

So it begins…

#### Neovim

If you don't want your windows resized after closing one, set

```lua
vim.opt.equalalways = false
```

in your config. I just did it because closing Neo-tree would resize everything.

#### Python-Markdown {#26#python-markdown}

You can create or change an anchor by adding `{#my-anchor}` after a section or a link. Same as when using [Zola](https://www.getzola.org), if I remember correctly. I use custom anchors for the sections on this page.

#### Zig {#26#zig}

Might want to consider using [`std.mem.sliceTo`](https://ziglang.org/documentation/0.10.0/std/#root;mem.sliceTo) in the future instead of [`std.mem.span`](https://ziglang.org/documentation/0.10.0/std/#root;mem.span) where applicable.

Also, it's okay to *not* have a null terminator on a slice if you know the length anyway.

#### [`zig-gir-ffi`](../../git.md#zig-gir-ffi) {#26#zig-gir-ffi}

Created a simple CLI. Had an almost ready commit from yesterday. Lazy to do more today.

`g_irepository_get_default()` causes "still reachable" memory leaks even though the program has exited after showing the help. That's weird.

Next thing is object methods. Gonna move fields to a different function first, though. Also, probably should delete some cases from the main switch statement.
