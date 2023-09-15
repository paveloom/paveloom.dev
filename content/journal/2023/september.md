# September 2023

### Friday, 15 {#15}

#### Maintenance {#15#maintenance}

Filled [an issue](https://gitlab.freedesktop.org/mesa/mesa/-/issues/9820) to [Mesa](https://mesa3d.org) about experiencing full desktop graphical glitches when interacting with certain applications, just to found out a half an hour later that I was missing the [`amdgpu`](https://en.wikipedia.org/wiki/AMDgpu_(Linux_kernel_module)) device driver, and instead was using [`fbdev`](https://en.wikipedia.org/wiki/Linux_framebuffer). Set it up as explained in the [NixOS Wiki](https://nixos.wiki/wiki/AMD_GPU).

Learned (in a very basic way) how to use [`apitrace`](https://apitrace.github.io) to create traces of graphics API calls. Built a 32-bit version of it (turns out Nixpkgs have [`pkgs.multiStdenv` and `pkgs.pkgsi686Linux`](https://nixos.wiki/wiki/Packaging/32bit_Applications) for such a case) to run with Steam. However, that didn't give me proper results, as described [here](https://github.com/apitrace/apitrace/wiki/Steam), but the 64-bit version from [Nixpkgs](https://github.com/NixOS/nixpkgs) did (somewhat).

UPD: never mind, the issue occurred again on a high load.

### Thursday, 14 {#14}

#### [Kirk](../../git.md#kirk) {#14#kirk}

Updated the dependencies and disabled [Nixpkgs hardening](https://nixos.org/manual/nixpkgs/stable/#sec-hardening-in-nixpkgs) for debug builds. Switched to [Soup](https://libsoup.org/libsoup-3.0) for handling [HTTP](https://en.wikipedia.org/wiki/HTTP) conversations (and so that I can easily switch to [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2) over [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) in the future). Found out that I can pass the [Qobuz](https://www.qobuz.com) token as the [`Authorization: Bearer <token>`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication) header instead of appending it to the query. Also, apparently, the `user_id` isn't required.

#### Maintenance {#14#maintenance}

Opened a [merge request](https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3583) to fix the memory leak on a graceful TCP disconnect in [GLib](https://docs.gtk.org/glib).

### Wednesday, 13 {#13}

#### Japanese {#13#japanese}

I think my [Anki](https://apps.ankiweb.net) setup is ready for new vocabulary now. Discovered that the [Refold](https://refold.la) community has *a lot* of resources for Japanese. Refreshed my knowledge of [Kana](https://en.wikipedia.org/wiki/Kana).

#### Wi-Fi

Here are two things I did to prevent my network speed from getting slower on idle on a wireless connection via [NetworkManager](https://www.networkmanager.dev):

1. Disable power saving globally:

    ```ini
    # /etc/NetworkManager/conf.d
    [connection]
    # Values are:
    # 0 (use the default value)
    # 1 (don't touch the existing setting)
    # 2 (disable powersave)
    # 3 (enable powersave)
    wifi.powersave = 2
    ```

    Can be accomplished on [NixOS](https://nixos.org) with

    ```nix
    networking.networkmanager.wifi.powersave = false;
    ```

2. Disable power saving on the currently active network interface directly:

    ```bash
    nmcli connection modify "$SSID" 802-11-wireless.powersave 2
    ```

    Check with

    ```bash
    nmcli -f 802-11-wireless.powersave connection show "$SSID"
    ```

    Reconnect to the network afterward.

Still unsure if it's enough, though.

### Tuesday, 12 {#12}

#### Maintenance {#12#maintenance}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/254700) to update [Picard](https://picard.musicbrainz.org) and a [pull request](https://github.com/NixOS/nixpkgs/pull/254797) to add [ChatALL](https://github.com/sunner/ChatALL) in [Nixpkgs](https://github.com/NixOS/nixpkgs). Learned how to package [Electron](https://www.electronjs.org) apps.

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
