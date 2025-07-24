+++
title = "Bash: Brace expansion"
+++

In Bash, brace expansion is a mechanism by which arbitrary strings may be generated.

It has two forms:

1. Comma-separated strings.

   For example, `a{d,c,b}e` expands to `ade ace abe`.

2. Sequence expression.

   For example,

   - `S{1..4}` expands to `S1 S2 S3 S4`;
   - `{0..4..2}` expands to `0 2 4`;
   - `{a..f}` expands to `a b c d e f`.

Brace expansions can be combined. For example, `{a..b}{1..2}` expands to `a1 a2 b1 b2`.

Brace expansions tend to be most useful when dealing with file paths (especially if the paths are long and some of the files don't exist yet). For example, `mv /long/path/to/file_{old,new}`.

See [`man bash`](https://www.man7.org/linux/man-pages/man1/bash.1.html) for more information.

## See also

- [Bash](@/notes/Bash.md)
