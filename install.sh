#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    diodon \
    dropbox \
    filezilla \
    jumpapp \
    kazam \
    mysql-client mysql-server mysql-workbench \
    php composer php-common php-mbstring php-xml php-zip \
    qbittorrent \
    snapd \
    software-properties-common \
    sublime-text \
    terminator \
    vagrant \
    vim vim-gtk3 \
    virtualbox \
    virtualenv virtualenvwrapper \
    vlc

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

sudo apt-get install -y docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER

# TODO Setup MEGASync folders
#mega-sync $HOME/.config/sublime-text-3/Packages/User /SublimeUser
#mega-sync $HOME/Documents /Documents
#mega-sync $HOME/Pictures /Pictures

# Import Cinnamon desktop settings
dconf load /org/cinnamon/ < ./cinnamon.conf
