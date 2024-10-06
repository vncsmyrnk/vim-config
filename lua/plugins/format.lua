return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- INFO: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#options
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "jq" }
      },
      format_on_save = function(bufnr)
        -- INFO: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md
        local ignore_filetypes = { "php" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return {
          timeout_ms = 500,
          lsp_format = "fallback"
        }
      end,
    },
  }
}
