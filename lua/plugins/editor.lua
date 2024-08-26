return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
      {"nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0"},
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup()
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope: Fuzzy finder"},
      {"<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: Live grep"},
      {"<leader>fa", function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Telescope: Live grep with args (rg)"},
      {"<leader>fb", function() require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true }) end, desc = "Telescope: Buffers"},
      {"<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Telescope: Commits"},
      {"<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Telescope: Git status"},
      {"<C-p>", function() require("telescope.builtin").git_files() end, desc = "Telescope: Git files"},
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        {"<leader>f", group = "File find"},
        {"<leader>e", group = "File explorer"},
        {"<leader>v", group = "Git"},
        {"<leader>g", group = "LSP"},
        {"<leader>q", group = "Quit"},

        {"gK", desc = "LSP: Hover"},
        {"gd", desc = "LSP: Go to definition"},
        {"gD", desc = "LSP: Go to declaration"},
        {"gi", desc = "LSP: Go to implementation"},
        {"go", desc = "LSP: Go to type definition"},
        {"gr", desc = "LSP: Go to references"},
        {"gs", desc = "LSP: Signature help"},
        {"<F2>", desc = "LSP: Buffer rename"},
        {"<F3>", desc = "LSP: Buffer format"},
        {"<F4>", desc = "LSP: Code actions"},

        {"<F5>", desc = "DAP: Continue" },
        {"<F10>", desc = "DAP: Step over" },
        {"<F11>", desc = "DAP: Step into" },
        {"<F12>", desc = "DAP: Step out" },
        {"<leader>b", desc = "DAP: Toggle breakpoint" },
        {"<leader>dr", desc = "DAP: Open REPL" },
        {"<leader>dl", desc = "DAP: Run last" },
        {"<leader>du", desc = "DAP: Toggle UI" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1
          }
        }
      }
    },
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      {"<leader>vs", "<cmd>Git<cr>", desc = "Fugitive: Git status"}
    }
  },


  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTree",
    keys = {
      {"<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle"},
      {"<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Neotree reveal"},
      {"<leader>eg", "<cmd>Neotree git_status<cr>", desc = "Neotree git status"},
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    lazy = false,
  },

  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
  },

  {"rhysd/git-messenger.vim"},
  {"echasnovski/mini.pairs"},
  {"sindrets/diffview.nvim"},
  {"echasnovski/mini.nvim", version = "*"},
}
