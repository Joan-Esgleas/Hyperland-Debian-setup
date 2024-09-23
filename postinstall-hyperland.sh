#!/usr/bin/env bash

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

sudo apt autoremove zutty
sudo apt autoremove
sudo reboot
