if vim.fn.executable("php") == 0 then
  return {}
end

return {
  {
    "stephpy/vim-php-cs-fixer",
    ft = "php",
    enabled = false,
    config = function()
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.php",
        callback = function()
          vim.cmd([[silent! call PhpCsFixerFixFile()]])
        end,
      })
    end,
  },
}
