# How to install Spotify without ads on Linux?

I recommend using the official Flatpak package. Install it from [Flathub](https://flathub.org/apps/details/com.spotify.Client), launch it and login into your account. This will create session files which we will need later. After that, close the application.

Install [`spicetify-cli`](https://github.com/khanhas/spicetify-cli).

Add permissions to change the Spotify's files:

```bash
SPOTIFY_PATH=/var/lib/flatpak/app/com.spotify.Client
sudo chmod a+wr ${SPOTIFY_PATH}/current/active/files/extra/share/spotify
sudo chmod a+wr ${SPOTIFY_PATH}/current/active/files/extra/share/spotify/Apps -R
```

[Here](https://github.com/Daksh777/SpotifyNoPremium)'s a theme we can use, thanks to [@Daksh777](https://github.com/Daksh777). Clone the repository to the `Themes` directory and copy the AdBlock extension to the `Extensions` directory:

```bash
CONFIG_PATH=$(dirname "$(spicetify -c)")
cd "${CONFIG_PATH}/Themes"
git clone https://github.com/Daksh777/SpotifyNoPremium
cp "${CONFIG_PATH}/Themes/SpotifyNoPremium/adblock.js" "${CONFIG_PATH}/Extensions"
```

Now, set the Spotify client's location in the Spicetify's config. Go to `~/.config/spicetify/config-xpui.ini` and edit the following lines:

```ini
# <...>
spotify_path = ${SPOTIFY_PATH}/current/active/files/extra/share/spotify/
# <...>
prefs_path = ${HOME}/.var/app/com.spotify.Client/config/spotify/prefs
# <...>
```

Note that you will need to expand the `${HOME}` and `${SPOTIFY_PATH}` variables manually in this file.

Configure Spicetify to use the theme and the extension:

```bash
spicetify config current_theme SpotifyNoPremium
spicetify config extensions adblock.js
```

Now backup the installation and apply the theme:

```bash
spicetify backup apply
```

In case there is an update of the app, you will need to re-add permissions and re-apply the theme.

That's it, enjoy!
