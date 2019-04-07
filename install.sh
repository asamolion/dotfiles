#!/bin/bash

# Copy files
cp ./img/* $HOME/Pictures/

# Download debs
wget -P $HOME/Downloads https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb
wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install debs
sudo apt install -y $HOME/Downloads/*.deb

# Add software sources
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

sudo apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    debhelper \
    diodon \
    dropbox \
    filezilla \
    kazam \
    megacmd \
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
    zsh

sudo snap install postman
sudo snap install vscode --classic

# Set zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install nvm
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
curl -o- https://raw.githubusercontent.com/creationix/nvm/$(get_latest_release "creationix/nvm")/install.sh | bash

#  Install docker
sudo apt remove docker docker-engine docker.io

sudo apt install -y docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER

# Install Jumpapp
git clone https://github.com/mkropat/jumpapp.git
cd jumpapp
make deb
sudo apt install -y ./jumpapp*all.deb

cd $HOME/dotfiles/

# Clear downloaded debs
rm $HOME/Downloads/*.deb

sudo apt upgrade

# Fix broken packages just in case
sudo apt-get install -f

# Clean all generated files
git clean -f

# Import Cinnamon desktop settings
#dconf load /org/cinnamon/ < ./cinnamon.conf
