#!/bin/bash

infobox=""
infobox="${infobox}_______________________________________________________\n\n"
infobox="${infobox}\n"
infobox="${infobox}OverClocking Your Pi3 & Pi3B+\n\n"
infobox="${infobox}\n"
infobox="${infobox}This will amend the config.txt and enable/disable overclocking.\n"
infobox="${infobox}(A case with a fan for good CPU cooling is recommended).\n"
infobox="${infobox}Pi3 OC at 1300MHz & Pi3B+ OC at 1500MHz\n"
infobox="${infobox}\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Enable**\nOverclocks the CPU"
infobox="${infobox}\n"
infobox="${infobox}**Disable**\nDisables overclocking"
infobox="${infobox}\n"

dialog --backtitle "Pi3 & Pi3B+ OverClocking" \
--title "Pi3 & Pi3B+ OverClocking By 2Play" \
--msgbox "${infobox}" 35 110

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
            1) enable_OC 1300;;
            2) enable_OC 1500;;
            3) enable_OC 1550;;
            4) disable_OC ;;
            *) break ;;
        esac
    done
}

function enable_OC() {
  dialog --infobox "Applying ..." 3 20 ; sleep 2
  if grep "#arm_freq=800" /boot/config.txt; then
      sudo sed -i "s|#arm_freq=800|arm_freq=$1|" "/boot/config.txt";
      echo "[OK] rebooting ..."
      sudo reboot
  else
      echo "[ERROR] previous setting: \"#arm_freq=800\" not found in /boot/config.txt"
      echo "No changes have been made."
      echo "Exiting."
  fi
}

function disable_OC() {
  dialog --infobox "Applying ..." 3 20 ; sleep 2
  # Disable overclocking for Raspberry Pi 3
  if grep "arm_freq=1300" /boot/config.txt; then
      sudo sed -i "s|arm_freq=1300|#arm_freq=800|" "/boot/config.txt";
      echo "[OK] rebooting ..."
      sudo reboot
  # Disable overclocking for Raspberry Pi 3 B+
  elif grep "arm_freq=1500" /boot/config.txt; then
      sudo sed -i "s|arm_freq=1500|#arm_freq=800|" "/boot/config.txt";
      echo "[OK] rebooting ..."
      sudo reboot
  # Disable overclocking for Raspberry Pi 3
  else
      echo "[ERROR] previous setting: \"arm_freq=1300 | arm_freq=1500\" not found in /boot/config.txt"
      echo "No changes have been made."
      echo "Exiting."
  fi
}

main_menu
