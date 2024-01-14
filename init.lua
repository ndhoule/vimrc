if vim.fn.has("nvim-0.9.1") == 0 then
  vim.api.nvim_echo({
    { "This Neovim configuration requires Neovim >= 0.9.1.\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true)
  vim.fn.getchar()
  vim.cmd("quit")
  return {}
end

vim.loader.enable()

require("ndhoule").setup()
