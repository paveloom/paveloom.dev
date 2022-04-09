+++
title = "FFmpeg notes"
description = "These are short notes on how to do some tasks using FFmpeg"
+++

# {{ title() }} {#}
#### Updated: 11-Feb-2022 {#}

These are short notes on how to do some tasks using FFmpeg.

**# Adding subtitles, cutting two streams, normalizing the volume**

Do the first pass with the [`loudnorm`](https://ffmpeg.org/ffmpeg-filters.html#loudnorm) filter to measure the input parameters:

```bash
ffmpeg -ss 00:00:10 -i input.mkv -t 00:00:20 \
       -vn -af loudnorm=I=-12:TP=0.0:LRA=13.5:print_format=summary -f null -
```

This should give you something like this:

```
Input Integrated:    -29.3 LUFS
Input True Peak:     -15.1 dBTP
Input LRA:            13.5 LU
Input Threshold:     -39.9 LUFS

Output Integrated:   -10.1 LUFS
Output True Peak:     +0.0 dBTP
Output LRA:            5.2 LU
Output Threshold:    -20.3 LUFS

Normalization Type:   Dynamic
Target Offset:        -1.9 LU
```

Supply the measured values in the second pass:

```bash
ffmpeg -ss 00:00:10 -i input.mkv -t 00:00:20 \
       -ss 00:00:10 -i input.srt -ss 00:00:00 -t 00:00:20 \
       -map_metadata -1 -metadata:s:s:0 language=eng \
       -af loudnorm=I=-12:TP=0.0:LRA=13.5:measured_I=-29.3:measured_TP=-15.1:measured_LRA=13.5:measured_thresh=-39.9 \
       -ar 48k -c:a aac \
       -c:s mov_text \
       -c:v libx264 -crf 17 -preset slower -pix_fmt yuv420p \
       -movflags +faststart \
       output.mp4
```

Notes:
- the usage of [combined seeking](https://trac.ffmpeg.org/wiki/Seeking) for the subtitles stream;
- downsampling the audio to 48 kHz since the `loudnorm` filter upsamples it to 192 kHz.


**# Adding a delay to one of the audio tracks**

Add a 1.6 seconds delay to the 10th audio stream (which has 6 channels), remove the original one, and add this new one as the last one (12th):

```bash
ffmpeg -i input.mkv \
       -filter_complex "[0:a:9]adelay=1600|1600|1600|1600|1600|1600[out]" \
       -map 0 -map -0:a:9 -map [out] \
       -c copy -c:a:11 ac3 \
       -metadata title= -metadata:s:a:11 language=eng \
       output.mkv
```
