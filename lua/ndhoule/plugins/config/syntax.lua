return {
  {
    "https://github.com/isobit/vim-caddyfile",
    lazy = true,
    ft = "caddyfile",
  },

  {
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "User LazyFile",
    main = "rainbow-delimiters.setup",
    opts = {},
  },
}
