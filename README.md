![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

# vim/nvim Config

This is my local vim/nvim config using lua.

Check [branches](https://github.com/vncsmyrnk/vim-config/branches) section for language specific configurations.

To work properly this repo should be cloned/copied to `~/.config/nvim` and [packer.vim](https://github.com/wbthomason/packer.nvim) must be installed.

The Neovim versions `0.9` and `0.10` are compatible with the configuration.

## Install

This project uses [just](https://github.com/casey/just) and [stow](https://www.gnu.org/software/stow/) for the installation.

```bash
just install
```

Considering `nvim` and `packer` are already installed, you can just run:

```bash
just config
```

After the installation, feel free to change branches for different configs.

## Notes

Some errors may appear on the first `nvim` run, make sure to close all and run `:PackerSync` to install the plugins. The execution of `:PackerSync` itself may result in errors on first try, run it twice and it will install all plugins. After all of that, restart `nvim`.

## Credits

Based on [@ThePrimeagen](https://github.com/ThePrimeagen)'s config.
