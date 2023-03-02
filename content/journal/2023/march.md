# March 2023

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
