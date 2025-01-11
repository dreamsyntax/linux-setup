#Theme -> Global Theme -> Apply Breeze Dark -> Check both boxes to reset Desktop and window layout
#Right click bottom panel and uncheck floating, then press escape
#Unpin discover
#Touchpad -> Invert natural scrolling
#CachyOS Hello -> Enter Apps/Tweaks and click Install Gaming packages
#CachyOS Hello -> Click Bluetooth enabled
#Settings -> General Behavior -> Middle Mouse Paste Selected Text DISABLE

# SSD
sudo systemctl enable --now fstrim.timer

#sudo pacman -S cachyos-gaming-meta # not needed if Install Gaming packages button clicked
sudo pacman -S keepassxc wl-clipboard
sudo pacman -S appmenu-gtk-module libdbusmenu-glib
paru -S vesktop-bin webcord-bin --noconfirm
paru -S visual-studio-code-bin --noconfirm
sudo pacman -S dolphin-emu
sudo pacman -S krita kimageformats5
sudo pacman -S gimp blender godot shotcut


## fish variables
# export EDITOR="vim" -- bash equivalent
set -xU EDITOR "vim"


## fish aliases
alias -s dev "cd ~/dev"
alias -s gc "git checkout"
alias -s gd "git diff"
alias -s gcb "git checkout -b"
alias -s gp "git pull --prune"
alias -s gs "git status"
alias -s explorer "dolphin"
alias -s open "dolphin"

## laptop TAS2781 bug service automatic runner
# UNCOMMENT AFTER VERIFYING https://github.com/DanielWeiner/tas2781-fix-16IRX8H
#curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --

## laptop TAS2781 audio bug alias
# alias -s sss "sudo ~/dev/linux-setup/tas2781-2dev-on.sh 19"
## laptop should be able to remove this EVENTUALLY. Needed since kernels > 6.7.9

# to edit: funced -s <aliasname>
# to delete: functions -e <aliasname>; funcsave <aliasname>
