return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Fugitive: Git status" }
    }
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("gitsigns").setup()
    end,
    keys = {
      { "]c",         "<cmd>Gitsigns next_hunk<cr>",                 desc = "Gitsigns: Next hunk" },
      { "[c",         "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Gitsigns: Previous hunk" },
      { "<leader>gh", "<cmd>Gitsigns stage_hunk<cr>",                desc = "Gitsigns: Stage hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Gitsigns: Reset hunk" },
      { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",              desc = "Gitsigns: Stage buffer" },
      { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>",           desc = "Gitsigns: Undo stage hunk" },
      { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>",              desc = "Gitsigns: Reset buffer" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Gitsigns: Preview hunk" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Gitsigns: Toggle blame" },
      { "<leader>dd", "<cmd>Gitsigns diffthis<cr>",                  desc = "Gitsigns: Diff this" },
      { "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>",            desc = "Gitsigns: Toggle deleted" },
    }
  },

  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup {
        default_remote = { "upstream", "origin" },
      }
    end,
  },

  { "rhysd/git-messenger.vim" },
}