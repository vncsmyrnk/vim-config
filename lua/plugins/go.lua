if vim.fn.executable("go") == 0 then
  return {}
end

return {
  { "leoluz/nvim-dap-go" },

  {
    "fatih/vim-go",
    lazy = false,
    build = ":GoInstallBinaries",
    keys = {
      { "<leader>cgF", "<cmd>GoTestFile<cr>", desc = "Go: Test file" },
      { "<leader>cgf", "<cmd>GoTestFunc<cr>", desc = "Go: Test function" },
      { "<leader>cgc", "<cmd>GoCoverage<cr>", desc = "Go: Coverage" },
    },
  },
}
