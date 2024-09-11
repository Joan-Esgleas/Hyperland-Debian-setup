#!/usr/bin/env bash

sudo apt install -y firefox-esr
sudo apt install -y nautilus

sudo apt install -y dunst
git clone https://github.com/Joan-Esgleas/dunst.git ~/.config/

sudo apt install -y alacritty
git clone https://github.com/Joan-Esgleas/alacritty.git ~/.config/alacritty

sudo apt install -y neovim ripgrep fd-find npm nodejs luarocks
git clone https://github.com/Joan-Esgleas/nvim.git ~/.config/nvim

wget https://github.com/Ulauncher/Ulauncher/releases/download/5.15.7/ulauncher_5.15.7_all.deb
sudo apt install -y ./ulauncher*
sudo git clone https://github.com/Joan-Esgleas/ulauncher.git ~/.config/
rm ulauncher*

sudo apt install -y gnome-software flatpak

sudo apt install -y papirus-icon-theme

sudo apt install -y gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y --or-update flathub org.onlyoffice.desktopeditors

if command -v "starship" >/dev/null 2>&1; then
    echo "starship existe"
else
    curl -sS https://starship.rs/install.sh | sh
fi

sudo apt install bat
cp ~/.bashrc ~/.bashrc.bkp
cp ./assets/bashrc/.bashrc ~/.bashrc
