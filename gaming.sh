#!/bin/bash

### Install OBS (Not as a flatpak, because we want controller detection via web)
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio

### Install Steam and ProtonUp-Qt
sudo apt install steam
flatpak install flathub net.davidotek.pupgui2 -y

### Steam Download Speed Fix
## Only uncomment after confirming its still necessary
# echo "@nClientDownloadEnableHTTP2PlatformLinux 0" > ~/.steam/steam/steam_dev.cfg

