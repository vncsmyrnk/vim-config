#!/bin/bash

stderr_file=.nvim-installer-error-log
stdout_file=/dev/null

handle_error() {
  echo -e "\n"
  echo -e "\033[1;31m[Error] \033[0m $1"
  echo -e "Check file \033[1m$stderr_file\033[0m for more info"
  exit 1
}

show_done() {
  echo -e "\033[1;32mDone.\033[0m"
}

apt-get update > $stdout_file

echo -e "\nInstalling dependecies..."
apt-get install -y build-essential curl tar git > $stdout_file 2> $stderr_file || handle_error "A problem occurred when installing dependencies"
show_done

echo -e "\nDownloading neovim..."
curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz > $stdout_file 2> $stderr_file || handle_error "Error on downloading neovim"
show_done

echo "\nInstalling neovim..."
{
  tar -xzf nvim-linux64.tar.gz
  ls nvim-linux64/ | xargs -I {} cp -r nvim-linux64/{}/ /usr/local
  rm -rf nvim-linux64*
} > $stdout_file 2> $stderr_file || handle_error "Error on installing neovim"
show_done

echo "\nInstalling packer.vim..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim > $stdout_file 2> $stderr_file || {
  echo "packer already installed"
}
show_done

echo "\nApplying neovim configs..."
{
  neovim_config_path=~/.config/nvim
  if [ -d $neovim_config_path ]; then
    rm -rf $neovim_config_path
  fi
  git clone --depth 1 https://github.com/vncsmyrnk/vim-config.git $neovim_config_path
} > $stdout_file 2> $stderr_file || handle_error "Error on applying configs"
show_done

echo -e "\n"
echo -e "\033[1;32mInstallation completed.\033[0m"
echo -e "\033[4mNeovim\033[0m is installed and configured. You can now open neovim with \033[1mnvim\033[0m command"
echo -e "On first run, make sure to skip the errors and execute \033[1m:PackerSync\033[0m to install dependencies"
echo -e "\033[2mYou may need to run it a couple times and restart neovim in order to complete the installation \033[0m"
