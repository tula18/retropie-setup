#!/usr/bin/env bash

ARCADE_CONFIG=/opt/retropie/configs/arcade/retroarch.cfg

# Download new launching image and move it to the arcade configs directory
wget https://raw.githubusercontent.com/ehettervik/es-runcommand-splash/master/arcade/launching.png
echo "moving new arcade launch image ... "
\cp launching.png /opt/retropie/configs/arcade

# Enable d-pad mode
echo "enabling d-pad mode for arcade ... "
if [[ -f ${ARCADE_CONFIG} ]]; then
  for i in $(seq 1 16); do
    sed -i "s|input_player${i}_analog_dpad_mode = \"0\"|input_player${i}_analog_dpad_mode = \"1\"|" "${ARCADE_CONFIG}";
  done
fi
echo "[OK] arcade setup complete."
