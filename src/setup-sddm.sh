#!/usr/bin/env bash

sudo apt install -y --no-install-recommends sddm
sudo cp --parents ./assets/sddm/sddm.conf /etc/sddm.conf

sudo apt install -y qml-module-qtquick-layouts qml-module-qtgraphicaleffects qml-module-qtquick-controls2 libqt5svg5
sudo cp -r --parents ./assets/sddm/sugar-candy /usr/share/sddm/themes/sugar-candy

sudo systemctl enable sddm
