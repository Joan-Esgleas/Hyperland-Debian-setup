#!/usr/bin/env bash

sudo apt install -y gnome-software flatpak
sudo apt install -y gnome-software-plugin-flatpak
sudo apt install nautilus
sudo apt install --no-install-recommends sddm
sudo apt install -y firefox-esr
wget https://github.com/Ulauncher/Ulauncher/releases/download/5.15.7/ulauncher_5.15.7_all.deb
sudo apt install ./ulauncher*
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps https://distribute.kde.org/flatpak-apps-testing/
flatpak install --user --or-update https://cdn.kde.org/flatpak/xwaylandvideobridge-nightly/org.kde.xwaylandvideobridge.flatpakref
flatpak install --or-update flathub org.onlyoffice.desktopeditors
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
sudo apt install -y papirus-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
