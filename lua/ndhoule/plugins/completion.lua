return {
  -- TODO(ndhoule): Configure snippets
  {
    "https://github.com/L3MON4D3/LuaSnip",
    lazy = true
  },

  {
    "https://github.com/saadparwaiz1/cmp_luasnip",
    dependencies = { "https://github.com/L3MON4D3/LuaSnip" },
    lazy = true
  },

  {
    "https://github.com/hrsh7th/cmp-buffer",
    lazy = true
  },

  {
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },

  {
    "https://github.com/hrsh7th/cmp-path",
    lazy = true
  },

  -- TODO(ndhoule): Revisit configuration, it works but is not yet ideal
  {
    "https://github.com/hrsh7th/nvim-cmp",
    dependencies = {
      "https://github.com/hrsh7th/cmp-buffer",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/hrsh7th/cmp-path",
      "https://github.com/onsails/lspkind.nvim",
      "https://github.com/saadparwaiz1/cmp_luasnip"
    },
    lazy = true,
    event = "InsertEnter",
    init = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
    end,
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      local window_opts = {
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            ellipsis_char = "…",
            maxwidth = 100,
          })
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 40 },
          { name = "luasnip",  priority = 30 },
          { name = "buffer",   priority = 20 },
          { name = "path",     priority = 10 },
        }),
        window = {
          completion = cmp.config.window.bordered(window_opts),
          documentation = cmp.config.window.bordered(window_opts),
        },
      })
    end,
  },
}
