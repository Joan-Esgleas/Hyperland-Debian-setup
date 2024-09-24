#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

mkdir -p ~/.config/

bash ./src/dependencies.sh

git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install
cd ..

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
