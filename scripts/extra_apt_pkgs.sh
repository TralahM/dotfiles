#!/usr/bin/env sh
echo "office tools,commonlisp,qbittorrent,gnuradio,xboard,gnuplot,gnuchess..."
sudo apt-get install libreoffice qbittorrent sbcl xboard gnumeric gnuplot \
    gnuradio gnuradio-dev gnugo gnu-smalltalk gnupg2 gnucash gnuchess -y

# Chrome setup after some essentials
echo "Chrome setup:\n\tAdding chrome repository ..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo "Installing Chrome"
sudo dpkg --install google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
echo "firefox,blender,gimp,inkscape,vlc"
sudo apt-get install firefox blender gimp inkscape vlc -y

# Docker setup - https://docs.docker.com/install/linux/docker-ce/ubuntu/
echo "Docker Setup adding docker repository..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
echo "Installing docker-ce docker-ce-cli containerd.io..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# adds the current user who is sudo'ing to a docker group:
echo  "adds the current user who is sudo'ing to a docker group:"
sudo groupadd docker
sudo usermod -aG docker $SUDO_USER
sudo service docker restart

echo "Anaconda GUI dependencies for Qt intall ..."
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 \
    libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y

# Anaconda installation
echo "Download and Install Anaconda for Python 3.7 ..."
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh
rm Anaconda3-2019.10-Linux-x86_64.sh
# Autoremove unneccessary apps
sudo apt autoremove -y
