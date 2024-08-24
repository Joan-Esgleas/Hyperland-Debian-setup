#!/usr/bin/env bash
sudo apt install -y build-essential alacritty cmake cmake-extras curl gettext gir1.2-graphene-1.0 git glslang-tools gobject-introspection golang hwdata jq libavcodec-dev libavformat-dev libavutil-dev libcairo2-dev libdeflate-dev libdisplay-info-dev libdrm-dev libegl1-mesa-dev libgbm-dev libgdk-pixbuf-2.0-dev libgdk-pixbuf2.0-bin libgirepository1.0-dev libgl1-mesa-dev libgraphene-1.0-0 libgraphene-1.0-dev libgtk-3-dev libgulkan-0.15-0t64 libgulkan-dev libinih-dev libinput-dev libjbig-dev libjpeg-dev libjpeg62-turbo-dev liblerc-dev libliftoff-dev liblzma-dev libnotify-bin libpam0g-dev libpango1.0-dev libpipewire-0.3-dev libqt6svg6 libseat-dev libstartup-notification0-dev libswresample-dev libsystemd-dev libtiff-dev libtiffxx6 libtomlplusplus-dev libudev-dev libvkfft-dev libvulkan-dev libvulkan-volk-dev libwayland-dev libwebp-dev libxcb-composite0-dev libxcb-cursor-dev libxcb-dri3-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-present-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-util-dev libxcb-xinerama0-dev libxcb-xinput-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libxkbregistry-dev libxml2-dev libxxhash-dev meson ninja-build openssl psmisc python3-mako python3-markdown python3-markupsafe python3-yaml qt6-base-dev scdoc seatd spirv-tools vulkan-utility-libraries-dev wayland-protocols xdg-desktop-portal xwayland waybar wget wl-clipboard wlogout unzip fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus libpugixml-dev libzip-dev librsvg2-dev libmagic-dev hyprland-protocols libspa-0.2-dev libsdbus-c++-dev libxcb-errors-dev


git clone https://code.hyprland.org/hyprwm/hyprutils.git
cd hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/hyprwayland-scanner.git
cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/aquamarine.git
cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/hyprlang.git
cd hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/hyprcursor.git
cd hyprcursor
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/hyprpaper.git
cd hyprpaper
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprpaper -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone https://code.hyprland.org/hyprwm/hyprlock.git
cd hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..

git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland.git
cd xdg-desktop-portal-hyprland/
cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build
sudo cmake --install build
cd ..

