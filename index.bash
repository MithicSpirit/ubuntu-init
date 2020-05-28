#!/usr/bin/bash

# Init
mkdir ~/.install-temp
cd ~/.install-temp

# Install dependencies
sudo apt update
sudo apt upgrade
sudo apt install git curl

# Download repo
git clone --depth=1 https://github.com/MithicSpirit/ubuntu-init.git ./repo

# Run scripts
repo/scripts/zsh.bash
repo/scripts/python.bash
repo/scripts/coding.bash
repo/scripts/node.bash
repo/scripts/latex.bash
repo/scripts/misc.bash

# Copies important files over
cp -r repo/files/home/* ~/

# "Quick" update of everything
~/scripts/update-all.sh

# Clean up
sudo apt remove vim
sudo apt autoremove

rm -rf ~/.install-temp # Self destruct
