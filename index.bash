#!/usr/bin/bash

# Init
mkdir ~/.install-temp
cd ~/.install-temp

read -s -p "Please enter your password: " PSWD
export PSWD

echo '#!/bin/bash' > pswd
echo 'echo "$PSWD"' >> pswd
export SUDO_ASKPASS="/home/mithic/scripts/pswd"
sudo -Av && echo || exit

# Install dependencies
sudo -v apt update
sudo -v apt upgrade -y
sudo -v apt install git curl -y

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
for FILE in $(ls -A repo/files/home); do
cp repo/files/home/$FILE ~/
done

sudo -v chmod -R a+x ~/scripts

# "Quick" update of everything
~/scripts/update-all.sh

# Useful symlinks
cd ~
ln -s scripts/update-all.sh upgrade

# Clean up
sudo -v apt remove vim -y
sudo -v apt autoremove -y

rm -rf ~/.install-temp # Self destruct

echo "Please restart your computer"
echo "(or at least your terminal)"