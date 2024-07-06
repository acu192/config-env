#!/bin/bash

set -ex

cd $HOME
echo "Home is:" $(pwd)

# System dependencies:
if [ $(id -u) = 0 ]
then
    SUDO_PREFIX=
else
    SUDO_PREFIX=sudo
fi
$SUDO_PREFIX apt update && $SUDO_PREFIX apt install -y \
    sudo xsel \
    make cmake build-essential \
    git tmux vim htop wget curl \
    ffmpeg unzip zip \
    ripgrep neovim

# Nodejs:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# Pyright:
sudo npm install -g pyright

# My config stuff:
mkdir -p github
cd github
rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env
cd nvim       && make nvim-env && cd ..
cd tmux       && make tmux     && cd ..
cd bash/linux && make          && cd ../..
cd htop       && make          && cd ..
cd gitconfig  && make          && cd ..
cd

# Anaconda
sudo mkdir -p /opt/conda
if [ ! -z "$USER" ]; then
    sudo chown $USER /opt/conda/
fi
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
bash Anaconda3-2023.09-0-Linux-x86_64.sh -p /opt/conda -f -b
rm Anaconda3-2023.09-0-Linux-x86_64.sh
