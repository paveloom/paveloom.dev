+++
title = "How to install Spotify without ads?"
description = "How would one install Spotify without ads?"
+++

# {{ title() }} {#}
#### Updated: 22-May-2022 {#}

I recommend using the official Flatpak package. Install it from [Flathub](https://flathub.org/apps/details/com.spotify.Client), launch it and login into your account. This will create session files which we will need later. After that, close the application.

Install [`spicetify-cli`](https://github.com/khanhas/spicetify-cli) by grabbing [an archive of a release](https://github.com/khanhas/spicetify-cli/releases). Unpack it and add the binary's directory to your `PATH`.

Add permissions to change the Spotify's files:

```bash
SPOTIFY_PATH=/var/lib/flatpak/app/com.spotify.Client/current/active/
sudo chmod a+wr ${SPOTIFY_PATH}/files/extra/share/spotify
sudo chmod a+wr ${SPOTIFY_PATH}/files/extra/share/spotify/Apps -R
```

[Here](https://github.com/Daksh777/SpotifyNoPremium)'s a theme we can use, thanks to [@Daksh777](https://github.com/Daksh777). Clone the repository to the `Themes` directory and copy the AdBlock extension to the `Extensions` directory:

```bash
cd "$(dirname "$(spicetify -c)")/Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
cp "$(dirname "$(spicetify -c)")/Themes/SpotifyNoPremium/adblock.js" "$(dirname "$(spicetify -c)")/Extensions"
```

Configure Spicetify to use the theme and the extension:

```bash
spicetify config current_theme ${THEME_NAME}
spicetify config extensions adblock.js
```

Now, before applying it, set the Spotify client's location in the Spicetify's config. Go to `~/.config/spicetify/config-xpui.ini` and edit the following lines:

```ini
# <...>
prefs_path = ${HOME}/.config/spotify/prefs
# <...>
spotify_path = ${SPOTIFY_PATH}/files/extra/share/spotify
# <...>
```

Note that you will need to expand the `${HOME}` and `${SPOTIFY_PATH}` variables manually in this file.

Now backup the installation and apply the theme:

```
spicetify backup apply
```

In case there is an update of the app, you will need to re-add permissions and re-apply the theme. That's it, enjoy!
