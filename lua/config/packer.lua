local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    requires = {
      {"nvim-lua/plenary.nvim"},
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },

    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      local extensions = telescope.extensions

      telescope.setup()
      telescope.load_extension("live_grep_args")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- ripgrep is necessary (`sudo apt install ripgrep`)
      vim.keymap.set("n", "<leader>fa", extensions.live_grep_args.live_grep_args, {})
      vim.keymap.set("n", "<leader>fb", function() builtin.buffers({ sort_mru = true, ignore_current_buffer = true }) end, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    end
  }

  use {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }

  use {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        diagnostics = {
          enable = true,
        },
        filters = {
          dotfiles = false,
        },
      })

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local api = require "nvim-tree.api"
      vim.keymap.set("n", "<leader>ee", api.tree.toggle, {})
      vim.keymap.set("n", "<leader>ef", api.tree.find_file, {})
      vim.keymap.set("n", "<leader>ec", api.tree.collapse_all, {})
    end,
  }

  use "nvim-tree/nvim-web-devicons"

  use {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  }

  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
      {"neovim/nvim-lspconfig"},
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
    }
  }

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>")
      vim.keymap.set("n", "<leader>cs", "<Cmd>Trouble symbols toggle focus=false<CR>")
      vim.keymap.set("n", "<leader>cl", "<Cmd>Trouble lsp toggle focus=false win.position=right<CR>")
      vim.keymap.set("n", "<leader>xL", "<Cmd>Trouble loclist toggle<CR>")
      vim.keymap.set("n", "<leader>xQ", "<Cmd>Trouble qflist toggle<CR>")
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup {
        sections = {
          lualine_c = {
            {
              "filename",
              path = 1
            }
          }
        }
      }

    end,
  }

  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        terminal_mappings = true
      }
      vim.keymap.set("n", "<leader>tv", vim.cmd.ToggleTerm)
      vim.keymap.set("n", "<leader>tt", function() vim.cmd [[ToggleTerm direction=tab]] end)
    end,
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use "sindrets/diffview.nvim"

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end
  }

  use {
    "rhysd/git-messenger.vim"
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
