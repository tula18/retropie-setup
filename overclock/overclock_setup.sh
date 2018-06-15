#!/usr/bin/env bash

# Copy and overwrite the existing OverClock.sh script in `retropiemenu`
echo 'Copying new overclocking script ...'
\cp OverClock.sh ~/RetroPie/retropiemenu/OverClock.sh
echo '[OK] added new overclocking script'

# Remove superfluous text files
echo 'Removing superfluous text files ...'
rm /boot/config_OCoff.txt
rm /boot/config_OC.txt
rm /boot/config_OC+.txt
rm /boot/config.txt.overclock
echo '[OK] removed text files'

# Remove superfluous script files
echo 'Removing superfluous script files ...'
rm /boot/disable_OC.sh
rm /boot/enable_OC.sh
rm /boot/enable_OC+.sh
echo '[OK] removed script files'
echo '[OK] done'
