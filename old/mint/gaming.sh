#!/bin/bash

### Install Steam and ProtonUp-Qt
sudo apt install steam -y
# Launch Steam to generate the .steam folder with proper permissions
/usr/games/steam
# ProtonUp-Qt for easily updating Proton-GE
flatpak install flathub net.davidotek.pupgui2 -y

### Install OBS (Not as a flatpak, because we want controller detection via web)
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt update
sudo apt install ffmpeg obs-studio -y

### Steam Download Speed Fix
# If it's been a few months, check this is still necessary
# Last checked Nov 18, 2023
# Manually run only after steam has been opened once and generates the .steam folder
echo "@nClientDownloadEnableHTTP2PlatformLinux 0" > ~/.steam/steam/steam_dev.cfg

echo "There is currently a bug where laptops with igpu and dgpu cannot launch steam via desktop shortcut."
echo "You need to edit /usr/share/applications/steam.desktop line PrefersNonDefaultGPU=true to =false"
