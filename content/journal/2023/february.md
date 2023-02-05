# January 2023

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
