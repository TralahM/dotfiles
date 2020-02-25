#!/usr/bin/env sh

CD=$(pwd)
# Remove password request for current user when sudo-ing
echo "Starting Bootstrapping Script on $(uname -a) ..."
echo $(whoami)  ALL=NOPASSWD ALL|sudo tee /etc/sudoers
echo "%sudo ALL=(ALL:ALL)   ALL"|sudo tee /etc/sudoers

# Start with update and upgrade of current distro as is
sh $CD/scripts/upgrade.sh
# Install Basic apt packages
sh $CD/scripts/basic_apt_packages.sh
# Install Extra apt packages
sh $CD/scripts/extra_apt_pkgs.sh
# If anaconda has been installed proceed to install pip modules
sh $CD/scripts/pip_pkg.sh
# If nodejs/yarn/npm has been installed proceed to install yarn modules
# if ruby has been installed proceed to install gems
# Login to heroku using cli if installed
# Configure git,ssh keys, hub cli if not existent
sh $CD/scripts/gitconf.sh
# When done Reboot system a new
