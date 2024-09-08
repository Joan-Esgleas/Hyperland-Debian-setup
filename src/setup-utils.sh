#!/usr/bin/env bash

sudo apt install -y gnome-software flatpak
sudo apt install gnome-software-plugin-flatpak
sudo apt install firefox-esr
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists kdeapps https://distribute.kde.org/flatpak-apps-testing/
flatpak install --user --or-update https://cdn.kde.org/flatpak/xwaylandvideobridge-nightly/org.kde.xwaylandvideobridge.flatpakref
flatpak install --or-update flathub org.onlyoffice.desktopeditors
