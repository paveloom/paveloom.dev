+++
title = "What format to store in?"
+++

While lossless formats ([FLAC](https://en.wikipedia.org/wiki/FLAC), [WAV](https://en.wikipedia.org/wiki/WAV)) are great for preserving original quality, using them for a local music collection can result in significant usage of storage space. If that's undesirable, using lossy formats can solve the problem.

While choosing between [many lossy audio coding formats](https://en.wikipedia.org/wiki/Audio_coding_format#List_of_lossy_formats), transcoding to the [Opus](https://en.wikipedia.org/wiki/Opus_(audio_format)) format in the VBR mode with highest compression level is a good way of having the best quality at the smallest file size.

Lossless audio files can be transcoded using [FFmpeg](https://ffmpeg.org) with the [`libopus`](https://ffmpeg.org/ffmpeg-codecs.html#libopus-1) audio encoder. The default settings for that encoder have `vbr` set to `on` and `compression_level` set to 10 (the highest).

Thus, it is enough to call

```bash
ffmpeg -i "file.flac" -c:a libopus "file.opus"
```

See also [my script](https://gitlab.com/paveloom-g/other/convert-to-opus) with an example of size difference for a release.
