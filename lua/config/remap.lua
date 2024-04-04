vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>i", 'gg=G')
vim.keymap.set("n", "<leader>y", '\"+y')
vim.keymap.set("v", "<leader>y", '\"+y')
vim.keymap.set("n", "<leader>yl", ':y<CR>')
vim.keymap.set("n", "<leader><tab>", ':b#<CR>')
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.opt.clipboard="unnamedplus"
