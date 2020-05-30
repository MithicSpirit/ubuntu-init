#!/usr/bin/bash

cd ~/.install-temp

sudo -v apt install python3 libgirepository1.0-dev gcc libcairo2-dev pkg-config python3-dev gir1.2-gtk-3.0 -y

curl -L https://bootstrap.pypa.io/get-pip.py > get-pip.py
python3 get-pip.py
rm -f get-pip.py

~/.local/bin/pip3 install neovim youtube-dl manimlib pipupgrade matplotlib pycairo pygobject pillow flake8 requests
