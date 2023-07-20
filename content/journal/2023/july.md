# July 2023

### Thursday, 20 {#20}

#### Deltarune

Played [Deltarune](https://deltarune.com) today, and it's great! I did play the first episode when it came out, but I barely remembered anything from it. Brings back good memories from [Undertale](https://undertale.com), too!

#### Nixpkgs

Since I maintain some of the packages in [Nixpkgs](https://github.com/NixOS/nixpkgs), I sometimes want to make use of them before the associated pull requests are reviewed and merged. For that, I've made the `nixpkgs` input in my [NixOS flake](https://github.com/paveloom/dotfiles) point to the new `system` branch of [my copy of Nixpkgs](https://github.com/paveloom/nixpkgs). This branch is basically the same as the upstream's `nixos-unstable`, but I merge some of my local branches into it.

Here's how I've created it:

```bash
git checkout nixos-unstable
git pull --rebase upstream nixos-unstable
git checkout -b system
git merge zigmod
git push -u origin system
```

Here's how I can update it:

```bash
git checkout nixos-unstable
git pull --rebase upstream nixos-unstable
git checkout -b system
git rebase -r nixos-unstable
git push -f origin system
```

### Wednesday, 19 {#19}

#### [Groovy](../../git.md#groovy) {#19#groovy}

Was working on adding a preferences window, but got stuck at making the local settings schema visible to the program. Needed to create a custom target in the Meson build file just to get the `gschemas.compiled` file (the [built-in function](https://mesonbuild.com/Gnome-module.html#gnomecompile_schemas) assumes the location of the schema itself). I can just set `GSETTINGS_SCHEMA_DIR` to the path where this file is located, but I'd like to make it work out of the box (e.g., by setting the variable to a relative path in the Nix flake's `devshell`).

### Tuesday, 18 {#18}

#### Noita

I finally beat [Noita](https://noitagame.com) today! My strat is a wand with the [Pollen](https://noita.fandom.com/wiki/Pollen) spell with low cast and recharge times, with the [Projectile Repulsion Field](https://noita.fandom.com/wiki/Perks) perk. Spamming Pollen allows you to create a shield that consumes all projectiles and also moves automatically to the enemies, dealing damage to them. The Projectile Repulsion Field will push the projectiles from yourself, including Pollen. This way, if you're careful, pretty much nothing can hurt you. Add to this some modifiers to deal more damage (e.g., I had [Burning Trail](https://noita.fandom.com/wiki/Burning_Trail)), some protection perks (e.g., I had [Fire Immunity](https://noita.fandom.com/wiki/Perks)), and voilà. The final boss didn't deal any damage.

#### Objectivism {#18#objectivism}

Read more of [Objectivism: The Philosophy of Ayn Rand](https://en.wikipedia.org/wiki/Objectivism:_The_Philosophy_of_Ayn_Rand). Couple of things are bothering me:

1. There is a lot of accent on "an entity acts in accordance to its nature", but then how come most of an entity's actions are dependent on the context? For instance, using an example from the book, "under ordinary circumstances, if a child releases a balloon filled with helium, only one outcome is possible: the balloon will rise". Now, this might be true, but what if one releases the same balloon in space? Will it also "act in accordance to its nature" and rise up? Not really, it will just pop. Did the identity of the balloon change on a trip from Earth to outer space? When and how did that happen? Or is this example extraordinary and therefore doesn't count? The author mentions this nuance: "the same entity, *under the same circumstances*, will perform the same action", and yet continues to put emphasis on the entity itself, rather than the circumstances that really define the outcome.

2. When there is talk of causality, it is very probable to see an opinion on determinism. I can see (sort of a spoiler for myself, I guess) that Objectivism [rejects the latter](http://aynrandlexicon.com/lexicon/determinism.html), but I am now unsure what the justification might be. "The concept of <<cause>> is inapplicable to the universe", they say, but what about [physical cosmology](https://en.wikipedia.org/wiki/Physical_cosmology) then?

#### Whisparr {#18#whisparr}

Opened a [pull request](https://github.com/NixOS/nixpkgs/pull/244172) to add the [Whisparr](https://wiki.servarr.com/en/whisparr) NixOS module. Turns out it's not that hard to [write a NixOS module](https://nixos.org/manual/nixos/stable/index.html#sec-writing-modules) (especially if it's a service). There are nuances, of course, but overall it's rather straightforward, having lots of examples in [Nixpkgs](https://github.com/NixOS/nixpkgs).

### Monday, 17 {#17}

#### Whisparr {#17#whisparr}

I've been working on creating a NixOS module for the [Whisparr](https://wiki.servarr.com/en/whisparr) service.

### Sunday, 16 {#16}

#### [Groovy](../../git.md#groovy) {#16#groovy}

Finished reading the [GLib reference](https://docs.gtk.org/glib). Also, read the [Libadwaita reference](https://gnome.pages.gitlab.gnome.org/libadwaita/doc/1-latest). Ported the current code to Libadwaita.

#### Objectivism {#16#objectivism}

Read more of [Objectivism: The Philosophy of Ayn Rand](https://en.wikipedia.org/wiki/Objectivism:_The_Philosophy_of_Ayn_Rand). It seems to be very approachable and promises to be pragmatic (which is what I'd like to see by choosing non-fiction books first).

### Saturday, 15 {#15}

#### [Groovy](../../git.md#groovy) {#15#groovy}

Read more of the [GLib reference](https://docs.gtk.org/glib). By the way, the reference is better structured if you use [Devhelp](https://wiki.gnome.org/Apps/Devhelp) to access it.

#### Objectivism {#15#objectivism}

Started reading [Objectivism: The Philosophy of Ayn Rand](https://en.wikipedia.org/wiki/Objectivism:_The_Philosophy_of_Ayn_Rand).

### Friday, 14 {#14}

#### Life {#14#life}

Registered an application to the military commissariat today, so that they proceed with me according to the law. This is hopefully the last interaction with them this month, so I've finally finished with all these worries and now have some time for myself.

### Thursday, 13 {#13}

#### Life {#13#life}

Somewhat upset after the visit to the military commissariat today. The draft board there is seemingly unenthusiastic about me going against the system, although some draft department workers are genuinely trying to help. I might encounter unpleasant surprises in the fall.

### Wednesday, 12 {#12}

#### Life {#12#life}

Visited my local military commissariat today, taught some ol' fellas about alternative civilian service. Will be visiting them again tomorrow. Did some related paper work.

Changed the router at home to the one I was using in the dormitory while studying at the university. Turns out one antenna gives better coverage and more stable signal than three antennas (same [dBm](https://en.wikipedia.org/wiki/Decibel#Radio_power,_energy,_and_field_strength) and [dBi](https://en.wikipedia.org/wiki/Decibel#Antenna_measurements)). Not sure why, though.

### Tuesday, 11 {#11}

#### Nixpkgs

Answered to the reviews of the pull requests for [Zigmod](https://github.com/NixOS/nixpkgs/pull/217229) and [GR Framework](https://github.com/NixOS/nixpkgs/pull/238469).

Also, created a PR to update [`libremidi`](https://github.com/NixOS/nixpkgs/pull/242909). First time using [`nipkgs-review`](https://github.com/Mic92/nixpkgs-review) in a while!

#### Site

Made it so that the `repo_url` configuration option is set based on the hosting.

### Saturday, 8 {#8}

#### [Groovy](../../git.md#groovy) {#8#groovy}

We had a pretty rough thunderstorm today, had no electricity for quite some time and still don't have internet (this update will be pushed much later than committed). I was able to finish watching the [Creating a GObject in C](https://www.youtube.com/watch?v=1-_EBEr0fxI) video by [Christian Hergert](http://hergert.me) before lights went out. Did some small stylistic changes in the code after that. Then, I read some of the [GLib documentation](https://docs.gtk.org/glib).

I will be on a short business trip for the next couple of days.

### Friday, 7 {#7}

#### [Groovy](../../git.md#groovy) {#7#groovy}

Finished with the [GObject documentation](https://docs.gtk.org/gobject). Tested this new knowledge by rewriting the current code using subclassing.

### Thursday, 6 {#6}

#### [Groovy](../../git.md#groovy) {#6#groovy}

Read more of the [GObject documentation](https://docs.gtk.org/gobject).

### Wednesday, 5 {#5}

#### MAP {#5#map}

Read some more [MAP](../../pensieve/minor-attracted-person.md) related materials.

### Tuesday, 4 {#4}

#### MAP {#4#map}

Did some more study on [MAP](../../pensieve/minor-attracted-person.md) related topics.

### Monday, 3 {#3}

#### MAP {#3#map}

Was reading about [minor-related chronophilias](../../pensieve/minor-attracted-person.md) the whole day. This is apparently actually tabooed knowledge (it's even censored on Wikipedia, and bigoted by almost everyone on any platform).

### Sunday, 2 {#2}

#### [Groovy](../../git.md#groovy) {#2#groovy}

Have been reading the [GObject documentation](https://docs.gtk.org/gobject), and the library is actually pretty neat. But also somewhat convoluted. Insert the obligatory "we have [OOP](https://en.wikipedia.org/wiki/Object-oriented_programming) at home" meme here.

### Saturday, 1 {#1}

#### [Groovy](../../git.md#groovy) {#1#groovy}

Finished reading the additional documentation in the [GTK documentation](https://docs.gtk.org/gtk4). [GObject documentation](https://docs.gtk.org/gobject) is next, since having a grasp of the type system is essential.
