# June 2023

### Wednesday, 14 {#14}

#### C {#14#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book.

#### MTU

Now that I'm home, I was wondering whether there are issues with my home network configuration. I found out that my whole [MTU](https://en.wikipedia.org/wiki/Maximum_transmission_unit) configuration was inefficient. Here's what I did.

Before going forward, it makes sense to check what value of MTU your [ISP](https://en.wikipedia.org/wiki/Internet_service_provider) is recommending. For example, for [PPPoE v2](https://en.wikipedia.org/wiki/Point-to-Point_Protocol_over_Ethernet) it's 1492, but for [DS-Lite](https://en.wikipedia.org/wiki/DS-Lite) over PPPoE (which is what my ISP uses) it's 1452.

To find out the optimal MTU value for your currently active wireless network (assuming the interface is `wlo1`), disable VPN and run

```bash
ping -s $(( $(cat /sys/class/net/wlo1/mtu) - 28)) -M do "8.8.8.8" -c 1
```
The 28 bytes are subtracted because of the `ping` itself (see explanation [here](https://stackoverflow.com/a/38179753)). If your MTU is too high, you will see an error similar to

```
ping: local error: message too long, mtu=1452
```

where the specified value is the optimal MTU. Set it for your network (if you're using `NetworkManager`, you can do so via `nmtui`). Make sure you reconnect to the network, so the interface is recreated. You can check the current value of MTU by running `ip a`. Run the following command and make sure you receive a response:

```bash
ping -s $(( $(cat /sys/class/net/wlo1/mtu) - 28)) -D "8.8.8.8" -c 1
```

The [overhead of the Wireguard protocol](https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html) is 60 bytes if you're using IPv4 only or 80 bytes if you're using IPv6. Subtract the appropriate value and use the result as MTU in your Wireguard configs.

It also makes sense to benchmark your upload and download speeds after the changes on sites like [speedtest.net](https://www.speedtest.net) (use the closest server to your actual physical location for reliability) and compare them to the ones claimed by your ISP.

### Tuesday, 13 {#13}

#### C {#13#c}

Read some more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book. Playing around with pointers arithmetic right now.

### Monday, 12 {#12}

#### BookBrainz

I will be switching to [BookBrainz](https://bookbrainz.org) for linking to books going forward. Even though it's very much a work-in-progress, it seems to be the only viable open source bibliographical database. I've been using [Goodreads](https://en.wikipedia.org/wiki/Goodreads) before, but it's proprietary and owned by Amazon (big yikes). [Open Library](https://openlibrary.org) is fine, but I much prefer [MetaBrainz](https://metabrainz.org)'s products as a happy [MusicBrainz](https://musicbrainz.org) and [ListenBrainz](https://listenbrainz.org) user.

#### C {#12#c}

Read more of the [C programming language](https://en.wikipedia.org/wiki/The_C_Programming_Language) book. I learned today that the [C2x standard](https://en.wikipedia.org/wiki/C2x) will introduce traditional one-byte booleans, and that using `goto`s is okay to break out of a nested loop or to handle cleanup code from multiple locations.

#### Nixpkgs

Spent some time refining the [derivation](https://github.com/NixOS/nixpkgs/pull/217229) for [Zigmod](https://github.com/nektro/zigmod).

### Sunday, 11 {#11}

#### Nix

Was researching ways of sandboxing [Nix](https://nixos.org) applications today (again). Aside from [Flatpak](https://www.flatpak.org) (which I use now) and [`firejail`](https://firejail.wordpress.com) (which I tried last time), I looked into [`bubblewrap`](https://github.com/containers/bubblewrap), [`bubblejail`](https://github.com/igo95862/bubblejail), [`nixpak`](https://github.com/nixpak/nixpak), [AppArmor](https://www.apparmor.net). All of these new ones pretty much expect you to write your own profiles when necessary, which is rather inconvenient. Compared to others, AppArmor doesn't require you to wrap the binaries and works as a kernel module based on system policies, which is very close to what I'd like. And yet, I missed easily declaring [Spotify](https://www.spotify.com) in conjunction with [`spicetify`](https://spicetify.app) (via [`spicetify-nix`](https://github.com/the-argus/spicetify-nix)); having better plugin support (e.g., for [`mpv`](https://mpv.io), [OBS](https://obsproject.com) and [VLC](https://www.videolan.org/vlc)); having [KeePassXC](https://keepassxc.org)'s browser integration working. So I nuked all Flatpaks and switched back to native packages. This is probably gonna bite me someday, but hey, whatever.

### Saturday, 10 {#10}

#### Meson {#10#meson}

Finished reading the manuals and playing around with [Meson](https://mesonbuild.com), [Ninja](https://ninja-build.org) and [Ccache](https://ccache.dev). Ready for some blazingly fast builds!

### Friday, 9 {#9}

#### Meson {#9#meson}

Home at last. Reading into [Meson](https://mesonbuild.com).

### Tuesday, 6 {#6}

#### [PMG](../../git.md#pmg) {#6#pmg}

Defended my diploma today and received an "excellent" rating! This work is finally finished.

Dobby is free!

### Monday, 5 {#5}

#### [PMG](../../git.md#pmg) {#5#pmg}

We gathered with groupmates today to discuss the presentations. Applied some stylistic changes as a result.

### Sunday, 4 {#4}

#### [PMG](../../git.md#pmg) {#4#pmg}

Aight, done did it: compressed the presentation under 10 minutes.

My legs hurt from walking in circles so much (pretty much the whole day on feet).

### Saturday, 3 {#3}

#### [PMG](../../git.md#pmg) {#3#pmg}

Committed the code of the presentation, rehearsed and reduced the text more (turns out there's really not that much you can fit under 10 minutes). I might reduce it even more, will do some more timing tomorrow.

### Friday, 2 {#2}

#### [PMG](../../git.md#pmg) {#2#pmg}

Spent most of the day just walking outside in circles, preparing the speech for the presentation. It's kinda chilly out there.

### Thursday, 1 {#1}

#### [PMG](../../git.md#pmg) {#1#pmg}

Worked on the presentation a bit more.

#### Private torrent trackers

Yesterday RARGB was [discontinued](https://web.archive.org/web/20230531105653/https://rarbg.to/index80.php). That's rather sad since it was one of the best *public* torrent trackers out there. [TorrentLeech](https://www.torrentleech.org), one of the popular *private* trackers, [gives away invites](https://reddit.com/r/OpenSignups/comments/13wwg7w/torrentleech_tl_opens_signups_invite_code) on the occasion, and today I got one. This is my first private tracker (and I've been torrenting for more than 10 years), so I learned about ratios, hit-and-runs, and more.

Here's my opinion so far: it doesn't make any sense to download releases that are not marked as `FREELEECH` (releases that don't count into the downloading count, meaning they don't affect the ratio, which is the division of uploaded to downloaded), since the pool of people is much smaller than on public trackers, and everyone downloading is obliged to be seeding, too. I can't really compete with people using seedboxes. Since `FREELEECH` releases are always seeded, you can get high-quality content (which is what is usually marked with this tag) quite easily.

TL Points are a joke, though, not gonna lie. I counted that it will take me about a year (without bonuses) of seeding to repay for the 3 GB I've downloaded today.
