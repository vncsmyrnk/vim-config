default:
  just --list

install-deps:
  sudo apt install build-essential curl tar git ripgrep stow
  if ! type brew; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi

install-reqs: install-deps
  brew install luarocks neovim gh

install: install-reqs config config-gh

config:
  mkdir -p {{home_dir()}}/.config/nvim
  stow -t {{home_dir()}}/.config/nvim .

delete-config:
  stow -D -t {{home_dir()}}/.config/nvim .

config-gh:
  if [[ ! $(gh auth status) ]]; then gh auth login; fi

clean-lazy:
  rm -rf ~/.local/share/nvim/lazy
