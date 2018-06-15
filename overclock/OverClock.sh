#!/bin/bash

infobox=""
infobox="${infobox}_______________________________________________________\n\n"
infobox="${infobox}\n"
infobox="${infobox}OverClocking Your Pi3 & Pi3B+\n\n"
infobox="${infobox}\n"
infobox="${infobox}This will amend the config.txt and enable/disable overclocking.\n"
infobox="${infobox}(A case with a fan for good CPU cooling is recommended).\n"
infobox="${infobox}Pi3 OC at 1300MHz & Pi3B+ OC at 1500MHz or 1550MHz\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Enable**\n"
infobox="${infobox}Overclocks the CPU\n"
infobox="${infobox}\n"
infobox="${infobox}**Disable**\n"
infobox="${infobox}Disables Overclocking"
infobox="${infobox}\n"

dialog --backtitle "Pi3 & Pi3B+ OverClocking" \
--title "Pi3 & Pi3B+ OverClocking By 2Play & RPC80" \
--msgbox "${infobox}" 35 110

# Config file path
CONFIG_PATH=/boot/config.txt

# Overclocking settings description
OVERCLOCK_DESCRIPTION="# uncomment to enable custom overclock settings"

declare -a OVERCLOCK_SETTINGS=(
  "gpu_freq=500"
  "gpu_mem=512"
  "core_freq=500"
  "sdram_freq=500"
  "sdram_schmoo=0x02000020"
  "over_voltage=6"
  "sdram_over_voltage=2"
  "v3d_freq=525"
)

function main_menu() {
    local choice
    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Choose your OverClocking Option:" 25 75 20 \
            1 "Enable OverClocking - Pi3 [1300MHz]" \
            2 "Enable OverClocking - Pi3 B+ [1500MHz]" \
            3 "Enable OverClocking - Pi3 B+ [1550MHz]" \
            4 "Disable OverClocking" \
            2>&1 > /dev/tty)
        case "$choice" in
            1) enable_oc 1300;;
            2) enable_oc 1500;;
            3) enable_oc 1550;;
            4) disable_oc ;;
            *) break ;;
        esac
    done
}

# Enables Overclocking by adding properties to /boot/config.txt
function enable_oc() {
  dialog --infobox "Applying ..." 3 20 ; sleep 2
  overclock_setup
  sudo sed -i "s|#*arm_freq=.*|arm_freq=$1|" "${CONFIG_PATH}";
  for val in ${OVERCLOCK_SETTINGS[@]}; do
    if grep -q "#${val}" ${CONFIG_PATH}; then
      sudo sed -i "s|#${val}|${val}|" "${CONFIG_PATH}";
    fi
  done
  echo "[OK] rebooting ..."
  sudo reboot
}

# Disables overclocking by commenting out overclock values
function disable_oc() {
  dialog --infobox "Applying ..." 3 20 ; sleep 2
  overclock_setup
  sudo sed -i "s|arm_freq=|#arm_freq=|" "${CONFIG_PATH}";
  for val in ${OVERCLOCK_SETTINGS[@]}; do
    sudo sed -i "s|^${val}|#${val}|" "${CONFIG_PATH}";
  done
  echo "[OK] rebooting ..."
  sudo reboot
}

# Adds overclock entries to config.txt
function overclock_setup() {
  if ! grep -q "${OVERCLOCK_DESCRIPTION}" ${CONFIG_PATH}; then
    echo -e "\n${OVERCLOCK_DESCRIPTION}" >> ${CONFIG_PATH}
    for val in ${OVERCLOCK_SETTINGS[@]}; do
      if ! grep -q "${val}" ${CONFIG_PATH}; then
        sudo echo $val >> ${CONFIG_PATH}
      fi
    done
  fi
}


main_menu
