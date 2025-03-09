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

# My config stuff:
mkdir -p github
cd github
rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env
cd nvim       && make nvim-env && cd ..    || exit 1
cd tmux       && make tmux     && cd ..    || exit 1
cd bash/macos && make          && cd ../.. || exit 1
cd gitconfig  && make          && cd ..    || exit 1
cd pythondeps && make          && cd ..    || exit 1
cd ../..

# Misc:
echo 'NOW CHANGE YOUR HOSTNAME WITH: `sudo scutil --set HostName <your-hostname>`'
