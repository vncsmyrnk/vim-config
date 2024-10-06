if vim.fn.executable("php") == 0 then
  return {}
end

return {
  {
    "stephpy/vim-php-cs-fixer",
    event = "BufEnter *.php",
  },
}
