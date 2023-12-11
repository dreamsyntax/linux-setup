#!/bin/bash

## For Cinnamon Edition of EndeavourOS

## Still need to figure out the themes for terminal
# for xed, change to "Cobalt"
# for terminal uncheck use system theme in Terminal -> Profile:
# use "Tango Dark"
# Uncheck use transparency from system theme
# Palette "Tango" with "Show bold text in bright colors" checked


### Setup Configs ###
# cp -R ./config/. ~/

### Check for updates ###
yay -Syu --noconfirm

### Install software ###
yay -S librewolf-bin --noconfirm
sudo pacman -S nvidia-inst --noconfirm
# laptop only
yay -S envycontrol ## prompt so we can abort
# end laptop only
sudo pacman -S steam # this may have an important prompt 
sudo pacman -S discord bluez bluez-utils --noconfirm
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo pacman -S blueman kdenlive redshift --noconfirm
sudo pacman -S breeze --noconfirm # for kde applications (kdenlive) not being dark theme by default
yay -S protonup-qt-bin webcord-bin vscodium-bin mint-themes gnome-themes-extra --noconfirm
sudo pacman -S blender godot --noconfirm
# yay -S appimagelauncher ## Not really needed at this time, maybe later
# systemctl mask --user redshift.service ## Probably unnecessary
# yay -S unityhub ## Busted; logs out of Unity Hub each launch


### Install Flatpaks ###
# need to install flatpak first, not installed by default
# flatpak install flathub com.usebottles.bottles -y ## Only install if needed
