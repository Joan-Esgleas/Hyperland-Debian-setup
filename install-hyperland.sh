#!/usr/bin/env bash

chmod +x ./src/*.sh


sudo cp /etc/apt/sources.list /etc/apt/sources-bkp.list
sudo cp ./assets/aptsources/sources.list /etc/apt/sources.list

sudo apt update
sudo apt upgrade -y

bash ./src/dependencies.sh
bash ./src/setup-fonts.sh

sudo cp ./assets/hyprland/hyprland.desktop /usr/share/wayland-sessions

git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install
cd ..

bash ./src/status-bar.sh
bash ./src/setup-audio-brightess-mgr.sh
bash ./src/setup-sddm.sh
bash ./src/setup-utils.sh

mkdir -p ~/.Wallpaper
mkdir -p ~/.config/hypr
cp ./assets/fierwatchWallpaper.jpg ~/.Wallpaper
cp ./assets/hyprland/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
cp ./assets/hyprland/hyprland.temp ~/.config/hypr/hyprland.temp
cp ./assets/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf

#clean up
rm -fr aquamarine
rm -fr hyprlang
rm -fr hyprlock
rm -fr hyprcursor
rm -fr hyprpaper
rm -fr Hyprland
rm -fr hyprutils
rm -fr xdg-desktop-portal-hyprland
rm -fr hyprwayland-scanner
echo ==============INSTALATION COMPLEATED=================
sudo reboot
