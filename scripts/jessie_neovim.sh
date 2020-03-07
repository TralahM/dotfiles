#!/usr/bin/env sh

sudo echo "deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu vivid main"\
    >> /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 55F96FCF8231B6DD
sudo apt-get update
sudo apt-get install neovim -y
