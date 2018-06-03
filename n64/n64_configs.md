# N64 Custom Configs

#### There are two image files `8Bitdo N64 Gamepad Mapping` and `Generic USB Joystick Mapping.png` that show the button mappings to each controller for reference.

#### The config files `8Bitdo N64 GamePad.cfg` and `Generic   USB  Joystick  .cfg` should be moved to   `/opt/retropie/configs/all/retroarch-joypads` with the `setup.sh` script in this repository

# Notes on N64 configs

* Location of Overlay/Bezel images and configs:
```
  /opt/retropie/emulators/retroarch/overlays/borders/Nintendo-64.png
  /opt/retropie/emulators/retroarch/overlays/borders/Nintendo-64-Alt.png
  /opt/retropie/emulators/retroarch/overlays/borders/Nintendo-64.cfg
  /opt/retropie/emulators/retroarch/overlays/borders/Nintendo-64-Alt.cfg
```

* N64 Configs location:
```
/opt/retropie/configs/n64
```

* Retroarch Config `/opt/retropie/configs/n64/retroarch.cf`:
```
# Settings made here will only override settings in the global retroarch.cfg if placed above the #include line

input_remapping_directory = "/opt/retropie/configs/n64/"

input_overlay = "/opt/retropie/emulators/retroarch/overlays/borders/Nintendo-64.cfg"
input_overlay_enable = "true"
#include "/opt/retropie/configs/all/retroarch.cfg"

savefile_directory = "~/RetroPie/saves/n64"
savestate_directory = "~/RetroPie/saves/n64/states"
```

Videomode configs `/opt/retropie/configs/all/videomodes.cfg`:

```
lr-parallel-n64 = "CEA-1"
lr-parallel-n64_render = "320x240"

mupen64plus-GLideN64-highres = "CEA-16"
mupen64plus-GLideN64_fb = "320x224"

mupen64plus-gles2rice = "CEA-1"
mupen64plus-auto_fb = "320x224"

lr-mupen64plus = "CEA-16"
lr-mupen64plus_render = "640x480"
```
