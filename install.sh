#!/bin/bash

sudo apt-get install \
    terminator \
    vim vim-gtk3 \
    gnome-tweak-tools \
    nemo \
    curl \
    vagrant \
    virtualbox \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Install nvm
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
curl -o- https://raw.githubusercontent.com/creationix/nvm/$(get_latest_release "creationix/nvm")/install.sh | bash

#  Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"



sudo apt-get update
sudo apt-get install docker-ce

# TODO Install nvm

