#!/bin/bash

### Setup Configs ###
cp -R ./config/. ~/

### Use git-core so we can use latest stable git ###
sudo add-apt-repository ppa:git-core/ppa -y

### Remove Unused Linux Mint Pre-installed Software ###
sudo apt remove --purge libreoffice* -y
sudo apt remove --purge firefox -y
sudo apt remove --purge hexchat* -y
sudo apt remove --purge thunderbird* -y
sudo apt remove --purge transmission* -y
sudo apt remove --purge hypnotix* -y
sudo apt remove --purge rhythmbox* -y
sudo apt remove --purge celluloid* -y

# Remove dependencies that are no longer needed
sudo apt autoremove -y

### Replace Default Redshift Applet with QRedshift
sudo apt remove redshift-gtk
#cinnamon-settings applets remove redshift@marvel4u
#cinnamon-settings applets install qredshift@quintoo

### Create Flatpak Aliases for Godot and CLI Use ###

## Blender

cat << 'EOF' | sudo tee /usr/local/bin/blender > /dev/null
#!/bin/bash

exec flatpak run org.blender.Blender "$@"
EOF

sudo chmod +x /usr/local/bin/blender

## VSCodium

cat << 'EOF' | sudo tee /usr/local/bin/code > /dev/null
#!/bin/bash

exec flatpak run com.vscodium.codium "$@"
EOF

sudo chmod +x /usr/local/bin/code

### If Debian ###
# Install Flatpak
# sudo apt install flatpak -y
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### Install Flatpaks ###
flatpak install flathub org.blender.Blender -y
flatpak install flathub com.usebottles.bottles -y
flatpak install flathub org.filezillaproject.Filezilla -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.godotengine.Godot -y
flatpak install flathub org.kde.kdenlive -y
flatpak install flathub org.kde.kolourpaint -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub io.github.spacingbat3.webcord -y
flatpak install flathub io.gitlab.librewolf-community -y

### Run an apt update and upgrade ###
sudo apt update
sudo apt upgrade -y
