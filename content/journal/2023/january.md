# January 2023

### Thursday, 26 {#26}

So it begins…

#### Neovim

If you don't want your windows resized after closing one, set

```lua
vim.opt.equalalways = false
```

in your config. I just did it because closing Neo-tree would resize everything.

#### Python-Markdown

You can create or change an anchor by adding `{#my-anchor}` after a section or a link. Same as when using [Zola](https://www.getzola.org), if I remember correctly. I use custom anchors for the sections on this page.

#### Zig

Might want to consider using [`std.mem.sliceTo`](https://ziglang.org/documentation/0.10.0/std/#root;mem.sliceTo) in the future instead of [`std.mem.span`](https://ziglang.org/documentation/0.10.0/std/#root;mem.span) where applicable.

Also, it's okay *not* to have a null terminator on a slice if you know the length anyway.

#### [`zig-gir-ffi`](../../git.md#zig-gir-ffi)

Created a simple CLI. Had an almost ready commit from yesterday. Lazy to do more today.

`g_irepository_get_default()` causes “still reachable” memory leaks even though the program has exited after showing the help. That's weird.

Next thing is object methods. Gonna move fields to a different function first, though. Also, probably should delete some cases from the main switch statement.
