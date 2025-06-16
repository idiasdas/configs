#!/usr/bin/env bash

git clone -b v0.11.2 https://github.com/neovim/neovim $HOME/personal/neovim
sudo apt install ninja-build gettext cmake unzip curl build-essential xclip

cd $HOME/personal/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/personal/neovim
make install
