vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Buffer
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy text" })
vim.keymap.set("n", "<leader><tab>", "<cmd>b#<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save file" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear highlight" })
vim.keymap.set("n", "<leader>n", "<C-w><C-w>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>qp", "<cmd>b#|bd#<CR>", { desc = "Close current buffer and go to previous" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Close session" })
vim.keymap.set("n", "<leader>qA", "<cmd>qa!<CR>", { desc = "Close session without saving" })

-- Copy file name
vim.keymap.set("n", "<leader>eyp", "<cmd>let @+ = expand(\"%:p\")<cr>", { desc = "Copy current buffer absolute path" })
vim.keymap.set("n", "<leader>eyf", "<cmd>let @+ = expand(\"%:f\")<cr>", { desc = "Copy current buffer relative path" })
vim.keymap.set("n", "<leader>eyt", "<cmd>let @+ = expand(\"%:f\")<cr>", { desc = "Copy current buffer file name" })

-- Resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Language Specific

-- PHP
vim.keymap.set("n", "<leader>ipe", "oerror_log(print_r($obj, true));", { desc = "Insert error_log debug stmt" })
