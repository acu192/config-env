#!/bin/bash

set -ex

cd $HOME/Desktop
echo "Home is:" $(pwd)

# Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# System dependencies:
brew install make cmake git tmux vim htop wget curl ffmpeg unzip zip
brew install --cask iterm2

# Ripgrep:
brew install ripgrep

# Nvim:
brew install neovim

# Nodejs:
brew install node@21

# Pyright:
npm install -g pyright

# Rustup:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
bash -lc 'rustup component add rust-analyzer'

# My config stuff:
mkdir -p github
cd github
rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env
cd nvim       && make nvim-env && cd ..
cd tmux       && make tmux     && cd ..
cd bash/macos && make          && cd ../..
cd htop       && make          && cd ..
cd gitconfig  && make          && cd ..
