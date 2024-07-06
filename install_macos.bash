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
cd

# Anaconda
sudo mkdir -p /opt/conda
if [ ! -z "$USER" ]; then
    sudo chown $USER /opt/conda/
fi
ANACONDA_VERSION="Anaconda3-2024.06-1-MacOSX-arm64.sh"
wget "https://repo.anaconda.com/archive/$ANACONDA_VERSION"
bash "$ANACONDA_VERSION" -p /opt/conda -f -b
rm "$ANACONDA_VERSION"

# Misc
echo 'NOW CHANGE YOUR HOSTNAME WITH: `sudo scutil --set HostName <your-hostname>`'
