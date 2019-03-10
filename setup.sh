#!/usr/bin/env bash

# Run the savefile script
./scripts/rpc80_savefile_setup.sh

# Run the auto-state scripts
./scripts/nes_autosave_fix.sh

# Run the N64 script
./n64/n64_setup.sh

# Run the arcade script
./arcade/arcade_setup.sh

# Run the overclock script
./overclock/overclock_setup.sh

# Clear the motd file
truncate -s 0 /etc/motd
