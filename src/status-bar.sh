#!/usr/bin/env bash

#dependencies
sudo apt install -y waybar network-manager network-manager-gnome bluez-alsa-utils pamixer pipewire power-profiles-daemon

cp -r ./assets/waybar ~/.config/

#cleanup
cd ..
