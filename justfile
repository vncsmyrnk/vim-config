default:
  just --list

install-deps:
  sudo apt install build-essential curl tar git ripgrep stow
  if ! type brew; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi

install-reqs: install-deps
  brew install neovim

install: install-reqs config

config:
  mkdir -p {{home_dir()}}/.config/nvim
  stow -t {{home_dir()}}/.config/nvim .

delete-config:
  stow -D -t {{home_dir()}}/.config/nvim .
