#Theme -> Global Theme -> Apply Breeze Dark -> Check both boxes to reset Desktop and window layout
#Right click bottom panel and uncheck floating, then press escape
#Unpin discover
#Touchpad -> Invert natural scrolling
#CachyOS Hello -> Enter Apps/Tweaks and click Install Gaming packages
#CachyOS Hello -> Click Bluetooth enabled
#Settings -> General Behavior -> Middle Mouse Paste Selected Text DISABLE

# SSD trim scheduler
sudo systemctl enable --now fstrim.timer

# for accessing Windows dualboot / NTFS external drives, install NTFS-3G to force using it instead of the default NTFS3 (which corrupts data over time)
sudo pacman -S ntfs-3g

# for Flatpak support
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# for AppImage support
sudo pacman -S --noconfirm fuse2

# for downgrade command (use if a specific package breaks) ex: sudo downgrade kwin -> select older version with arrow keys/enter
sudo pacman -S --noconfirm downgrade

# apps
sudo pacman -S --noconfirm vesktop # discord client with hardware accelerated screen sharing
sudo pacman -S --noconfirm vscode gimp blender godot shotcut keepassxc wl-clipboard

## Disable the Discord / Vesktop & other electron apps from lowering/adjusting your Microphone gain:
# Create local config, copying from latest to ~/.config/pipewire/pipewire-pulse.conf with:
cp /usr/share/pipewire/pipewire-pulse.conf ~/.config/pipewire/pipewire-pulse.conf

# Edit, adding:
#    {
#       matches = [ { application.process.binary = "Discord" } ]
#       actions = { quirks = [ block-source-volume ] }
#    }
#    {
#       matches = [ { application.process.binary = "electron" } ] # For Vesktop and other electron clients
#       actions = { quirks = [ block-source-volume ] }
#    }

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

# to edit: funced -s <aliasname>
# to delete: functions -e <aliasname>; funcsave <aliasname>

########## LAPTOP ONLY ##########
## laptop TAS2781 audio bug - Creates a service that auto resets the amp and device state to prevent the bug on audio source change
# UNCOMMENT AFTER VERIFYING MANUALLY, NEVER AUTO RUN THIS https://github.com/DanielWeiner/tas2781-fix-16IRX8H
#curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --
