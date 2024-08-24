#!/usr/bin/env bash

chmod +x *.sh

bash ./dependencies.sh
bash ./setup-fonts.sh

cp ./hyprland.desktop /usr/share/wayland-sessions

git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland

make all && sudo make install
cd ..

bash ./Status-Bar.sh

mkdir -p ~/.Wallpaper
mkdir -p ~/.config/hypr/
cp fierwatchWallpaper.jpg ~/.Wallpaper
cp hyprpaper.conf .config/hypr/hyprpaper.conf
cp hyprland.conf .config/hypr/hyprland.conf

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
