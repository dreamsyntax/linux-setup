#!/bin/bash

## Still need to figure out the themes for terminal, and most applications. In default, most dark support has bad unreadable colors for text

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
sudo pacman -S breeze --noconfirm # for kde applications not being dark theme by default
yay -S protonup-qt-bin envycontrol appimagelauncher vscodium-bin --noconfirm
sudo pacman -S blender godot --noconfirm

# systemctl mask --user redshift.service ## Probably unnecessary
# yay -S unityhub ## Busted; logs out of Unity Hub each launch

### Install Flatpaks ###
# flatpak install flathub com.usebottles.bottles -y ## Only install if needed
