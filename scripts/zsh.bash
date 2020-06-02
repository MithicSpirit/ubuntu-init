#!/usr/bin/bash

cd ~/.install-temp

sudo -A apt install zsh -y

export CHSH='no'
export RUNZSH='no'
export KEEP_ZSHRC='yes'
sh -c "$(curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

mkdir meslo
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf > "meslo/MesloLGS NF Regular.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf > "meslo/MesloLGS NF Bold.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf > "meslo/MesloLGS NF Italic.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf > "meslo/MesloLGS NF Bold Italic.ttf"
sudo -A mv meslo/*.ttf /usr/share/fonts/truetype/
rm -rf meslo

sudo -A chsh mithic -s /usr/bin/zsh
