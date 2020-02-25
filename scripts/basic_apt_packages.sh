#!/bin/env sh
echo "Some essentials..."
sudo apt-get install -y curl wget git xclip \
  apt-transport-https ca-certificates gnupg-agent build-essential \
  software-properties-common openssh-client -y

# build tools
echo "build tools...."
sudo apt-get install -y gcc g++ make cmake gfortran -y

# Core tools
echo "zsh,ruby,neovim,emacs,ffmpeg,texlive-full ..."
sudo apt-get install zsh clang++ tcpdump ruby perl texlive-full tmux emacs \
neovim fftw2 ffmpeg imagemagick -y

echo "Setting zsh as the login shell..."
sudo chsh -s /usr/bin/zsh

# Node setup - https://github.com/nodesource/distributions/blob/master/README.md
echo "Nodejs setup ..."
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs npm

# Yarn setup - https://yarnpkg.com/lang/en/docs/install/#debian-stable
echo "Yarn setup and Installation ..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update -y
sudo apt install yarn -y

echo "Databases setup POSTGRES..."
sudo apt-get install postgresql-all -y

