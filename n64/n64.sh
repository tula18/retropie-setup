#!/usr/bin/env bash

# Move custom N64 Configs
echo 'Copying custom controller mappings for n64 ... '
\cp n64/8Bitdo\ N64\ GamePad.cfg /opt/retropie/configs/all/retroarch-joypads/
\cp n64/Generic\ \ \ USB\ \ Joystick\ \ .cfg /opt/retropie/configs/all/retroarch-joypads/
echo "[OK] finished N64 custom script!"
