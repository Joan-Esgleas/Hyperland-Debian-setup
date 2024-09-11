#!/usr/bin/env bash

sudo apt install -y --no-install-recommends sddm
sudo cp ./assets/sddm/sddm.conf /etc/sddm.conf

sudo apt install -y qml-module-qtquick-layouts qml-module-qtgraphicaleffects qml-module-qtquick-controls2 libqt5svg5
sudo mkdir -p /usr/share/sddm/themes/
sudo git clone https://github.com/Joan-Esgleas/sugar-candy.git  /usr/share/sddm/themes/

sudo systemctl enable sddm
