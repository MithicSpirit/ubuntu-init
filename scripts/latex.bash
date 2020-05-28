#!/usr/bin/bash

cd "~/.install-temp"

curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz > texlive.tar.gz
tar -xzf texlive.tar.gz

cd texlive
./install-tl --profile ../files/texlive.profile
