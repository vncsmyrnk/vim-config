vim.opt_local.number = false
vim.opt_local.relativenumber = false

vim.cmd("startinsert")

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
