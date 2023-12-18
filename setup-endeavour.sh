#!/bin/bash

## For Cinnamon Edition of EndeavourOS

# for xed, change to "Cobalt"
# for Terminal uncheck "use system theme" in Terminal -> Profile:
# - use "Tango Dark"
# - Uncheck use transparency from system theme
# - Palette "Tango" with "Show bold text in bright colors" checked

for arg in "$@"; do
    case $arg in
        -f|--firstinstall)
            yay -Syu --noconfirm
            yay -S librewolf-bin --noconfirm # install this separately first, so the user can browse if needed while other stuff is installing
            sudo pacman -S steam # this may have an important prompt, don't noconfirm it
            sudo pacman -S discord blueman breeze kdenlive blender godot --noconfirm
            yay -S protonup-qt-bin webcord-bin vscodium-bin mint-themes mint-y-icons gnome-themes-extra redshift-minimal
            sudo systemctl start bluetooth
            sudo systemctl enable bluetooth
            ;;
        -l|--laptop)
            sudo pacman -S nvidia-inst #--noconfim (temp commented until verify no relevant choices)
            yay -S envycontrol #--noconfirm (temp commented until verify no relevant choices)
            nvidia-inst
            ;;
        -g|--gitconfig)
            cp ./config/.gitconfig ~/.gitconfig
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

