+++
title = "How to install Spotify without ads on Fedora 34?"
description = "How would one install Spotify without ads on Fedora 34?"
+++

# {{ title() }} {#}
#### Updated: 17-Sep-2021 {#}


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

Checkout [this](https://github.com/abba23/spotify-adblock) repository, build and install the shared library it provides:

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

In case there is an update of the app, you will need to re-edit the wrapper script, re-add permissions, and re-apply the theme. That's it, enjoy.
