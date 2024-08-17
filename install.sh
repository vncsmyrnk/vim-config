#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sourcing=false

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --sourcing)
      sourcing=true
      shift
      ;;
    *)
      break
      ;;
  esac
done

stderr_file=.nvim-installer-error-log
stdout_file=/dev/null

apt_dependencies=(build-essential curl tar git)
neovim_config_path=~/.config/nvim
user_owner_home=$(ls -ld ~ | cut -d " " -f3)
group_owner_home=$(ls -ld ~ | cut -d " " -f4)

handle_error() {
  echo -e "\033[1;31m[Error]\033[0m $1"
  echo -e "Check file \033[1m$stderr_file\033[0m for more info"
  exit 1
}

show_done() {
  echo -e "\033[1;32mDone.\033[0m"
}

before() {
  if [ $(id -u) -ne 0 ]; then
    echo -e "Necessary dependencies: ${apt_dependencies[@]}" > $stderr_file
    handle_error "This script requires sudo privileges (and the sudo command) for installing dependencies and nvim itself"
  fi

  sudo apt-get update > $stdout_file

  echo -e "Installing dependencies via \033[1mapt-get\033[0m..."
  {
    for dependency in ${apt_dependencies[@]}; do
      sudo apt-get install -y $dependency >> $stdout_file 2> $stderr_file || handle_error "A problem occurred while installing \033[1m$dependency\033[0m"
      echo -e "\033[1m$dependency\033[0m ok"
    done
  }
  show_done

  echo -e "\nDownloading neovim..."
  curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz >> $stdout_file 2> $stderr_file || handle_error "Error on downloading neovim"
  show_done

  echo -e "\nInstalling neovim..."
  {
    tar -xzf nvim-linux64.tar.gz
    ls nvim-linux64/ | xargs -I {} sudo cp -r nvim-linux64/{}/ /usr/local
    rm -rf nvim-linux64*
  } >> $stdout_file 2> $stderr_file || handle_error "Error on installing neovim"
  show_done

  echo -e "\nInstalling packer.vim..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim >> $stdout_file 2> $stderr_file || {
    echo "packer already installed"
  }
  chown -R $user_owner_home:$group_owner_home ~/.local
  show_done
}

config() {
  if [ ! -d ~/.config/nvim ]; then
    ln -s $SCRIPT_DIR ~/.config/nvim
  fi
}

symbolic_install() {
  before
  config
  echo -e "\033[1;32mDone.\033[0m"
}

install() {
  before

  echo -e "\nApplying neovim configs..."
  {
    if [ -d $neovim_config_path ]; then
      rm -rf $neovim_config_path
    fi
    git clone --depth 1 https://github.com/vncsmyrnk/vim-config.git $neovim_config_path --branch custom-go-php
  } >> $stdout_file 2> $stderr_file || handle_error "Error on applying configs"
  show_done

  echo -e "\033[1;32m\nInstallation completed.\033[0m"
  echo -e "\033[4mNeovim\033[0m is installed and configured. You can now open neovim with \033[1mnvim\033[0m command"
  echo -e "On first run, make sure to skip the errors and execute \033[1m:PackerSync\033[0m to install dependencies"
  echo -e "\033[2mYou may need to run it a couple times and restart neovim in order to complete the installation \033[0m"
}

if [[ "$sourcing" = "false" ]]; then
  install
fi
