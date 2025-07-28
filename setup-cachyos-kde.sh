# Theme -> Global Theme -> Apply Breeze Dark -> Check both boxes to Reset Desktop and window layout
# Right click bottom panel, "Show Panel Configuration" and uncheck "Floating", then press escape twice
# Unpin Discover, Unpin Settings

# Settings -> Touchpad -> Invert scroll direction (Natural scrolling)
# Settings -> General Behavior -> Middle Mouse "Pastes selected text" -> Uncheck

# Settings -> System Tray Settings -> Entries -> Bluetooth -> Always shown
# Settings -> System Tray Settings -> Entries -> Power and Battery -> Always shown

# SSD trim scheduler
sudo systemctl enable --now fstrim.timer

# for Flatpak support
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# for AppImage support
sudo pacman -S --noconfirm fuse2
# for portable AppImages just create `AppImageName.AppImage.home` folder in the same directory as it before running

# for downgrade command (use if a specific package breaks) ex: sudo downgrade kwin -> select older version with arrow keys/enter
sudo pacman -S --noconfirm downgrade

# apps
sudo pacman -S --noconfirm vesktop # discord client with hardware accelerated screen sharing
sudo pacman -S --noconfirm vscode gimp blender godot shotcut keepassxc wl-clipboard

# gaming meta, not do not install cachyos-gaming-applications (unless you want heroic launcher and lutris)
paru -S cachyos-gaming-meta

# additional common packages
sudo pacman -S 7zip

# additional gaming packages
# gamescope # https://github.com/ValveSoftware/gamescope
# gamescope example gamescope -f -W 2560 -H 1440 -r 170 -- gamemoderun %command%
# goverlay # https://github.com/benjamimgois/goverlay
# mangohud # resource overlay

# speedrun / capture and input capture packages
sudo pacman -S --noconfirm love obs-studio
sudo pacman -S lua51-sec # required for m-overlay
sudo setcap cap_sys_ptrace=eip /usr/bin/love # required for m-overlay

# Sunshine / Moonlight for Game Streaming / RDP
# sunshine # for hosting https://github.com/LizardByte/Sunshine
# qpwgraph # to cancel out other audio such as Discord for connected users
# moonlight # client

## Disable the Discord / Vesktop & other electron apps from lowering/adjusting your Microphone gain:
# Create local config, copying from latest to ~/.config/pipewire/pipewire-pulse.conf with:
mkdir -p ~/.config/pipewire/ && cp /usr/share/pipewire/pipewire-pulse.conf ~/.config/pipewire/pipewire-pulse.conf

# Edit, adding:
#    {
#       matches = [ { application.process.binary = "Discord" } ]
#       actions = { quirks = [ block-source-volume ] }
#    }
#    {
#       matches = [ { application.process.binary = "Vesktop" } ] # For Vesktop and other electron clients
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

# program to force iGPU mode
sudo pacman -S supergfxctl
sudo systemctl enable supergfxd
sudo systemctl start supergfxd

# Usage example:
# supergfxctl --mode Integrated
# supergfxctl --mode Hybrid

## laptop TAS2781 audio bug - Creates a service that auto resets the amp and device state to prevent the bug on audio source change
## Bug still relevant as of 2025-07-15
# UNCOMMENT AFTER VERIFYING MANUALLY, NEVER AUTO RUN THIS https://github.com/DanielWeiner/tas2781-fix-16IRX8H
# curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --
