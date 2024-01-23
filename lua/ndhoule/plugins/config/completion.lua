return {
  -- TODO(ndhoule): Configure snippets
  {
    "https://github.com/L3MON4D3/LuaSnip",
    lazy = true,
  },

  {
    "https://github.com/saadparwaiz1/cmp_luasnip",
    dependencies = { "https://github.com/L3MON4D3/LuaSnip" },
    build = jit.os:find("Windows") and nil or "make install_jsregexp",
    lazy = true,
  },

  {
    "https://github.com/hrsh7th/cmp-buffer",
    lazy = true,
  },

  {
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },

  {
    "https://github.com/hrsh7th/cmp-path",
    lazy = true,
  },

  {
    "https://github.com/rcarriga/cmp-dap",
    dependencies = { "https://github.com/hrsh7th/nvim-cmp" },
    lazy = true,
  },

  {
    "https://github.com/davidsierradz/cmp-conventionalcommits",
    lazy = true,
  },

  {
    "https://github.com/petertriho/cmp-git",
    dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
    lazy = true,
    opts = {},
  },

  {
    "https://github.com/hrsh7th/nvim-cmp",
    dependencies = {
      "https://github.com/davidsierradz/cmp-conventionalcommits",
      "https://github.com/hrsh7th/cmp-buffer",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/hrsh7th/cmp-path",
      "https://github.com/onsails/lspkind.nvim",
      "https://github.com/petertriho/cmp-git",
      "https://github.com/saadparwaiz1/cmp_luasnip",
      "https://github.com/windwp/nvim-autopairs",
    },
    lazy = true,
    event = "InsertEnter",
    init = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
    end,
    config = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local lspkind = require("lspkind")

      local window_opts = {
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            ellipsis_char = "…",
            maxwidth = 100,
          }),
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
          { name = "luasnip", priority = 30 },
          { name = "buffer", priority = 20 },
          { name = "path", priority = 10 },
        }),
        window = {
          completion = cmp.config.window.bordered(window_opts),
          documentation = cmp.config.window.bordered(window_opts),
        },
      })

      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = cmp.config.sources({ { name = "dap" } }),
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources(
          { { name = "git" } },
          { { name = "conventionalcommits" } },
          { { name = "buffer" } }
        ),
      })

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
