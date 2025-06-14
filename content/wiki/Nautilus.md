+++
title = "Nautilus"
+++

# Nautilus

**Nautilus** is a file manager for the GNOME desktop.

## Tips

### Thumbnails

The configuration for thumbnailers is located in

- {{ path(body="/usr/share/thumbnailers") }}
- {{ path(body="/usr/local/share/thumbnailers") }}
- {{ path(body="~/.local/share/thumbnailers") }}

Check the mime types in the thumbnailer entries to debug thumbnails not being generated.

The mime type of a file can queried via {{ c(body="xdg-mime query filetype FILE") }}.

Prominent thumbnailers:

- {{ c(body="ffmpegthumbnailer") }} (for audio/video, from the {{ c(body="media-video/ffmpegthumbnailer") }} package)
- {{ c(body="gdk-pixbuf-thumbnailer") }} (for images, from the {{ c(body="x11-libs/gdk-pixbuf") }} package)

Note that Nautilus shows thumbnails for the current device only by default (can be changed in settings).

References:
- [Ask Ubuntu: How to create custom thumbnailers for Nautilus, Nemo, and Caja?](https://askubuntu.com/questions/1368910/how-to-create-custom-thumbnailers-for-nautilus-nemo-and-caja)
