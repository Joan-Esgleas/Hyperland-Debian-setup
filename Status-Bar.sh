#!/usr/bin/env bash

#dependencies
sudo apt install bluez-alsa-utils libgtk-3-0 libgtk-layer-shell-dev pamixer libsass-dev

git clone https://github.com/scorpion-26/gBar
cd gBar
meson setup build
ninja -C build && sudo ninja -C build install

mkdir -p ~/.config/gBar
cp ../config ~/.config/gBar
cp ../style.scss ~/.config/gBar

#cleanup
cd ..
rm -fr gBar
