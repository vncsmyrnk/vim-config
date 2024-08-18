default:
  just --list

install-deps:
  sudo apt install build-essential curl tar git

install-reqs: install-deps
  curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar -xzf nvim-linux64.tar.gz
  ls nvim-linux64/ | xargs -I {} sudo cp -r nvim-linux64/{}/ /usr/local
  rm -rf nvim-linux64*
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

install: install-reqs config

config:
  mkdir -p {{home_dir()}}/.config/nvim
  stow -t {{home_dir()}}/.config/nvim .

delete-config:
  stow -D -t {{home_dir()}}/.config/nvim .
