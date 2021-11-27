+++
title = "How to install Spotify without ads on Fedora 35?"
description = "How would one install Spotify without ads on Fedora 35?"
+++

# {{ title() }} {#}
#### Updated: 27-Nov-2021 {#}

## [Spotify as a native package](#native) {#native}

First off, add [this](https://negativo17.org/repos/fedora-spotify.repo) DNF repository to the repository list of the system's package manager:

```bash
sudo dnf config-manager --add-repo https://negativo17.org/repos/fedora-spotify.repo
```

It provides repackaged Spotify's Ubuntu binaries for Fedora, thanks to [`@scaronni`](https://github.com/scaronni). [Here](https://negativo17.org/spotify-client/)'s the project's page. These binaries are easier to handle, contrary to the ones from the [RPMFusion repository](https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/#_using_the_rpm_fusion_repository).

Now you can install the Spotify client:

```bash
sudo dnf install spotify
```

Launch the application and login into your account. It will create the `~/.config/spotify` directory, including some files we will need later.

Close the application. We will handle blocking the ads now.

Checkout [this](https://github.com/abba23/spotify-adblock) repository (thanks to [@abba23](https://github.com/abba23)), build and install the shared library it provides:

```bash
git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
sudo make install
```

Note that it needs Make and a Rust toolchain.

The shared library object will be installed in `/usr/local/lib/spotify-adblock.so`. To use it, edit the client's wrapper script:

```bash
sudo nano /usr/bin/spotify
```

You can trick the symbols resolution at runtime by adding the following local environment variable before the `exec` statements:

```bash
# Other `export`s
# <...>
export LD_PRELOAD=/usr/local/lib/spotify-adblock.so

# `exec` statements
# <...>
```

The last thing to do is to remove ads placeholders and some other annoyances (like the Upgrade button) from the client.

Install [`spicetify-cli`](https://github.com/khanhas/spicetify-cli) by grabbing [an archive of a release](https://github.com/khanhas/spicetify-cli/releases). Unpack it and add the binary's directory to your `PATH`. Add permissions to change the Spotify files:

```bash
sudo chmod a+wr /usr/lib64/spotify-client
sudo chmod a+wr /usr/lib64/spotify-client/Apps -R
```

[Here](https://github.com/Daksh777/SpotifyNoPremium)'s a theme we can use, thanks to [@Daksh777](https://github.com/Daksh777). Checkout the repository, copy the `color.ini` and `user.css` files to a directory inside `~/.config/spicetify/Themes`. The name of the directory defines the name of the theme.

Configure Spicetify to use that theme:

```bash
spicetify config current_theme $THEME_NAME
```

Now, before applying it, set the Spotify client's location in the Spicetify's config. Go to `~/.config/spicetify/config-xpui.ini` and edit the following lines:

```ini
# <...>
prefs_path = $HOME/.config/spotify/prefs
# <...>
spotify_path = /usr/lib64/spotify-client
# <...>
```

Note that you will need to expand the `$HOME` variable.

Now backup the installation and apply the theme:

```
spicetify backup
spicetify apply
```

In case there is an update of the app, you will need to re-edit the wrapper script, re-add permissions, and re-apply the theme. That's it, enjoy!

## [Spotify as a Flatpak](#flatpak) {#flatpak}

Install the flatpak package from [Flathub](https://flathub.org/apps/details/com.spotify.Client), launch it and login into your account. This will create session files we will need later. After that, close the application.

Grab the shared library `spotify-adblock.so` from the [latest release](https://github.com/abba23/spotify-adblock/releases) of [`spotify-adblock`](https://github.com/abba23/spotify-adblock) (thanks to [@abba23](https://github.com/abba23)). It's built on the same runtime the Spotify Flatpak version uses. Put it in any directory (we will use `~/.spotify-adblock` here for simplicity).

Also, grab the configuration file [`config.toml`](https://github.com/abba23/spotify-adblock/blob/main/config.toml) from the latest commit and put it in `~/.config/spotify-adblock`.

Give Spotify a permission to read these directories:

```bash
flatpak override --user \
        --filesystem="~/.spotify-adblock/spotify-adblock.so" \
        --filesystem="~/.config/spotify-adblock/config.toml" \
        com.spotify.Client
```

You should now be able to run Spotify without ads by executing

```bash
flatpak run --command=sh com.spotify.Client \
-c 'eval "$(sed s#LD_PRELOAD=#LD_PRELOAD=$HOME/.spotify-adblock/spotify-adblock.so:#g /app/bin/spotify)"'
```

This hook is needed since Flatpaks tend to update their files. For your convenience, you can override the desktop file provided by Spotify, so that this hook executes each time you launch the application. For this, copy the `/var/lib/flatpak/app/com.spotify.Client/current/active/export/share/applications/com.spotify.Client.desktop` to the `/home/paveloom/.local/share/applications` directory. Edit this copy by changing the `Exec` statement to the following line:

```ini
Exec=/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=sh --file-forwarding com.spotify.Client -c 'eval "$(sed s#LD_PRELOAD=#LD_PRELOAD=$HOME/.spotify-adblock/spotify-adblock.so:#g /app/bin/spotify)"' @@u %U @@
```

That's all with ads, but we still need to remove placeholders from the application.

Install [`spicetify-cli`](https://github.com/khanhas/spicetify-cli) by grabbing [an archive of a release](https://github.com/khanhas/spicetify-cli/releases). Unpack it and add the binary's directory to your `PATH`. Add permissions to change the Spotify files:

```bash
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/current/active/files/extra/share/spotify
sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/current/active/files/extra/share/spotify/Apps -R
```

[Here](https://github.com/Daksh777/SpotifyNoPremium)'s a theme we can use, thanks to [@Daksh777](https://github.com/Daksh777). Checkout the repository, copy the `color.ini` and `user.css` files to a directory inside `~/.config/spicetify/Themes`. The name of the directory defines the name of the theme.

Configure Spicetify to use that theme:

```bash
spicetify config current_theme $THEME_NAME
```

Now, before applying it, set the Spotify client's location in the Spicetify's config. Go to `~/.config/spicetify/config-xpui.ini` and edit the following lines:

```ini
# <...>
prefs_path = $HOME/.config/spotify/prefs
# <...>
spotify_path = /var/lib/flatpak/app/com.spotify.Client/current/active/files/extra/share/spotify
# <...>
```

Note that you will need to expand the `$HOME` variable.

Now backup the installation and apply the theme:

```
spicetify backup
spicetify apply
```

In case there is an update of the app, you will need to re-add permissions and re-apply the theme. That's it, enjoy!
