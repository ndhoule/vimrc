-- https://langserver.org/
-- https://microsoft.github.io/language-server-protocol/
-- :help lsp
return {
  {
    "https://github.com/folke/neodev.nvim",
    opts = {
      plugins = true,
      types = true,
    },
  },

  -- TODO(ndhoule): This configuration has gotten a little crazy, is it possible to simplify it?
  --                I'm sure it's possible to crib from the lsp readme or from a setup like e.g. AstroNvim
  {
    "https://github.com/neovim/nvim-lspconfig",
    dependencies = {
      "https://github.com/folke/neodev.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/nvimtools/none-ls.nvim",

      -- Not a hard dependency per se, but must be loaded before lspconfig loads
      "https://github.com/williamboman/mason-lspconfig.nvim",
    },
    config = function()
      ---------------------------
      -- General Configuration --
      ---------------------------
      local cmp_lsp = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")
      local null_ls = require("null-ls")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local format_opts = {
            filter = function(client)
              return client.name ~= "tsserver"
            end,
            timeout_ms = 5000,
          }

          -- Set up buffer-local key mappings when LSP is available
          local keymap_opts = { buffer = event.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, keymap_opts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, keymap_opts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, keymap_opts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, keymap_opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, keymap_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format(vim.tbl_extend("force", { async = true }, format_opts))
          end, keymap_opts)

          -- Format the buffer on save when supported by the attached server(s)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function()
                vim.lsp.buf.format(vim.tbl_extend("force", { async = false }, format_opts))
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

      lspconfig.bashls.setup({ capabilities })
      lspconfig.cssls.setup({ capabilities })
      lspconfig.dockerls.setup({ capabilities })
      lspconfig.eslint.setup({
        capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
      lspconfig.html.setup({ capabilities })
      lspconfig.sqlls.setup({ capabilities })
      lspconfig.lua_ls.setup({ capabilities })
      lspconfig.terraformls.setup({ capabilities })
      lspconfig.tsserver.setup({ capabilities })
      lspconfig.vimls.setup({ capabilities })
      lspconfig.yamlls.setup({ capabilities })
      null_ls.setup({
        capabilities,
        sources = {
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
  },

  {
    "https://github.com/kosayoda/nvim-lightbulb",
    lazy = true,
    event = "LspAttach",
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
