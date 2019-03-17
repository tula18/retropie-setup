#!/usr/bin/env bash

# Removes Retroarch core config settings for input overlay
# input overlay should be set in system level configs in /opt/retropie/configs/<SYSTEM_NAME>
sed -i "/input_overlay.*/d" "/opt/retropie/configs/all/retroarch/config/PicoDrive/PicoDrive.cfg"
sed -i "/input_overlay.*/d" "/opt/retropie/configs/all/retroarch/config/Genesis Plus GX/Genesis Plus GX.cfg"
