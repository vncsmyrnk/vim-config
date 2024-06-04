require("toggleterm").setup{
  terminal_mappings = true
}
vim.keymap.set("n", "<leader>t", vim.cmd.ToggleTerm)
