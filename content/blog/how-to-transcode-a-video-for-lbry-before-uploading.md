# How to transcode a video for LBRY before uploading?

The built-in video transcoding functionality in the LBRY desktop application starts an
FFmpeg utility process with the following parameters:

```go
ffmpeg -i "/path/to/input/file.ext" -y -c:s copy -c:d copy \
          -c:v libx264 -crf 24 -preset faster -pix_fmt yuv420p \
          -vf "scale=if(gte(iw\,ih)\,min(1920\,iw)\,-2):if(lt(iw\,ih)\,min(1920\,ih)\,-2)" \
          -maxrate 5500K -bufsize 5000K -movflags +faststart \
          -c:a aac -b:a 160k "/path/to/output/file.mp4"
```

The meanings of the passed parameters:

- `-c:s copy` and `-c:d copy` tell FFmpeg to copy subtitles and data,
  respectively;
- `-c:v libx264 -crf 24 -preset faster -pix_fmt yuv420p` tells FFmpeg to
  transcode the video using the `H.264` codec with constant rate factor equal to 24, with
  the `faster` preset and using the YUV color space with the `4:2:0` scheme for chroma
  subsampling;
- `-vf "..."` specifies that the height and width of the video cannot be greater than
  1920 pixels, and both values must be a multiple of two;
- `-maxrate 5500K -bufsize 5000K` specifies the maximum bitrate to be 5500 Kb/s
  with a buffer equal to 5000 Kb/s;
- `-movflags +faststart` tells FFmpeg to move the «moov atom» (the metadata)
  from the end of the file to its beginning to improve playback in browsers;
- `-c:a aac -b:a 160k` tells FFmpeg to transcode the audio using the native `AAC` codec with
  constant bitrate equal to 160 kb/s.

An alternative option for transcoding a horizontal video with increased bitrate, better
quality and compression:

```bash
ffmpeg -i "/path/to/input/file.ext" -y -c:s copy -c:d copy \
          -c:v libx264 -crf 17 -preset slower -pix_fmt yuv420p \
          -maxrate 8M -bufsize 8M -movflags +faststart \
          -c:a libfdk_aac "/path/to/output/file.mp4"
```

One may select optimal CRF values by performing tests on a small sample of the
target file. The average bitrate of the transcoded test file should be close to
the target bitrate. The CRF value of 17 is generally sufficient to produce a
video with indistinguishable quality. Note that with a fixed CRF value, the
target bitrate may not always be reached, and the encoder will use more bits
if necessary.

A sample can be cut from the source file like this:

```bash
ffmpeg -ss 00:01:00 -i input.ext -t 00:00:10 -c copy sample.ext
```

References:

- [Guide for encoding video using FFmpeg](https://trac.ffmpeg.org/wiki/Encode/H.264)
- [Guide for encoding audio using FFmpeg](https://trac.ffmpeg.org/wiki/Encode/AAC)
- [Guide for scaling using FFmpeg](https://trac.ffmpeg.org/wiki/Scaling)
- [Guide for limiting bitrate using FFmpeg](https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate)
- [Options for MP4 containers](https://ffmpeg.org/ffmpeg-formats.html#Options-9)
- [Article about rate control modes](https://slhck.info/articles/rate-control)
- [Article about CRF](https://slhck.info/articles/crf)
