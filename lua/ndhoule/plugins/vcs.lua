return {
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },

  {
    "https://github.com/tpope/vim-rhubarb",
    lazy = true,
  },

  -- Add vim commands for Git operations
  -- TODO(ndhoule): Make this match zsh git shortcuts
  {
    "https://github.com/tpope/vim-fugitive",
    dependencies = { "https://github.com/tpope/vim-rhubarb" },
    lazy = true,
    cmd = { "Git", "Gwrite" },
    keys = {
      { "<Leader>gb", ":Git blame<CR>" },
      { "<Leader>gc", ":Git commit<CR>" },
      { "<Leader>gia", ":Gwrite<CR>" },
      { "<Leader>gl", ":Git log<CR>" },
      { "<Leader>gwd", ":Git diff<CR>" },
      { "<Leader>gws", ":Git status<CR>" },
    },
  },

  -- Add vim commands for GitHub operations
  -- TODO(ndhoule): Either pay attention to this or remove it, I haven't used it much
  {
    "https://github.com/pwntester/octo.nvim",
    dependencies = {
      "https://github.com/nvim-tree/nvim-web-devicons",
      "https://github.com/nvim-telescope/telescope.nvim",
    },
    lazy = true,
    cmd = "Octo",
    config = function()
      local octo = require("octo")

      octo.setup()
    end,
    enabled = vim.fn.executable("gh") == 1,
  },
}
