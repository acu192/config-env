#!/bin/bash

set -ex

cd $HOME

# System dependencies:
if [ $(id -u) = 0 ]
then
    SUDO_PREFIX=
else
    SUDO_PREFIX=sudo
fi
$SUDO_PREFIX apt update && apt install -y \
    sudo xsel \
    make cmake build-essential \
    git tmux vim htop wget curl \
    ffmpeg unzip zip

# Ripgrep:
rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl
tar -xvzf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
cp ./ripgrep-13.0.0-x86_64-unknown-linux-musl/rg /usr/local/bin/
rm -rf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz ripgrep-13.0.0-x86_64-unknown-linux-musl/

# Nvim:
rm -rf nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
rm -rf nvim-linux64
tar -xvzf nvim-linux64.tar.gz
rm -rf /usr/local/etc/nvim-linux64
mv nvim-linux64 /usr/local/etc/
rm -rf /usr/local/bin/nvim /usr/local/bin/vim
ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/nvim
ln -s /usr/local/etc/nvim-linux64/bin/nvim /usr/local/bin/vim
rm -rf nvim-linux64.tar.gz

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

# Rustup:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
bash -lc 'rustup component add rust-analyzer'

# AWS CLI:
rm -rf ./aws awscliv2.zip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./aws awscliv2.zip

# My config stuff:
mkdir -p github
cd github
rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env
cd nvim && make nvim-env
cd tmux && make tmux
cd bash && make
cd htop && make
cd gitconfig && make
