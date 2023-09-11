# September 2023

### Monday, 11 {#11}

#### Learning {#11#learning}

Read the [Effective learning: Twenty rules of formulating knowledge](https://www.supermemo.com/en/blog/twenty-rules-of-formulating-knowledge) article, learned about the [Incremental reading](https://en.wikipedia.org/wiki/Incremental_reading) method as a side effect. Read the [Low-key Anki](https://web.archive.org/web/20210203165239if_/https://massimmersionapproach.com/table-of-contents/anki/low-key-anki/intro) series of articles and modified my Anki setup as suggested.

#### Maintenance {#11#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/254533) for adding [Fopnu](https://fopnu.com) to [Nixpkgs](https://github.com/NixOS/nixpkgs).

### Tuesday, 5 {#5}

#### Japanese {#5#japanese}

Read more of the [Anki](https://apps.ankiweb.net) manual.

#### Samba {#5#samba}

Set up [Samba](https://www.samba.org) on my [NixOS](https://nixos.org) machine, so that I can copy files to and from my iOS device (via the standard Files app). Turns out it can be done with just 3 lines of `smb.conf`:

```ini
[public]
path = %H/Public/Samba
vfs objects = fruit streams_xattr
writeable = yes
```

Don't forget to create the password for the user with `:::bash smbpasswd -a $USER`, though!

### Sunday, 3 {#3}

#### Japanese {#3#japanese}

Got into figuring out the nitty-gritty of how [Anki](https://apps.ankiweb.net)'s algorithm works. Worked on my [GENKI I](https://genki3.japantimes.co.jp/en) deck.

### Saturday, 2 {#2}

#### C {#2#c}

Watched some of the [VoxelRifts](https://www.youtube.com/@voxelrifts)' videos. Finally, some C positivity and DIY mentality!

#### Maintenance {#2#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/252981) to update [Anki](https://apps.ankiweb.net) in [Nixpkgs](https://github.com/NixOS/nixpkgs). The latest version has a fix for crashes caused by copying the contents of fields in the Browser. That said, they have the most horrendous build process I've ever seen.

### Friday, 1 {#1}

#### Japanese {#1#japanese}

Was learning how to use [Anki](https://apps.ankiweb.net) today. Already got into thinking about whether to use subdecks, tags, or fields for organization. I got a [deck](https://ankiweb.net/shared/info/1602436756) for [GENKI I](https://genki3.japantimes.co.jp/en), but will have to remake it.
