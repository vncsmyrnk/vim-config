if vim.fn.executable("go") == 0 then
  return {}
end

return {
  { "leoluz/nvim-dap-go" },

  {
    "fatih/vim-go",
    build = ":GoInstallBinaries",
  }
}
