#!/usr/bin/env bash

mkdir -p /usr/local/share/fonts/

cd /tmp
fonts=( 
#"CascadiaCode"
#"FiraCode"  
#"Hack"  
#"Inconsolata"
"JetBrainsMono" 
#"Meslo"
#"Mononoki" 
#"RobotoMono" 
#"SourceCodePro" 
#"UbuntuMono"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$font.zip
	sudo unzip $font.zip -d  /usr/local/share/fonts/$font/
    rm $font.zip
done
fc-cache
