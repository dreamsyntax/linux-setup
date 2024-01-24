#!/bin/bash

## For KDE Edition of EndeavourOS

for arg in "$@"; do
    case $arg in
        -f|--firstinstall)
            yay -Syu --noconfirm
            yay -S librewolf-bin --noconfirm # install this separately first, so the user can browse if needed while other stuff is installing
            sudo pacman -S steam # this may have an important prompt, don't noconfirm it
            sudo pacman -S discord kdenlive blender godot --noconfirm
            yay -S protonup-qt-bin webcord-bin visual-studio-code-bin
            ;;
        -b|--bluetooth)
            sudo pacman -S blueman
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

