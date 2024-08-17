![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

# My vim/nvim config

This is my local vim/nvim config using lua.

Check [branches](https://github.com/vncsmyrnk/vim-config/branches) section for language specific configurations.

To work properly this repo should be cloned on `~/.config/nvim` and [packer.vim](https://github.com/wbthomason/packer.nvim) must be installed.

The Neovim versions `0.9` and `0.10` are compatible with the configuration.

## Install

To install it just run:

```bash
git clone --depth 1 https://github.com/vncsmyrnk/vim-config.git ~/.config/nvim
```
\**Note that the last command will override any existing nvim config*

## Install nvim and config

To install neovim and apply the config, run the `install.sh` script. To download and run it:

```bash
bash <(curl -s https://raw.githubusercontent.com/vncsmyrnk/vim-config/main/install.sh)
```

To install from a specific branch config:

```bash
bash <(curl -s https://raw.githubusercontent.com/vncsmyrnk/vim-config/{BRANCH}/install.sh)
```

Some errors may appear on the first `nvim` run, make sure to close all and run `:PackerSync` to install the plugins. The execution of `:PackerSync` itself may result in errors on first try, run it twice and it will install all plugins. After all of that, restart `nvim`.

## Credits

Based on [@ThePrimeagen](https://github.com/ThePrimeagen)'s config.
