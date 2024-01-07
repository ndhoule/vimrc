return {
  {
    "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end
  },

  {
    "https://github.com/windwp/nvim-ts-autotag",
    lazy = true,
    opts = {
      enable_close_on_slash = false,
    }
  },

  -- TODO(ndhoule): Can this be loaded lazily?
  -- TODO(ndhoule): Revisit config, probably out of date at this point
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    dependencies = {
      "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
      "https://github.com/windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    lazy = true,
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSConfigInfo",
      "TSDisable",
      "TSEditQuery",
      "TSEditQueryUserAfter",
      "TSEnable",
      "TSInstall",
      "TSInstallFromGrammar",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSToggle",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
    },
    opts = function()
      return {
        autopairs = { enable = true },

        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },

        ensure_installed = "all",

        highlight = {
          enable = true,
          disable = function(_, bufnr)
            -- Disable highlighting in very large buffers
            return vim.b[bufnr].is_buf_large
          end,
        },

        indent = { enable = true },

        matchup = { enable = true },
      }
    end,
    init = function(plugin)
      -- https://github.com/LazyVim/LazyVim/commit/1e1b68d633d4bd4faa912ba5f49ab6b8601dc0c9
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
  },
}
