#!/usr/bin/env bash

# savefile setup
./scripts/rpc80_savefile_setup.sh

# auto savestate fix
./scripts/auto_savestate_fix.sh

# Run the SEGA overlay fix
./scripts/sega_verlay.sh

# N64 setup
./n64/n64_setup.sh

# arcade setup
./arcade/arcade_setup.sh

# overclock setup
./overclock/overclock_setup.sh

# clear the motd file
truncate -s 0 /etc/motd
