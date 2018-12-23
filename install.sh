#!/bin/bash

# Add software sources
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

# Install
sudo apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    debhelper \
    diodon \
    dropbox \
    filezilla \
    jumpapp \
    kazam \
    mysql-client mysql-server mysql-workbench \
    pandoc \
    php composer php-common php-mbstring php-xml php-zip \
    qbittorrent \
    shunit2 \
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

# Install MEGAcmd
git clone https://github.com/meganz/MEGAcmd.git
cd MEGAcmd
git submodule update --init --recursive
sh autogen.sh
./configure
sudo make
sudo make install
cd ..

mega-sync $HOME/.config/sublime-text-3/Packages/User /SublimeUser
mega-sync $HOME/Documents /Documents
mega-sync $HOME/Pictures /Pictures

# Install Jumpapp
git clone https://github.com/mkropat/jumpapp.git
cd jumpapp
make deb
sudo dpkg -i jumpapp*all.deb
sudo apt-get install -f
cd ..
rm -rf jumpapp

# Import Cinnamon desktop settings
dconf load /org/cinnamon/ < ./cinnamon.conf
