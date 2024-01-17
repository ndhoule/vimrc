return {
  {
    "https://github.com/sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- One of: default | atlantis | andromeda | shusia | maia
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_float_style = "dim"

      vim.cmd.colorscheme("sonokai")
    end,
  },
}
