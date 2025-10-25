+++
title = "`emerge` commands"
+++

The following are `emerge` commands often used while preparing an ebuild.

Install build dependencies for a package:

```bash
emerge -o <atom>
```

Install build dependencies and test dependencies for a package: 

```bash
emerge -o --with-test-deps=y <atom>
```

Install build dependencies for a package, ignoring the binary package:

```bash
emerge -o --usepkg-exclude=<atom> <atom> 
```

Install build dependencies for a package with the `doc` USE flag enabled:

```bash
emerge -o <atom>[doc]
```

Clean redundant packages:

```bash
emerge --depclean
```

Clean redundant packages and all build dependencies:

```bash
emerge --depclean --with-bdeps=n
```
