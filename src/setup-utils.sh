#!/usr/bin/env bash

sudo apt install -y firefox-esr
sudo apt install -y nautilus

sudo apt install -y dunst
mkdir -p ~/.config/dunst
cp ./assets/dunst/dunstrc ~/.config/dunst/dunstrc

sudo apt install -y alacritty
git clone https://github.com/Joan-Esgleas/alacritty.git ~/.config/alacritty

sudo apt install -y neovim ripgrep fd-find npm nodejs luarocks
git clone https://github.com/Joan-Esgleas/nvim.git ~/.config/nvim

wget https://github.com/Ulauncher/Ulauncher/releases/download/5.15.7/ulauncher_5.15.7_all.deb
sudo apt install -y ./ulauncher*
rm ulauncher*

sudo apt install -y gnome-software flatpak

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo apt install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps https://distribute.kde.org/flatpak-apps-testing/
flatpak install -y --user --or-update https://cdn.kde.org/flatpak/xwaylandvideobridge-nightly/org.kde.xwaylandvideobridge.flatpakref
flatpak install -y --or-update flathub org.onlyoffice.desktopeditors


