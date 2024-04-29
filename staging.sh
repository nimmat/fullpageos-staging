#!/bin/bash
sudo rm /boot/fullpageos.txt && mv fullpageos.txt /boot
xrandr --addmode HDMI-2 1280x720
xrandr --output HDMI-2 --mode 1280x720
rm ../scripts/start_gui
mv start_gui ../scripts/
sudo chmod +x ../scripts/start_gui
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install matchbox-keyboard nodejs npm -y
cd $HOME
git clone https://github.com/Linkek/keyboardTriggerServer.git
cd keyboardTriggerServer
npm install
