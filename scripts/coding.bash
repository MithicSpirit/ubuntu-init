#!/usr/bin/bash

cd ~/.install-temp

sudo apt install neovim

curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > vscode.deb
sudo apt install ./vscode.deb
rm vscode.deb
