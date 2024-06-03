#!/bin/bash

apt update

echo "Installing neovim dependecies (neovim, gcc, wget)..."
apt install fuse libfuse2 build-essential git wget -y

echo "Downloading neovim..."
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

echo "Installing neovim..."
chmod u+x nvim.appimage
mv nvim.appimage /usr/local/bin/nvim

echo "Installing packer.vim..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim || {
  echo "packer already installed"
}

echo "Applying neovim configs..."
neovim_config_path=~/.config/nvim
if [ -d $neovim_config_path ]; then
  rm -rf $neovim_config_path
fi
git clone --depth 1 https://github.com/vncsmyrnk/vim-config.git $neovim_config_path
source $neovim_config_path/*/**.lua

echo "neovim is installed and configured"
