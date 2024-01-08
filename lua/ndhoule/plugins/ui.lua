return {
  -- Add a startup dashboard
  {
    "https://github.com/goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local theme = require("alpha.themes.dashboard")

      alpha.setup(theme.config)
    end,
  },

  {
    "https://github.com/stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
  },

  {
    "https://github.com/onsails/lspkind.nvim",
    lazy = true,
  },

  -- Highlight color names (e.g. "white") and color codes (e.g. "#FFFFFF")
  {
    "https://github.com/NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "VeryLazy",
    opts = {
      filetypes = {
        css = { css = true },
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }
  },

  {
    "https://github.com/j-hui/fidget.nvim",
    version = "v1.x",
    event = "VeryLazy",
    opts = {},
  },

  {
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    version = "v3.x",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    setup = function()
      -- TODO(ndhoule): Configure rainbow-delimiters.nvim integration
      -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
      local hooks = require("ibl.hooks")

      hooks.register(
        hooks.type.ACTIVE,
        function(bufnr)
          -- Disable indent guides in very large buffers
          return not vim.b[bufnr].is_buf_large
        end
      )
    end
  },

  -- {
  --   "https://github.com/kevinhwang91/nvim-bqf",
  --   ft = "qf"
  -- },
}
