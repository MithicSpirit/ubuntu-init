#!/bin/bash

read -s -p "Please enter your password: " PSWD
export PSWD

export SUDO_ASKPASS="/home/mithic/scripts/pswd"
sudo -Av && echo || exit


echo -e "\nAptitude" 
sudo -A $(which apt) update &&
	sudo -A $(which apt) upgrade -y
 
echo -e "\nLaTeX"
sudo -AH $(which tlmgr) update --self --all

echo -e "\nPython"
$(which pipupgrade) --ignore-error -y --self && (
	$(which pipupgrade) --ignore-error -y --pip --latest --pip-path="$HOME/.local/bin/pip3.8"
	$(which pipupgrade) --ignore-error -y --pip --latest --pip-path="$HOME/.local/bin/pip2.7" 
)

echo -e "\nNode"
if [[ $(npm -g outdated npm) ]]; then
	nvm install-latest-npm &&
		$(which npm) -g upgrade
else
	$(which npm) -g upgrade
fi
