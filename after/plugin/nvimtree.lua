-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
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
  filters = {
    dotfiles = false,
  },
})

-- Custom mappings
local api = require "nvim-tree.api"
vim.keymap.set('n', '<leader>ee', api.tree.toggle, {})
vim.keymap.set('n', '<leader>ef', api.tree.find_file, {})
vim.keymap.set('n', '<leader>ec', api.tree.collapse_all, {})
