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
    tag = "0.1.8",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup()
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      { "<leader>ff",  function() require("telescope.builtin").find_files() end,                                               desc = "Telescope: Fuzzy finder" },
      { "<leader>fa",  function() require("telescope").extensions.live_grep_args.live_grep_args() end,                         desc = "Telescope: Live grep with args (rg)" },
      { "<leader>fb",  function() require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true }) end, desc = "Telescope: Buffers" },
      { "<leader>fd",  function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end,                                 desc = "Telescope: LSP diagnostics" },
      { "<leader>fm",  "<cmd>Telescope man_pages<cr>",                                                                         desc = "Telescope: man pages" },
      { "<leader>fr",  "<cmd>Telescope lsp_references<cr>",                                                                    desc = "Telescope: LSP references" },
      { "<leader>fs",  "<cmd>Telescope search_history<cr>",                                                                    desc = "Telescope: Search history" },
      { "<leader>fgc", "<cmd>Telescope git_commits<cr>",                                                                       desc = "Telescope: Git commits" },
      { "<leader>fgs", "<cmd>Telescope git_status<cr>",                                                                        desc = "Telescope: Git status" },
      { "<leader>fgb", "<cmd>Telescope git_branches<cr>",                                                                      desc = "Telescope: Git branches" },
      { "<C-p>",       function() require("telescope.builtin").git_files() end,                                                desc = "Telescope: Git project files" },
    },
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>f",  group = "File find" },
        { "<leader>e",  group = "File explorer" },
        { "<leader>g",  group = "Git" },
        { "<leader>q",  group = "Quit" },

        { "gK",         desc = "LSP: Hover" },
        { "gd",         desc = "LSP: Go to definition" },
        { "gD",         desc = "LSP: Go to declaration" },
        { "gi",         desc = "LSP: Go to implementation" },
        { "gO",         desc = "LSP: List diagnostics" },
        { "go",         desc = "LSP: Go to type definition" },
        { "gr",         desc = "LSP: Go to references" },
        { "gs",         desc = "LSP: Signature help" },
        { "<F2>",       desc = "LSP: Buffer rename" },
        { "<F3>",       desc = "LSP: Buffer format" },
        { "<F4>",       desc = "LSP: Code actions" },

        { "<F5>",       desc = "DAP: Continue" },
        { "<F10>",      desc = "DAP: Step over" },
        { "<F11>",      desc = "DAP: Step into" },
        { "<F12>",      desc = "DAP: Step out" },
        { "<leader>b",  desc = "DAP: Toggle breakpoint" },
        { "<leader>dr", desc = "DAP: Open REPL" },
        { "<leader>dl", desc = "DAP: Run last" },
        { "<leader>du", desc = "DAP: Toggle UI" },
        { "<leader>de", desc = "DAP: Eval under the cursor" },
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
    config = function()
      local colors = {
        blue   = "#80a0ff",
        cyan   = "#79dac8",
        black  = "#080808",
        white  = "#c6c6c6",
        red    = "#ff5189",
        violet = "#d183e8",
        grey   = "#303030",
      }

      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.white },
        },

        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },

        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.white },
        },
      }

      require("lualine").setup {
        options = {
          theme = bubbles_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
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
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTree",
    keys = {
      { "<leader>ee", "<cmd>Neotree toggle<cr>",     desc = "Neotree toggle" },
      { "<leader>ef", "<cmd>Neotree reveal<cr>",     desc = "Neotree reveal" },
      { "<leader>eg", "<cmd>Neotree git_status<cr>", desc = "Neotree git status" },
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
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = false,
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>snl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end,     desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            { desc = " dotfiles", group = "Number", action = "Telescope find_files follow=true cwd=$HOME/.config/nvim", key = "d" },
            { desc = " Current folder", group = "DashboardFiles", action = "Telescope find_files follow=true cwd=.", key = "f" },
          },
          packages = { enable = true },
          project = { enable = true, limit = 8, label = "Recent projects", action = "Telescope find_files cwd=" },
          mru = { limit = 10, label = "Recent files", cwd_only = false },
          footer = {},
        }
      }
    end,
  },

  { "rest-nvim/rest.nvim" },
  { "sindrets/diffview.nvim" },
}
