#!/usr/bin/bash

cd ~/.install-temp

sudo -A apt install tlp powertop xclip gimp krita vlc ffmpeg neofetch cmatrix -y
sudo -A snap install --beta authy

curl -L 'https://canary.discord.com/api/download/canary?platform=linux&format=deb' > discord.deb
sudo -A apt install ./discord.deb
rm -f discord.deb


curl -L 'https://github.com/bootandy/dust/releases/download/v0.5.1/dust-v0.5.1-x86_64-unknown-linux-gnu.tar.gz' > dust.tar.gz
tar -xzf dust.tar.gz

for DIRECTORY in $(ls | grep dust-); do
cd $DIRECTORY
done

sudo -A mv dust /usr/local/bin/

cd ~/.install-temp
rm -f dust.tar.gz
for DIRECTORY in $(ls | grep dust-); do
rm -rf $DIRECTORY
done
