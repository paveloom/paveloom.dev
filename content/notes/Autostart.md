+++
title = "Autostart"
+++

To make an application automatically start on systems with a session manager (e.g., `systemd`), it is enough to put its desktop file into one of the following directories:

- `$XDG_CONFIG_HOME/autostart/` (by default, `~/.config/autostart/`)
- `$XDG_CONFIG_DIRS/autostart/` (by default, `/etc/xdg/autostart/`)

The desktop files in the user's directory take precedence.

On GNOME, this can be simplified via the [GNOME Tweaks](https://gitlab.gnome.org/GNOME/gnome-tweaks) application that provides an app selector for startup applications.

See also:

- [Desktop Application Autostart Specification](https://specifications.freedesktop.org/autostart-spec/latest/)
