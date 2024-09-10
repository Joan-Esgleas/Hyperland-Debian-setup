#!/usr/bin/env bash

#dependencies
sudo apt install -y waybar network-manager network-manager-gnome bluez-alsa-utils pamixer pipewire pulseaudio power-profiles-daemon

mkdir -p ~/.config/waybar/
cp ./assets/waybar/style.css ~/.config/waybar/style.css
cp ./assets/waybar/config.jsonc ~/.config/waybar/config.jsonc

