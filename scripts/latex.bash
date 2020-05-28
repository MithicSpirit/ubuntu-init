#!/usr/bin/bash

cd ~/.install-temp

curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz > texlive.tar.gz
tar -xzf texlive.tar.gz

for DIRECTORY in $(ls | grep install-tl); do
cd $DIRECTORY
done

./install-tl --profile ../repo/files/texlive.profile

tlmgr init-usertree
tlmgr repository set http://mirror.utexas.edu/ctan/systems/texlive/tlnet

cd ~/.install-temp
rm texlive
