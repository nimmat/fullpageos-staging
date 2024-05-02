#!/bin/bash
sudo rm /boot/firmware/fullpageos.txt && sudo mv fullpageos.txt /boot/firmware
sudo chown root:root /boot/firmware/fullpageos.txt
DISPLAY=:0 xrandr --addmode HDMI-2 1280x720
DISPLAY=:0 xrandr --output HDMI-2 --mode 1280x720
sudo rm ../scripts/start_gui
sudo rm ../scripts/start_chromium_browser
sudo mv start_gui ../scripts/
sudo mv start_chromium_browser ../scripts/
sudo chmod +x ../scripts/start_gui
sudo chmod +x ../scripts/start_chromium_browser
sudo chown root:root ../scripts/start_gui
sudo chown root:root ../scripts/start_chromium_browser
sudo rm /etc/X11/xorg.conf.d/10-blanking.conf
sudo cp 10-blanking.conf /etc/X11/xorg.conf.d/
sudo chown root:root /etc/X11/xorg.conf.d/10-blanking.conf
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install matchbox-keyboard nodejs npm unclutter -y
cd $HOME
git clone https://github.com/Linkek/keyboardTriggerServer.git
cd keyboardTriggerServer
npm install
cd $HOME/fullpageos-staging
sudo mv keyboardTriggerServer.service /etc/systemd/system/
sudo systemctl start keyboardTriggerServer
sudo systemctl enable keyboardTriggerServer
mkdir ~/.matchbox
sudo cp /usr/share/matchbox-keyboard/keyboard-lq1.xml ~/.matchbox/keyboard.xml
sudo chown pi:pi ~/.matchbox/keyboard.xml
echo "************************************************" 
echo "*                                              *" 
echo "*    please complete the following steps:      *" 
echo "*                                              *" 
echo "*    Run raspi-config - set screen blanking    *" 
echo "*    to no. System will reboot on finish       *" 
echo "*                                              *" 
echo "*    Use VNC to add Keyboard Extension to      *" 
echo "*    Chrome by pressing Alt + T in Developer   *" 
echo "*    mode                                      *" 
echo "*                                              *" 
echo "*    Ideally change VNC Access Password        *" 
echo "*                                              *" 
echo "************************************************" 
