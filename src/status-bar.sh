#!/usr/bin/env bash

#dependencies
sudo apt install -y waybar network-manager network-manager-gnome xfce4-power-manager bluez-alsa-utils pamixer

cp -r ../assets/waybar ~/.config/

#cleanup
cd ..
