# February 2023

### Friday, 10 {#10}

#### Git

To quickly fetch a branch of the upstream repo in a fork, run

```bash
git remote add upstream $UPSTREAM_REPO
git fetch --depth $DEPTH upstream $REMOTE_BRANCH:$LOCAL_BRANCH
git checkout $LOCAL_BRANCH
```

#### Subtitle Edit

Trying to package [Subtitle Edit](https://nikse.dk/subtitleedit) today. Downloading from the [cache](https://cache.nixos.org) is painfully slow... I'm not sure whether building it using the [`buildDotfileModule`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/dotnet/build-dotnet-module/default.nix) function will work, but I'd like to try that first instead of wrapping the executable from the portable version with [Mono](https://www.mono-project.com).

I need this program to run [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition) on picture-based subtitles (`dvdsub`, specifically).

### Thursday, 9 {#9}

#### Nixpkgs

Reading the [Nixpkgs manual](https://nixos.org/manual/nixpkgs/stable) today.

### Wednesday, 8 {#8}

#### Fish

You can immediately incorporate history changes from other sessions of the [Fish shell](https://fishshell.com) via [`history merge`](https://fishshell.com/docs/current/cmds/history.html). That's something I wanted for a long time but thought was not available. Here is a [thread](https://github.com/fish-shell/fish-shell/issues/825) with examples on automating the synchronization if necessary.

#### Nix

Reading the [Nix manual](https://nixos.org/manual/nix/stable) today.

### Tuesday, 7 {#7}

#### Leave No Trace

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
