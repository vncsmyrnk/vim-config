vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "yes:1"

vim.cmd("startinsert")

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
