return {
  {
    "leoluz/nvim-dap-go",
    enabled = function()
      vim.fn.executable("go")
    end,
  },

  {
    "fatih/vim-go",
    build = ":GoInstallBinaries",
    enabled = function()
      vim.fn.executable("go")
    end,
  }
}
