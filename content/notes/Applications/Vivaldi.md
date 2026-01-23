+++
title = "Vivaldi"
+++

## Hardware Acceleration

As per [ArchWiki](https://wiki.archlinux.org/title/Chromium#Hardware_video_acceleration), on AMD GPU devices, VA-API does not work out of the box and requires Mesa >= 24.1 as well as enabling Vulkan. The latter can be done via a custom startup script and a custom desktop file.

Put the following code in `~/.local/share/applications/vivaldi-stable.bash`:

```bash
#!/usr/bin/env bash

# Uncomment this to enable debug output
# export VK_LOADER_DEBUG=driver

# This trick was used on NixOS to add driver files:
# export VK_ADD_DRIVER_FILES=/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json

FEATURES=(
  VaapiVideoDecoder
  VaapiIgnoreDriverChecks
  Vulkan
  DefaultANGLEVulkan
  VulkanFromANGLE
)
FEATURES_STRING=$(IFS=,; echo "${FEATURES[*]}")

exec vivaldi --enable-features="$FEATURES_STRING" "$@"
```

Copy the default desktop file for Vivaldi (usually located at `/usr/share/applications/vivaldi-stable.desktop`) to `~/.local/share/applications/vivaldi-stable.desktop`. Replace the default path to Vivaldi with `~/.local/share/applications/vivaldi-stable.bash`. Don't forget to add the executable bit to the script.

Visit the following links in the browser to debug the current state of the GPU support:

- `vivaldi:gpu`
- `vivaldi:media-internals`

Open any video in a browser tab, then go to the Media tab in the DevTools. For the current player, it should report `VaapiVideoDecoder` as the decoder, and `Hardware decoder` should be reported as `true`.

