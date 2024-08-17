local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- ripgrep is necessary (`sudo apt install ripgrep`)
vim.keymap.set('n', '<leader>fa', extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ sort_mru = true, ignore_current_buffer = true }) end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
