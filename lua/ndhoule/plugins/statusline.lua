return {
  {
    "https://github.com/nvim-lualine/lualine.nvim",
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
    lazy = true,
    event = "BufEnter",
    opts = {
      options = {
        theme = "sonokai",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 4 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
