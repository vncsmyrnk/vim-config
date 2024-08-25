return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      {"williamboman/mason.nvim"},
      {"mfussenegger/nvim-dap"},
      {"jay-babu/mason-nvim-dap.nvim"},
    },
    config = function()
      local must_install = {}
      if vim.fn.executable("go") then
        table.insert(must_install, "delve")
      end

      require("mason").setup({})
      require("mason-nvim-dap").setup({
        ensure_installed = must_install,
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        }
      })

      local dap = require("dap")
      require("dapui").setup()
      dap.set_log_level("TRACE")
    end,
    keys = {
      {"<F5>", ":lua require\"dap\".continue()<CR>", { noremap = true, silent = true, desc = "DAP: Continue" }},
      {"<F10>", ":lua require\"dap\".step_over()<CR>", { noremap = true, silent = true, desc = "DAP: Step over" }},
      {"<F11>", ":lua require\"dap\".step_into()<CR>", { noremap = true, silent = true, desc = "DAP: Step into" }},
      {"<F12>", ":lua require\"dap\".step_out()<CR>", { noremap = true, silent = true, desc = "DAP: Step out" }},
      {"<leader>b", ":lua require\"dap\".toggle_breakpoint()<CR>", { noremap = true, silent = true, desc = "DAP: Toggle breakpoint" }},
      {"<leader>B", ":lua require\"dap\".set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>", { noremap = true, silent = true }},
      {"<leader>dr", ":lua require\"dap\".repl.open()<CR>", { noremap = true, silent = true, desc = "DAP: Open REPL" }},
      {"<leader>dl", ":lua require\"dap\".run_last()<CR>", { noremap = true, silent = true, desc = "DAP: Run last" }},
      {"<leader>du", ":lua require\"dapui\".toggle()<CR>", { noremap = true, silent = true, desc = "DAP: Toggle UI" }},
    },
  },
}
