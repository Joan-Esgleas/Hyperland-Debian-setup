#!/usr/bin/env bash

#dependencies
sudo apt install -y waybar network-manager network-manager-gnome bluez-alsa-utils pamixer pipewire pulseaudio power-profiles-daemon

cp --parents ./assets/waybar/style.css ~/.config/waybar/style.css
cp --parents ./assets/waybar/config.jsonc ~/.config/waybar/config.jsonc

