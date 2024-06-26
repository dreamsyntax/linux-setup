#!/bin/bash

## For KDE Edition of EndeavourOS

## Tweaks:
## Change Dolphin click behavior to require dolphin click to open, single click to select "General Behavior" in Settings
## Disable auto screen off / sleep as some apps & games dont properly hook

for arg in "$@"; do
    case $arg in
        -f|--firstinstall)
            yay -Syu --noconfirm
            yay -S librewolf-bin --noconfirm # install this separately first, so the user can browse if needed while other stuff is installing
            sudo pacman -S steam # this may have an important prompt, don't noconfirm it
            sudo pacman -S blender godot shotcut
            yay -S vesktop-bin webcord-bin --noconfirm
	    # sudo pacman -S discord kdenlive blender godot kwalletmanager --noconfirm
            # yay -S protonup-qt-bin webcord-bin visual-studio-code-bin --noconfirm
            # yay -S 7-zip-full --noconfirm
            ;;
        -b|--bluetooth)
            sudo systemctl start bluetooth
            sudo systemctl enable bluetooth
            ;;
        -l|--laptop)
            sudo pacman -S nvidia-inst #--noconfim (temp commented until verify no relevant choices)
            yay -S envycontrol #--noconfirm (temp commented until verify no relevant choices)
            nvidia-inst
            ;;
        -mmp|--middlemousepaste)
            # yay -S xmousepasteblock # doesn't work
            # sudo pacman -S sxhkd xsel # tried various scripts, no luck or used too much CPU
            ;;
        -g|--gitconfig)
            cp ./config/.gitconfig ~/.gitconfig
            ;;
        -fp|--flatpak)
            sudo pacman -S flatpak
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
            ;;
        -s|--steam)
            echo "@nClientDownloadEnableHTTP2PlatformLinux 0" > ~/.steam/steam/steam_dev.cfg
            ;;
        -c|--config)
            cat << 'EOF' | tee -a ~/.bashrc > /dev/null

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

EOF
            cp ./config/.bash_aliases ~/.bash_aliases
            ;;

    esac
done

