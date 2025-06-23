#!/bin/bash
REAL_CMDLINE="/boot/firmware/cmdline.txt"
sudo mount -o remount,rw /boot/firmware
line=$(grep -v '^$' "$REAL_CMDLINE" | tr -d '\n' | sed 's/overlayroot=[^ ]*//g' | sed 's/  */ /g' | sed 's/ *$//')
line="${line} overlayroot=disabled"
echo "$line" | sudo tee "$REAL_CMDLINE" > /dev/null
sudo reboot
