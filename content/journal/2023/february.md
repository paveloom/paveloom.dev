# February 2023

### Thursday, 23 {#23}

#### Dwarf Fortress

Wanted to buy the Steam version of [Dwarf Fortress](https://store.steampowered.com/app/975370/Dwarf_Fortress) today (and to try it with the [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) runtime on NixOS). That's somewhat tricky to do in Russia. I tried to do it via [Qiwi](https://qiwi.com)'s Steam Kazakhstan option, but apparently the Steam store is [down right now](https://gamerant.com/is-steam-down-february-2023-sons-forest-release) because of the new [Sons Of The Forest](https://store.steampowered.com/app/1326470/Sons_Of_The_Forest) game. What a coincidence. And I haven't been playing games in a long while.

### Wednesday, 22 {#22}

#### Git {#22#git}

Apparently, you can fetch a single commit from a repo ([source](https://stackoverflow.com/a/43136160)):

```bash
git init
git remote add origin $URL
git fetch --depth 1 origin $SHA1
git checkout FETCH_HEAD
```

#### Zigmod {#22#zigmod}

[Added](https://github.com/NixOS/nixpkgs/pull/217229#issuecomment-1440782009) a script for generating the list of dependencies.

Thinking that it's better to do it like that than packaging the whole dependency tree in Nixpkgs.

### Tuesday, 21 {#21}

#### [`zig-gir-ffi`](../../git.md#zig-gir-ffi) {#21#zig-gir-ffi}

Added a Nix flake. This required me to somehow address the fact that there is no `/usr/share` on Nix based systems. I decided to traverse `XDG_DATA_DIRS` paths as a solution.

### Monday, 20 {#20}

#### Objectivism {#20#objectivism}

Poking around some topics in an interest to know how [objectivism](../../pensieve/objectivism.md) would apply to them.

Issues like

- Poverty, medical care, etc.
- Altruism vs. charity
- Communism vs. social betterment

There are a lot of interpretations (and misinterpretations) around these and many other topics applied to this philosophy. It seems to me, though, that the answers are mostly common sense.

### Sunday, 19 {#19}

#### `direnv` {#19#direnv}

Okay, I guess I will just have tooling available globally instead of specifying it in flakes. This solves an issue with forks (like `nixpkgs`) where it's often inconvenient to add extra files that are not covered by a `.gitignore`.

#### Zigmod {#19#zigmod}

Created a [PR](https://github.com/NixOS/nixpkgs/pull/217229) for adding [Zigmod](https://github.com/nektro/zigmod) to [`nixpkgs`](https://github.com/NixOS/nixpkgs).

It's a package manager for Zig that I use. The official one is [in the works](https://github.com/ziglang/zig/pull/14265), though!

Shout-out to [Meghan](https://github.com/nektro), by the way. She created Zigmod and also inspired this very journal!

### Saturday, 18 {#18}

#### `direnv` {#18#direnv}

Set up [`direnv`](https://github.com/direnv/direnv) and [`nix-direnv`](https://github.com/nix-community/nix-direnv) today for the first time.

I have a couple of use cases in mind for them:

- Setting up specific versions of tools easily (Zig stable vs. nightly, for example)
- Setting up native dependencies easily
- Making builds more reproducible

I've created a [flake for this very site](https://github.com/paveloom/paveloom.github.io/blob/6f385d534b64fe31ef3ac2bd0ca920e46cfe04a8/flake.nix). I've also set up CI/CD using Nix (which turned out to be somewhat more complicated than I thought).

#### Wezterm

Solved the [mystery](https://github.com/wez/wezterm/issues/3106) with the disappearing cursor that bugged me since I installed NixOS for the first time. Just gotta set the `XCURSOR_THEME` variable to your theme (`Adwaita` in my case).

### Friday, 17 {#17}

#### Nixpkgs {#17#nixpkgs}

My first ever [pull request](https://github.com/NixOS/nixpkgs/pull/215877) to [Nixpkgs](https://github.com/NixOS/nixpkgs) got merged this night. I am officially one of the maintainers and a member of the organization now!

#### Objectivism {#17#objectivism}

Watched the "[Introduction to Objectivism, by Leonard Peikoff](https://www.youtube.com/watch?v=hlJD0i_WwdQ)" lecture. It's amazing. I correlate many of the ideas of [objectivism](../../pensieve/objectivism.md) with my own beliefs, so I am eager to dive into the works of [Ayn Rand](https://en.wikipedia.org/wiki/Ayn_Rand) as soon as possible.

### Thursday, 16 {#16}

#### Nix Pills

Finished [Nix Pills](https://nixos.org/guides/nix-pills) today. Those are good for understanding the core concepts behind basic functions used in [Nixpkgs](https://nixos.org/manual/nixpkgs/stable).

#### Star Wars {#16#star-wars}

I've replaced the "[Hello there!](https://odysee.com/@paveloom:e/Hello-there:cf)" and "[Unlimited power!](https://odysee.com/@paveloom:e/Unlimited-Power:b)" clips on Odysee with [SDR](https://en.wikipedia.org/wiki/Standard-dynamic-range_video) versions (different release). That way, you can watch it on mobile devices, too.

### Wednesday, 15 {#15}

#### `core-js`

The [story](https://github.com/zloirock/core-js/blob/master/docs/2023-02-14-so-whats-next.md) of the [`core-js`](https://github.com/zloirock/core-js)'s maintainer is horrifying.

As an open source developer myself, I will *most likely* have similar problems in terms of monetary income. The current plan is to seek a job in the field which would allow me to work on open source on a side. I strongly believe in [Trade Free](https://www.trade-free.org)'s take on this:

> The ones who offer, should not ask anything in return. The ones who receive, should not have to give anything in return.

Some of the [LiberaManifesto](https://liberamanifesto.com)'s takes are relatable, too:

> We owe you nothing. You owe us nothing.

This is why I would *probably* hesitate from any kind of donations on my projects. But to make that work, a traditional job seems to be the only viable choice. I'm not *yet* sure startups are worth the risk, even though they give much more freedom.

#### Maniac

In other news, the [Maniac](https://www.imdb.com/title/tt5580146) series are pretty good. Silly at times, but it's good silly. Why aren't they more popular, though?

And I still don't understand why are they called Maniac (besides being based on other series of the same name).

#### Star Wars {#15#star-wars}

Preparing the "[Hello there!](https://odysee.com/@paveloom:e/Hello-there:cf)" and "[Unlimited power!](https://odysee.com/@paveloom:e/Unlimited-Power:b)" clips today so I can link to them on my [about](about) page.

One of the features that I miss from [µTorrent](https://www.utorrent.com) while using [qBittorrent](https://www.qbittorrent.org) is media streaming. It allows one to seek a video file while it is being sequentially downloaded, and by doing so changing *what part* of the file is being downloaded. This is very useful for extracting small clips out of big releases that are otherwise too big to download in the whole.

Today I used [WebTorrent](https://webtorrent.io) for the first time. It's pretty bad, but it has support for media streaming (it is its prime feature). Using it, I was able to

- Find the timestamps of the scenes in a smaller release by seeking it while it is being downloaded
- Find the same scenes in a 4K release while it is also being downloaded

Then, I was able to extract the scenes from a partially downloaded file via FFmpeg:

```bash
ffmpeg -y -ss 01:14:40 -i input.mkv -t 40 -c copy -map 0 "cut.mkv"
```

After that, I did a more precise cut, splitting on I-frames, as I described [here](../../../blog/ffmpeg-notes/#cutting-an-m2ts-video-starting-with-an-i-frame). Turns out chapters and subtitles can make the duration of the resulting file longer, so I have added a note about that.

Also, apparently LBRY's player converts [HDR](https://en.wikipedia.org/wiki/High_dynamic_range) to [SDR](https://en.wikipedia.org/wiki/Standard-dynamic-range_video) just fine (Odysee's grays it out, though).

### Tuesday, 14 {#14}

#### LBRY

You have to transcode audio from [Dolby AC-3](https://en.wikipedia.org/wiki/Dolby_Digital) to [AAC](https://en.wikipedia.org/wiki/Advanced_Audio_Coding) before uploading to [LBRY](https://lbry.com), otherwise there will be no sound.

I would recommend the [FDK AAC](https://en.wikipedia.org/wiki/Fraunhofer_FDK_AAC) codec.

#### [`lbry-desktop`](../../git.md#lbry-desktop)

Updated my no blacklist fork to version [`0.53.9`](https://github.com/paveloom-f/lbry-desktop/releases/tag/v0.53.9).

#### Leave No Trace {#14#leave-no-trace}

Transcoding "[Leave No Trace](https://www.imdb.com/title/tt3892172)" extras today.

Uploaded them on [YouTube](https://www.youtube.com/playlist?list=PL2EO_Vc8r8e0Nz48xRHe1OhZy185FvDt2) and [LBRY](https://odysee.com/@paveloom:e/Leave-No-Trace-%282018%29-Extras:c).

#### Nixpkgs {#14#nixpkgs}

If you want to `nix develop` a package and your `unpackPhase` fails with something like

```
<...>
cp: cannot create regular file 'source/<hash>-source/<file>': Permission denied
<...>
do not know how to unpack source archive /nix/store/<hash>-source
```

that's probably because the unpacker wanted to unpack the source directory, but the `source` directory wasn't empty. It creates a directory inside, but if there are other directories, it won't be sure what to unpack.

You can fix this by adding

```nix
preUnpack = ''
  rm -rf source
'';
```

to your Nix expression.

#### Transmission

I am somewhat impressed that [Transmission](https://transmissionbt.com) developers have created native clients for all major platforms. That's something I thought was really cool but also pretty hard to do in general.

I still prefer [qBittorrent](https://www.qbittorrent.org), though.

### Monday, 13 {#13}

#### Anytype

Got an invite to [Anytype](https://anytype.io)'s Alpha Program today. You know... after two years of signing up for it, or something like that.

And yeah, it's basically [Notion](https://www.notion.so). And also an [Electron](https://www.electronjs.org) app. I don't really have any use for it right now.

#### Home Manager

I found out that [Home Manager](https://github.com/nix-community/home-manager) doesn't trigger package rebuilds on changing overlay attributes. Just as a user package does, it also binds packages to the garbage collector root that is attached to the currently running session (check with `nix-store --query --roots`). However, since a rebuild didn't happen, it reuses the built version in the store. Hence, you cannot apply changes until you reboot and garbage collect (via `sudo nix-collect-garbage`) again.

This might be a case against putting packages in `home.packages` instead of `users.users.<name>.packages`.

#### NixOS {#13#nixos}

Moved to [NixOS](https://nixos.org) completely. [Silverblue](https://silverblue.fedoraproject.org) is gone.

#### Nixpkgs {#13#nixpkgs}

More missing packages:

- [Identity](https://gitlab.gnome.org/YaLTeR/identity)
- [Login Manager Settings](https://github.com/realmazharhussain/gdm-settings)
- [Upscaler](https://gitlab.com/TheEvilSkeleton/Upscaler)

Also, a [package](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/tools/tracy/default.nix) for [Tracy](https://github.com/wolfpld/tracy) is missing a desktop file.

###### Subtitle Edit {#13#subtitle-edit}

Added a [desktop file](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html) to the package. Learned how to use [`icoutils`](https://www.nongnu.org/icoutils) for extracting icons from Windows executables. `nixpkgs` also provide the [`makeDesktopItem`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/make-desktopitem/default.nix) function which makes creating desktop files easier.

### Sunday, 12 {#12}

#### NixOS {#12#nixos}

Adding more packages to [my configuration](https://github.com/paveloom/dotfiles) today, preparing to nuke [Silverblue](https://silverblue.fedoraproject.org)'s partitions.

Stumbled on a couple of issues with the packages:

- [`pipiwire-rs` is broken](https://github.com/NixOS/nixpkgs/issues/211610) (affects [Authenticator](https://gitlab.gnome.org/World/Authenticator) and [Fractal Next](https://gitlab.gnome.org/GNOME/fractal) for me)
- [`radicle-cli` is broken](https://github.com/NixOS/nixpkgs/issues/216013)
- No package for [NormCap](https://github.com/dynobo/normcap)

#### Subtitle Edit {#12#subtitle-edit}

I've created a [PR](https://github.com/NixOS/nixpkgs/pull/215877) this night to [`nixpkgs`](https://github.com/NixOS/nixpkgs).

### Saturday, 11 {#11}

#### Git {#11#git}

Rant time: there is no way to update a repo from a shallow clone.

Welp, gotta `git fetch --unshallow upstream master` the [`nixpkgs`](https://github.com/NixOS/nixpkgs) repo for a few hours now...

#### Subtitle Edit {#11#subtitle-edit}

Seems like [Subtitle Edit](https://nikse.dk/subtitleedit) requires .NET Framework 4.8. This is problematic since Nixpkgs switched to .NET 6.0 as the default (LTS) version, which is incompatible with the Framework one. [`buildDotfileModule`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/dotnet/build-dotnet-module/default.nix) wouldn't work, and I'm unsure how to fetch proper [NuGet](https://www.nuget.org) dependencies for [`buildDotfilePackage`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/dotnet/build-dotnet-package/default.nix). There is no [`passthru.fetch-deps`](https://github.com/NixOS/nixpkgs/blob/aebc76376ca2da5ee4524326e6f83a3a18587d54/pkgs/build-support/dotnet/build-dotnet-module/default.nix#L164) in the latter one.

I switched to the backup plan of wrapping with [Mono](https://www.mono-project.com).

###### `DllImport`

Some gotcha I found out: you probably should not add `lib` in front of a library when using `DllImport`. An example of that in the Subtitle Edit's code:

```c#
[DllImport("libhunspell")]
[DllImport("mpv", CallingConvention = CallingConvention.Cdecl)]
```

The application would find `libmpv` in the `LD_LIBRARY_PATH`, but would ignore `libhunspell`. A workaround for that is to add a symbolic link to the library's shared object to the directory from which the application is loaded:

```nix
ln -s ${hunspell.out}/lib/libhunspell*.so $out/bin/libhunspell.so
```

That's described [here](https://www.mono-project.com/docs/advanced/pinvoke/#linux-shared-library-search-path) and [here](https://www.mono-project.com/docs/advanced/pinvoke/#library-names).

### Friday, 10 {#10}

#### Git {#10#git}

To quickly fetch a branch of the upstream repo in a fork, run

```bash
git remote add upstream $UPSTREAM_REPO
git fetch --depth $DEPTH upstream $REMOTE_BRANCH:$LOCAL_BRANCH
git checkout $LOCAL_BRANCH
```

#### Subtitle Edit {#10#subtitle-edit}

Trying to package [Subtitle Edit](https://nikse.dk/subtitleedit) today. Downloading from the [cache](https://cache.nixos.org) is painfully slow... I'm not sure whether building it using the [`buildDotfileModule`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/dotnet/build-dotnet-module/default.nix) function will work, but I'd like to try that first instead of wrapping the executable from the portable version with [Mono](https://www.mono-project.com).

I need this program to run [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition) on picture-based subtitles (`dvdsub`, specifically).

### Thursday, 9 {#9}

#### Nixpkgs {#9#nixpkgs}

Reading the [Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable) today.

### Wednesday, 8 {#8}

#### Fish

You can immediately incorporate history changes from other sessions of the [Fish shell](https://fishshell.com) via [`history merge`](https://fishshell.com/docs/current/cmds/history.html). That's something I wanted for a long time but thought was not available. Here is a [thread](https://github.com/fish-shell/fish-shell/issues/825) with examples on automating the synchronization if necessary.

#### Nix

Reading the [Nix manual](https://nixos.org/manual/nix/stable) today.

### Tuesday, 7 {#7}

#### Leave No Trace {#7#leave-no-trace}

Even though [the movie](https://www.imdb.com/title/tt3892172) is mostly about struggles with [PTSD](https://en.wikipedia.org/wiki/Post-traumatic_stress_disorder), I really like its seemingly (intentional?) anti-societal message. Or, rather, that it propagates a more non-conformal and down-to-earth approach to human relationships rather than the one cultivated by contemporary culture.

#### So You Want to Be a Wizard

Julia Evans's "[So you want to be a wizard](https://jvns.ca/blog/so-you-want-to-be-a-wizard)" talk is pretty inspiring. She has a [blog](https://jvns.ca) and she publishes computer zines at [Wizard Zines](https://wizardzines.com). There's an [accompanying zine](https://wizardzines.com/zines/wizard) to that talk, and the "[The Pocket Guide to Debugging](https://wizardzines.com/zines/debugging-guide)" one is a good overview of practical approaches for debugging.

### Monday, 6 {#6}

#### `mpv`

Okay, if you don't want your movie evening ruined like it is now for me, change the `mpv`'s `hwdec` setting to `auto` instead of `auto-safe`. For some reason, in the latter variant, the player doesn't pick up the `dav1d` (AV1) decoder automatically.

#### Reflections on a decade of coding

Reading [Jamie Brandon](https://www.scattered-thoughts.net)'s "[Reflections on a decade of coding](https://www.scattered-thoughts.net/writing/reflections-on-a-decade-of-coding)" today.

While I'm going through that, I would like to point out two very general pieces of advice I try to use everywhere in my life, especially in software development:

1. Be pragmatic
2. Be curious

### Sunday, 5 {#5}

#### *Arrs

Last night, while trying to fall asleep, I found out that I missed the beginning of the new season of [The Owl House](https://en.wikipedia.org/wiki/The_Owl_House)... which started 4 months ago. So, today I set up [Sonarr](https://wiki.servarr.com/en/sonarr) and [Prowlarr](https://wiki.servarr.com/en/prowlarr) to make missing shows a thing of the past. I would recommend [the wiki](https://wiki.servarr.com/) and [TRaSH Guides](https://trash-guides.info) if you'd like to have an automated way to get the newest episodes of the shows. Make sure to check out variants for other media types, too!

Make sure you got the permissions right, though, I spent some time [dealing with that](https://github.com/paveloom/dotfiles/blob/04cb805a628da521f00a2a6eb9b78e10fefcb5d8/configuration.nix#L74-L81). There is also a nuance with the public indexers lying about the number of seeds, so that's something you might need to address, too.

### Saturday, 4 {#4}

#### NixOS {#4#nixos}

A bit more configuration done.

### Friday, 3 {#3}

#### NixOS {#3#nixos}

Okay, added lots of packages. Definitely struggled with [overlays](https://nixos.wiki/wiki/Overlays) for a while, but I figured it out.

[Here](https://github.com/Misterio77/nix-starter-configs)'s a good example of a simple config.

This entry is committed from the new OS!

### Thursday, 2 {#2}

#### NixOS {#2#nixos}

I added support for secrets in [my configuration](https://github.com/paveloom/dotfiles) via [`sops-nix`](https://github.com/Mic92/sops-nix), [`ssh-to-age`](https://github.com/Mic92/ssh-to-age), [`sops`](https://github.com/mozilla/sops), and [`age`](https://github.com/FiloSottile/age).

Create an [Ed25519](https://en.wikipedia.org/wiki/EdDSA#Ed25519) SSH key if you don't have one yet:

```bash
ssh-keygen -t ed25519 -C "<email>"
```

Derive an `age` key from the SSH key:

```bash
mkdir -p ~/.config/sops/age
read -s SSH_TO_AGE_PASSPHRASE; export SSH_TO_AGE_PASSPHRASE
go run github.com/Mic92/ssh-to-age/cmd/ssh-to-age@latest -i ~/.ssh/id_ed25519.pub
go run github.com/Mic92/ssh-to-age/cmd/ssh-to-age@latest -private-key -i ~/.ssh/id_ed25519 -o ~/.config/sops/age/keys.txt
```

Test the `age` key:

```bash
echo "Hello there!" > test
age -e -r "<public key>" test > test.age
age -d -i ~/.config/sops/age/keys.txt test.age
```

`.sops.yaml`:

```yaml
keys:
  - &age-key <public key>
creation_rules:
  - path_regex: ^secrets.yaml$
    key_groups:
      - age:
          - *age-key
```

Create / edit secrets via `sops secrets.yaml`.

### Wednesday, 1 {#1}

#### NixOS {#1#nixos}

Aight, [there is much configuration to do](https://www.youtube.com/watch?v=O2IqlyS0CJk&t=2294s). I've installed NixOS on the disk since I couldn't build [QuiteRSS](https://quiterss.org) from source in a virtual machine. Ironically, I couldn't do that on a real machine either. Gonna look out for a replacement ([NewsFlash](https://gitlab.com/news-flash/news_flash_gtk), most likely).

On a related note, I have an unfinished project for my own RSS reader called [Tidings](../../git.md#tidings).

#### Plex

You can start a [Plex](https://www.plex.tv) server in a container with

```bash
sudo podman run \
  -d \
  --name plex \
  --network=host \
  -e TZ="<timezone>" \
  -v /path/to/database:/config:Z \
  -v /path/to/transcode:/transcode:Z \
  -v /path/to/data:/data:Z \
  docker.io/plexinc/pms-docker
```

The Web interface is at [`http://localhost:32400/web`](http://localhost:32400/web). Make sure the directories have sufficient privileges. See more info about the image [here](https://github.com/plexinc/pms-docker).
