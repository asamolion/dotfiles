#!/bin/bash

sudo apt-get install \
    terminator \
    sublime-text \
    sublime-merge \
    vim vim-gtk3 \
    curl \
    vagrant \
    virtualbox \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    megacmd


sudo snap install postman

# Install nvm
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
curl -o- https://raw.githubusercontent.com/creationix/nvm/$(get_latest_release "creationix/nvm")/install.sh | bash

#  Install docker
sudo apt-get remove docker docker-engine docker.io

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER

# Setup MEGASync folders
mega-sync $HOME/.config/sublime-text-3/Packages/User /SublimeUser
mega-sync $HOME/Documents /Documents
mega-sync $HOME/Pictures /Pictures

