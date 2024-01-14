return {
  {
    "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    init = function()
      -- Perf: Skip some backward-compatibility code
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "https://github.com/windwp/nvim-ts-autotag",
    lazy = true,
    opts = {
      enable_close_on_slash = false,
    },
  },

  -- TODO(ndhoule): Can this be loaded lazily?
  -- TODO(ndhoule): Revisit config, probably out of date at this point
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    dependencies = {
      "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
      "https://github.com/windwp/nvim-ts-autotag",
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
      ensure_installed = "all",
      sync_install = false,

      autopairs = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          -- Disable highlighting in very large buffers
          return vim.b[bufnr].is_buf_large
        end,
      },
      indent = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
    },
    init = function(plugin)
      -- Perf hack
      -- https://github.com/LazyVim/LazyVim/commit/1e1b68d633d4bd4faa912ba5f49ab6b8601dc0c9
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    config = function()
      local utils = require("ndhoule.utils")

      -- Force Treesitter to re-parse the buffer when it changes. This fixes two issues, both
      -- triggered by calling vim.lsp.buf.format:
      --
      -- - wildfire.nvim freaks out and every selection is the sie of the buffer. (I think this is
      --   actually caused by poorly behaving LSP fixers that replace the entire buffer rather than
      --   providing patch changes to the LSP client.)
      -- - rainbow-delimiters reverts to an un-colored state when the buffer is formatted. (See
      --   issue: https://gitlab.com/HiPhish/rainbow-delimiters.nvim/-/issues/5)
      --
      -- This feels like driving a finish nail with a sledgehammer, and I'm sure there's a better
      -- way to solve this problem, but after 4-5 hours of research and various attempts at fixing
      -- these issues, this is the simplest and best-performing solution I found.
      local treesitter_parse = utils.throttle(utils.treesitter_parse, 50)
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "TextChangedP" }, {
        callback = function()
          treesitter_parse()
        end,
        group = vim.api.nvim_create_augroup("UserTSReparseOnChange", {}),
      })
    end,
  },
}
