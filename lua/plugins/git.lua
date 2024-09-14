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
      { "]c", "<cmd>Gitsigns next_hunk<cr>", desc = "Gitsigns: Next hunk" },
      { "[c", "<cmd>Gitsigns prev_hunk<cr>", desc = "Gitsigns: Previous hunk" },
    }
  },

  -- TODO: Add scripts for installing gh and config it
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup {
        default_remote = { "upstream", "origin", "studiosol" },
      }
    end,
  },

  { "rhysd/git-messenger.vim" },
}
