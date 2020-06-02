#!/usr/bin/bash

cd ~/.install-temp

sudo -A apt install zsh -y

export CHSH='no'
export RUNZSH='no'
export KEEP_ZSHRC='yes'
sh -c "$(curl -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

mkdir fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf > "fonts/MesloLGS NF Regular.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf > "fonts/MesloLGS NF Bold.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf > "fonts/MesloLGS NF Italic.ttf"
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf > "fonts/MesloLGS NF Bold Italic.ttf"
sudo -A mv fonts/*.ttf /usr/share/fonts/truetype/
rm -rf fonts

sudo -A chsh mithic -s /usr/bin/zsh
