#!/usr/bin/env sh
echo "updating sources and upgrading ..."
sudo apt-get update && sudo apt-get upgrade -y
echo "adding universe apt-repository"
sudo add-apt-repository universe
sudo apt-get update -y
