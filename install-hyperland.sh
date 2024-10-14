#!/usr/bin/env bash

chmod +x ./src/*.sh


sudo cp /etc/apt/sources.list /etc/apt/sources-bkp.list
sudo cp ./assets/aptsources/sources.list /etc/apt/sources.list

sudo apt update
sudo apt upgrade -y

mkdir -p ~/.config/

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

git clone https://github.com/Joan-Esgleas/Wallpapers.git ~/.config/Wallpapers
git clone https://github.com/Joan-Esgleas/hypr.git ~/.config/hypr

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
rm -fr hyprcursor
echo ==============INSTALATION COMPLEATED=================
sudo reboot
