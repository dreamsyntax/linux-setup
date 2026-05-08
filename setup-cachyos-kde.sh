# Theme -> Global Theme -> Apply Breeze Dark -> Check both boxes to Reset Desktop and window layout
# Right click bottom panel, "Show Panel Configuration", set "Floating" to "Disabled", then press escape twice
# Unpin Discover, Unpin Settings

# Settings -> Touchpad -> Invert scroll direction (Natural scrolling)
# Settings -> General Behavior -> Middle Mouse "Pastes selected text" -> Uncheck

# Settings -> System Tray Settings -> Entries -> Bluetooth -> Always shown
# Settings -> System Tray Settings -> Entries -> Power and Battery -> Always shown

# SSD trim scheduler -- Essential for systems running on SSD. It's enabled by default in CachyOS.
# Verify its active with:
systemctl status fstrim.timer
# If not, run:
# sudo systemctl enable --now fstrim.timer

# Remove zsh (only use fish and bash)
sudo pacman -Rs zsh cachyos-zsh-config

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
sudo pacman -S --noconfirm vscode gimp blender godot shotcut keepassxc 7zip

# gaming meta, not do not install cachyos-gaming-applications (unless you want heroic launcher and lutris)
paru -S cachyos-gaming-meta

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
```
    {
       matches = [
            { application.process.binary = "Discord" }
            { application.process.binary = "Vesktop" }
            { application.process.binary = "electron" } # For Vesktop and other electron apps
       ]
       actions = { quirks = [ block-source-volume ] }
    }
```

## fish variables
set -xU EDITOR "vim"
set -xU DOTNET_CLI_TELEMETRY_OPTOUT 1

## fish aliases
# to edit: funced -s <aliasname>
# to delete: functions -e <aliasname>; funcsave <aliasname>
alias -s dev "cd ~/dev"
alias -s gc "git checkout"
alias -s gcb "git checkout -b"
alias -s gd "git diff"
alias -s gp "git pull --prune"
alias -s gs "git status"
alias -s explorer "dolphin"
alias -s open "dolphin"

########## LAPTOP ONLY ##########

# remove plasma-login-manager/plasmalogin and replace it with sddm
# This is necessary to have supergfxctl function properly
# plasma-login-manager has a bug where switching back to Hybrid hard locks the system on login
# Last verified still an issue as of 2026-05-07
sudo pacman -Syu sddm-kcm sddm
sudo systemctl disable plasmalogin
sudo systemctl enable sddm
sudo pacman -R plasma-login-manager

# program to switch between iGPU mode and Hybrid
sudo pacman -S supergfxctl
sudo systemctl enable supergfxd
sudo systemctl start supergfxd

# Usage example:
# supergfxctl --mode Integrated
# supergfxctl --mode Hybrid

# Battery life - NOTE: Conflicts with the default KDE power manager
# TODO: Verify after checking power usage if worth using in comparison to default power management
sudo pacman -S auto-cpufreq
sudo systemctl enable --now auto-cpufreq.service
sudo systemctl enable --now auto-cpufreq
```

# dGPU status
cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status
cat /proc/driver/nvidia/gpus/0000:01:00.0/power

## laptop TAS2781 audio bug - Creates a service that auto resets the amp and device state to prevent the bug on audio source change
## Bug still relevant as of 2026-05-07
# UNCOMMENT AFTER VERIFYING MANUALLY, NEVER AUTO RUN THIS https://github.com/DanielWeiner/tas2781-fix-16IRX8H
# curl -s https://raw.githubusercontent.com/DanielWeiner/tas2781-fix-16IRX8H/refs/heads/main/install.sh | bash -s --
