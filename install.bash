#!/bin/bash

set -ex

cd $HOME

mkdir -p github
cd github

rm -rf config-env
git clone https://github.com/acu192/config-env.git
cd config-env

if [ $(id -u) = 0 ]
then
    make apt
else
    sudo make apt
fi

make all
