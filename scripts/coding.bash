#!/usr/bin/bash

cd ~/.install-temp

sudo -A apt install neovim -y

curl -L 'https://go.microsoft.com/fwlink/?LinkID=760868' > vscode.deb
sudo -A apt install ./vscode.deb
rm -f vscode.deb

mkdir firacode
cd firacode
curl -L 'https://github.com/tonsky/FiraCode/releases/download/4/Fira_Code_v4.zip' > firacode.zip
unzip firacode.zip
sudo -A mv ttf/*.ttf /usr/share/fonts/truetype/
cd ~/.install-temp
rm -rf firacode
