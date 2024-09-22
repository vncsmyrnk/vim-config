os := `cat /etc/os-release | grep "^NAME=" | cut -d "=" -f2`
os_full := if os == "\"Arch Linux\"" { "arch" } else if os == "\"Debian GNU/Linux\"" { "debian" } else { error("Unsuported OS") }

default:
  just --list

install-deps:
  #!/bin/bash
  if [ "{{os_full}}" = "debian" ]; then
    sudo apt-get install build-essential curl tar git ripgrep stow
    if ! type brew; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
    brew install luarocks neovim gh
  elif [ "{{os_full}}" = "arch" ]; then
    sudo pacman -S base-devel curl tar git ripgrep stow luarocks neovim github-cli
  fi

install: install-deps config config-gh

config:
  mkdir -p {{home_dir()}}/.config/nvim
  stow -t {{home_dir()}}/.config/nvim .

config-gh:
  if [[ ! $(gh auth status) ]]; then gh auth login; fi

delete-config:
  stow -D -t {{home_dir()}}/.config/nvim .

clean-lazy:
  rm -rf ~/.local/share/nvim/lazy
