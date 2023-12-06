#!/bin/bash

set -ex

# TODO install brew

brew install make cmake git tmux vim htop wget curl ffmpeg unzip zip

brew install --cask iterm2

cd $HOME

mkdir -p github
cd github

rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env

make all
