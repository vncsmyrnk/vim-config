require('mason').setup({})
require('mason-nvim-dap').setup({
  ensure_installed = {'delve'},
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end,
  }
})

require('dap-go').setup()

local dap = require('dap')
require('dapui').setup()
dap.set_log_level('TRACE')

dap.adapters.delve = {
  type = 'server',
  port = '2345',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:2345'},
  }
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
  {
    type = "delve",
    name = "Attach",
    request = "attach",
    mode = "remote",
    remotePath = "",
    port = "2345",
    host = "127.0.0.1",
  }
}

-- Example for running delve and debug: `dlv debug --headless --listen=:2345 --api-version=2 --log cmd/api/main.go`
-- Then add the breakpoints on the target file and run `:lua require'dap'.continue()` to intiate the debug
-- Finally, make the requests and check the breakpoints

vim.api.nvim_set_keymap('n', '<F5>', ':lua require\'dap\'.continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':lua require\'dap\'.step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':lua require\'dap\'.step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':lua require\'dap\'.step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':lua require\'dap\'.toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require\'dap\'.repl.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require\'dap\'.run_last()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>du', ':lua require\'dapui\'.toggle()<CR>', { noremap = true, silent = true })
