#!/bin/bash

## For Cinnamon Edition of EndeavourOS

## Still need to figure out the themes for terminal
## For now uncheck use system theme in Terminal -> Profile and use "white on black" with palette "solarized"

### Setup Configs ###
# cp -R ./config/. ~/

### Check for updates ###
yay -Syu --noconfirm

### Install software ###
yay -S librewolf-bin --noconfirm
sudo pacman -S nvidia-inst --noconfirm
sudo pacman -S steam # this may have an important prompt 
sudo pacman -S discord bluez bluez-utils --noconfirm
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo pacman -S blueman kdenlive redshift --noconfirm
sudo pacman -S breeze --noconfirm # for kde applications (kdenlive) not being dark theme by default
yay -S protonup-qt-bin envycontrol appimagelauncher vscodium-bin mint-themes gnome-themes-extra --noconfirm
sudo pacman -S blender godot --noconfirm

# systemctl mask --user redshift.service ## Probably unnecessary
# yay -S unityhub ## Busted; logs out of Unity Hub each launch

### Install Flatpaks ###
# need to install flatpak first, not installed by default
# flatpak install flathub com.usebottles.bottles -y ## Only install if needed
