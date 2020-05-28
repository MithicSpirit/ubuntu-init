#!/usr/bin/bash

# Init
mkdir ~/.install-temp
cd ~/.install-temp

# Install dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install git curl -y

# Download repo
git clone --depth=1 https://github.com/MithicSpirit/ubuntu-init.git ./repo

# Run scripts
bash repo/scripts/zsh.bash
bash repo/scripts/python.bash
bash repo/scripts/coding.bash
bash repo/scripts/node.bash
bash repo/scripts/latex.bash
bash repo/scripts/misc.bash

# Copies important files over
cp -r repo/files/home/* ~/
sudo chmod -R a+x ~/scripts

# "Quick" update of everything
~/scripts/update-all.sh

# Clean up
sudo apt remove vim -y
sudo apt autoremove -y

rm -rf ~/.install-temp # Self destruct
