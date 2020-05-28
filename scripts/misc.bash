#!/usr/bin/bash

cd "~/.install-temp"

sudo apt install tlp powertop xclip

curl -L 'https://canary.discord.com/api/download/canary?platform=linux&format=deb' > discord.deb
sudo apt install ./discord.deb
