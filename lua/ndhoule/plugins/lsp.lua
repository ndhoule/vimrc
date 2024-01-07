-- https://langserver.org/
-- https://microsoft.github.io/language-server-protocol/
-- :help lsp
return {
  {
    "https://github.com/folke/neodev.nvim",
    opts = {},
  },

  -- TODO(ndhoule): This configuration has gotten a little crazy, is it possible to simplify it?
  --                I'm sure it's possible to crib from the lsp readme or from a setup like e.g. AstroNvim
  {
    "https://github.com/neovim/nvim-lspconfig",
    dependencies = {
      "https://github.com/folke/neodev.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/nvimtools/none-ls.nvim",
    },
    config = function()
      ---------------------------
      -- General Configuration --
      ---------------------------
      local cmp_lsp = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Set up buffer-local key mappings when LSP is available
          local opts = { buffer = event.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          -- Format the buffer on save when supported by the attached server(s)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function(evt)
                vim.lsp.buf.format({ async = false, bufnr = evt.buf, timeout_ms = 2500 })
              end,
              group = vim.api.nvim_create_augroup("UserLspFormat", {}),
            })
          end

          local on_list = function(options)
            vim.fn.setloclist(0, {}, " ", options)
          end
          if client.server_capabilities.definitionProvider then
            vim.lsp.buf.definition({ on_list = on_list })
          end
          if client.server_capabilities.referencesProvider then
            vim.lsp.buf.references(nil, { on_list = on_list })
          end
        end,
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      })

      -- nvim-cmp supports LSP completions; advertise to LSP that we want them
      local capabilities = cmp_lsp.default_capabilities()

      local on_attach = function(client)
        -- TODO(ndhoule): Remove this if no other plugin needs to hook into on_attach
      end

      lspconfig.bashls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.cssls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.dockerls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.eslint.setup({
        capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client)
        end,
      })

      lspconfig.html.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.sqlls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.terraformls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.tsserver.setup({
        capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
          on_attach(client)
        end,
      })

      lspconfig.vimls.setup({
        capabilities,
        on_attach = on_attach,
      })

      lspconfig.yamlls.setup({
        capabilities,
        on_attach = on_attach,
      })

      local null_ls = require("null-ls")

      null_ls.setup({
        capabilities,
        on_attach = on_attach,
        sources = {
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.write_good,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),
        },
      })
    end,
  },

  {
    "https://github.com/kosayoda/nvim-lightbulb",
    lazy = true,
    event = "VeryLazy",
    opts = {
      autocmd = {
        enabled = true,
      },
      sign = {
        enabled = true,
        priority = 90,
      },
    },
  },

  {
    "https://github.com/nvimtools/none-ls.nvim",
    lazy = true,
  },
}
