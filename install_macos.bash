#!/bin/bash

set -ex

cd $HOME/Desktop
echo "Home is:" $(pwd)

# Change default shell to bash:
chsh -s /bin/bash

# Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# System dependencies:
brew install make cmake git tmux vim htop wget curl ffmpeg unzip zip python@3.12
brew install --cask iterm2

# Ripgrep:
brew install ripgrep

# Nvim:
brew install neovim

# Nodejs:
brew install node@21

# Pyright:
npm install -g pyright

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
cd pythondeps && make          && cd ..
cd

# Misc
echo 'NOW CHANGE YOUR HOSTNAME WITH: `sudo scutil --set HostName <your-hostname>`'
