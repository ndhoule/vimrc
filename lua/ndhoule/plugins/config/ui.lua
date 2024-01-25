return {
  -- Startup dashboard
  {
    "https://github.com/goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local theme = require("alpha.themes.dashboard")

      alpha.setup(theme.config)
    end,
  },

  -- Visual improvements for `vim.input` and `vim.select` UI elements
  {
    "https://github.com/stevearc/dressing.nvim",
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim" },
    lazy = true,
    opts = function()
      local utils = require("ndhoule.utils")

      local win_options = utils.config.window.bordered()

      return {
        input = {
          border = win_options.border,
        },
        select = {
          backend = { "telescope", "builtin" },
          border = win_options.border,
        },
      }
    end,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- VSCode-like iconography for LSP completion items
  {
    "https://github.com/onsails/lspkind.nvim",
    lazy = true,
  },

  -- Highlight color names (e.g. "white") and color codes (e.g. "#FFFFFF")
  {
    "https://github.com/NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "User LazyFile",
    opts = {
      filetypes = {
        css = { css = true },
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
  },

  -- LSP progress widget
  {
    "https://github.com/j-hui/fidget.nvim",
    version = "v1.x",
    event = "VeryLazy",
    opts = {},
  },

  -- Show indent guides
  {
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    version = "v3.x",
    lazy = true,
    event = "User LazyFile",
    opts = {},
    setup = function()
      -- TODO(ndhoule): Configure rainbow-delimiters.nvim integration
      -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
      local hooks = require("ibl.hooks")

      hooks.register(hooks.type.ACTIVE, function(bufnr)
        -- Disable indent guides in very large buffers
        return not vim.b[bufnr].is_buf_large
      end)
    end,
  },

  -- Highlight trailing whitespace
  {
    "https://github.com/echasnovski/mini.trailspace",
    version = "*",
    lazy = true,
    event = "User LazyFile",
    opts = {},
  },
}
