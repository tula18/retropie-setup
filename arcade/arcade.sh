#!/usr/bin/env bash

# Download new launching image and move it to the arcade configs directory
wget https://raw.githubusercontent.com/ehettervik/es-runcommand-splash/master/arcade/launching.png
\cp launching.png /opt/retropie/configs/arcade
