#!/usr/bin/bash

cd ~/.install-temp

sudo -v apt install neovim -y

curl -L 'https://go.microsoft.com/fwlink/?LinkID=760868' > vscode.deb
sudo -v apt install ./vscode.deb
rm -f vscode.deb

touch fonts
cd fonts
curl -L 'https://github.com/tonsky/FiraCode/releases/download/4/Fira_Code_v4.zip' > firacode.zip
unzip firacode.zip
sudo -v mv ttf/*.ttf /usr/share/fonts/truetype/
cd ~/.install-temp
rm -rf fonts
