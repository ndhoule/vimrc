return {
  {
    "https://github.com/sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_diagnostic_text_highlight = 1

      vim.cmd("colorscheme sonokai")
    end,
  },
}
