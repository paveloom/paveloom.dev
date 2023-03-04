# March 2023

### Saturday, 4 {#4}

#### [`gnome-shell-memento-mori`](../../git.md#gnome-shell-memento-mori)

I've tested my extension on [GNOME OS Nightly](https://os.gnome.org), [added support](https://extensions.gnome.org/review/39009) for GNOME 44.

I've also switched to pure [NPM](https://www.npmjs.com) from [Bun](https://bun.sh) and added a [Nix flake](https://github.com/paveloom-t/gnome-shell-memento-mori/blob/4ac49ec193dca04509982e4433c9ef0ba3a43b12/flake.nix).

#### Virt-Manager

Learned how to set up [Virtual Machine Manager](https://virt-manager.org) with file sharing between the host and the guest systems on NixOS:

1. Follow the instructions on the [NixOS Wiki](https://nixos.wiki/wiki/Virt-manager)
2. Add the [`virtiofsd`](https://gitlab.com/virtio-fs/virtiofsd) package
3. From the virtual hardware details of a machine: `Add Hardware` → `Filesystem`.

    Set driver to `virtiofs`, source path -- to the path on your host machine. Target path is an arbitrary string used as a mount tag (e.g., `host`).

4. Add

    ```xml
    <binary path="/run/current-system/sw/bin/virtiofsd" xattr="on"/>
    ```

    to the XML config of the new Filesystem virtual hardware.

5. In the Guest system: run `sudo mkdir /media/host` and put

    ```
    host /media/host virtiofs rw,users,_netdev 0 0
    ```

    in `/etc/fstab`. Should mount automatically, but you might need to log out and log in again.

### Friday, 3 {#3}

#### Nix

I've been trying to rewrite the Nix expression of this very site to take advantage of fixed-output derivations. I've encountered some issues

- The `.git` directory is pruned from the local source (e.g., `./.`)
- Seems like there is something non-deterministic in [PDM](https://pdm.fming.dev/latest)'s cache
- Timestamps of all files in the store are reset (this breaks latest revision dates)

The first one can be bypassed by fetching the repo from a Git forge. Proper investigation would be required for the second one. And the third one is making this whole idea a no-go.

Gotta stick with the development shell on this one.

### Thursday, 2 {#2}

#### Zigmod {#2#zigmod}

[Finished](https://github.com/NixOS/nixpkgs/pull/217229#issuecomment-1451479971) the yesterday's work. Learned how to write [package tests](https://nixos.org/manual/nixpkgs/stable/#sec-package-tests) along the way.

### Wednesday, 1 {#1}

#### Objectivism

There seems to be a couple of issues with [Objectivism](https://en.wikipedia.org/wiki/Objectivism):

- [Glaring lack of priority of virtue acquisition in ethics](https://forum.objectivismonline.com/index.php?/topic/1892-aristotelianism-vs-objectivism/)
- [Rather aggressive focus on extremes](https://www.youtube.com/watch?v=TrmT6t0XWOk&lc=UgxEMuhawljZYRDbAeR4AaABAg.9mgbYFdyIM49mgjsq2_-0b)

The latter is something that struck me, too, while reading "[Philosophy: Who Needs It](https://en.wikipedia.org/wiki/Philosophy:_Who_Needs_It)".

Interestingly, both linked resources mention these issues, and both refer to [Aristotelianism](https://en.wikipedia.org/wiki/Aristotelianism) as a more practical solution. This might be a reason to explore the latter in parallel to objectivism.

#### Zigmod {#1#zigmod}

I learned how to use [fixed-output derivations](https://nixos.org/manual/nix/stable/language/advanced-attributes.html#adv-attr-outputHash) in [Nix](https://nixos.org) packages. This is big since it allows me to package pretty much anything now (you can bypass the network restrictions with them).

I'm almost done with the rewrite of the [Zigmod](https://github.com/nektro/zigmod) package, but deterministic builds with Git repositories are [apparently pretty complex](https://github.com/NixOS/nixpkgs/issues/8567). Thankfully, I only need the code, so I fixed my issue last minute by nuking all `.git` directories.
