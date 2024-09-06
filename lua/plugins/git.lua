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
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- TODO: Add scripts for installing gh and config it
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup {
        default_remote = { "upstream", "studiosol", "origin" },
      }
    end,
  },

  { "rhysd/git-messenger.vim" },
}
