###############################################################################
# Remove NES (lr-fceumm) auto-save/load state config                          #
###############################################################################

CONFIG_FILE='/opt/retropie/configs/all/retroarch/config/FCEUmm/FCEUmm.cfg'

# Clear IFS (internal field seperator) to clear space as element delimiter
IFS=""
CONFIGS=('savestate_auto_load = "true"'
'savestate_auto_save = "true"'
)

echo "Removing auto savestate configs for NES (lr-fceumm) ..."
if [[ -f ${CONFIG_FILE} ]]; then
  for config in ${CONFIGS[@]}; do
    if grep -qF "${config}" "${CONFIG_FILE}"; then
      echo "Removing '${config}' config for NES in '${CONFIG_FILE}'"
      sed -i "/${config}/d" "${CONFIG_FILE}"
    else
      echo "No config: '${config}' found for NES"
    fi
  done
else
  echo "No config file found for NES: ${CONFIG_FILE}"
fi
