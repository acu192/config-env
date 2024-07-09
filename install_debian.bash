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
$SUDO_PREFIX apt update
$SUDO_PREFIX apt install -y \
    sudo xsel \
    make cmake build-essential \
    git tmux vim htop wget curl \
    ffmpeg unzip zip \
    ripgrep neovim \
    python3 python3-full python3-doc python3-dev python-is-python3 python3-pip python3-opencv

# Python virtual environment:
python3 -m venv /venv/base
source /venv/base/bin/activate

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
cd nvim       && make nvim-env && cd ..    || exit 1
cd tmux       && make tmux     && cd ..    || exit 1
cd bash/linux && make          && cd ../.. || exit 1
cd htop       && make          && cd ..    || exit 1
cd gitconfig  && make          && cd ..    || exit 1
cd pythondeps && make          && cd ..    || exit 1
cd
