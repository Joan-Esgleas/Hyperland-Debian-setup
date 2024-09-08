#!/usr/bin/env bash

cd ./src/audio-brightness-mgr
gcc -o audio-brightness-mgr main.c
sudo cp audio-brightness-mgr /usr/local/bin/audio-brightness-mgr
sudo chown root:root /usr/local/bin/audio-brightness-mgr
sudo chmod 4755 /usr/local/bin/audio-brightness-mgr
sudo rm audio-brightness-mgr
cd ..

