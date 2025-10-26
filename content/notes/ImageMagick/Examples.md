+++
title = "Examples"
+++

The following are examples of using ImageMagick:

Strip metadata:

```bash
mogrify -strip image.png
```

Convert and rescale an image:

```bash
magick -verbose "image.HEIC" -strip -quality 90 -resize 1500x "image.png"
```
