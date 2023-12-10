#!/bin/bash

## Still need to figure out the themes for terminal, and most applications. In default, most dark support has bad unreadable colors for text

### Setup Configs ###
# cp -R ./config/. ~/

### Install software ###
yay -S librewolf-bin
sudo pacman -S nvidia-inst
sudo pacman -S steam
sudo pacman -S discord
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
sudo pacman -S blueman
sudo pacman -S kdenlive
sudo pacman -Syu breeze # for kde applications not being dark theme by default
yay -S protonup-qt-bin
yay -S envycontrol

sudo pacman -S redshift
systemctl mask --user redshift.service

yay -S appimagelauncher

### Dev ###
sudo pacman -S blender
sudo pacman -S godot
yay -S unityhub
yay -S vscodium-bin


### Install Flatpaks ###
flatpak install flathub com.usebottles.bottles -y



