#!/usr/bin/env sh
if [[ -ne ~/.gitconfig ]];then
    git config --global user.name "TralahM"
    git config --global user.email "musyoki.tralah@students.jkuat.ac.ke"
fi

if [[ -ne ~/.ssh/id_rsa ]];then
    ssh-keygen -t rsa -b 4096 -C "musyoki.tralah@students.jkuat.ac.ke"
    eval "\$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip < ~/.ssh/id_rsa.pub
    # now go to https://github.com/settings/keys
fi

if [[ -ne /usr/local/bin/hub ]];then
    wget https://github.com/github/hub/releases/download/v2.14.1/hub-linux-amd64-2.14.1.tgz
    sudo bash hub-linux-amd64-2.14.1/install
fi

