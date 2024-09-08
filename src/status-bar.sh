#!/usr/bin/env bash

#dependencies
sudo apt install -y bluez-alsa-utils libgtk-3-0 libgtk-layer-shell-dev pamixer libsass-dev libpulse-dev libdbusmenu-gtk3-dev

git clone https://github.com/scorpion-26/gBar
cd gBar
meson setup build
ninja -C build && sudo ninja -C build install

mkdir -p ~/.config/gBar
cp ../assets/gBar/config ~/.config/gBar
cp ../assets/gBar/style.scss ~/.config/gBar

#cleanup
cd ..
rm -fr gBar
