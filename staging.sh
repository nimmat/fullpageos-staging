#!/bin/bash
sudo rm /boot/fullpageos.txt && mv fullpageos.txt /boot
xrandr --addmode HDMI-2 1280x720
xrandr --output HDMI-2 --mode 1280x720
rm ../scripts/start_gui
mv start_gui ../scripts/
sudo chmod +x ../scripts/start_gui
