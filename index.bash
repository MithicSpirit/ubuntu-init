#!/usr/bin/bash

# Init
mkdir ~/.install-temp
cd ~/.install-temp

read -s -p "Please enter your password: " PSWD
export PSWD

echo '#!/bin/bash' > pswd
echo 'echo "$PSWD"' >> pswd
export SUDO_ASKPASS="/home/mithic/.install-temp/pswd"
chmod -R u+x ~/.install-temp

sudo -Av && echo || exit

# Install dependencies
sudo -A apt update
sudo -A apt upgrade -y
sudo -A apt install git curl -y

# Download repo
git clone --depth=1 https://github.com/MithicSpirit/ubuntu-init.git ./repo
chmod -R u+x ~/.install-temp


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

sudo -A chmod -R a+x ~/scripts

# "Quick" update of everything
~/scripts/update-all.sh

# Useful symlinks
cd ~
ln -s scripts/update-all.sh upgrade

# Clean up
sudo -A apt remove vim -y
sudo -A apt autoremove -y

rm -rf ~/.install-temp # Self destruct

echo "Please restart your computer"
echo "(or at least your terminal)"