require("toggleterm").setup{
  terminal_mappings = true
}
vim.keymap.set("n", "<leader>tv", vim.cmd.ToggleTerm)
vim.keymap.set("n", "<leader>tt", function() vim.cmd [[ToggleTerm direction=tab]] end)
