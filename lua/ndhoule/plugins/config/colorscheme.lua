return {
  {
    "https://github.com/sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_float_style = "dim"

      vim.cmd.colorscheme("sonokai")
    end,
  },
}
