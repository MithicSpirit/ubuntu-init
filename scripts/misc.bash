#!/usr/bin/bash

cd ~/.install-temp

sudo -v apt install tlp powertop xclip gimp krita vlc -y
sudo -v snap install --beta authy

curl -L 'https://canary.discord.com/api/download/canary?platform=linux&format=deb' > discord.deb
sudo -v apt install ./discord.deb
rm discord.deb
