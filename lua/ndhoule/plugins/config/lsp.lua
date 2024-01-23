-- https://langserver.org/
-- https://microsoft.github.io/language-server-protocol/
-- :help lsp
return {
  {
    "https://github.com/folke/neodev.nvim",
    lazy = true,
    opts = {
      plugins = true,
      types = true,
    },
  },

  {
    "https://github.com/b0o/SchemaStore.nvim",
    lazy = true,
  },

  {
    "https://github.com/folke/neoconf.nvim",
    lazy = true,
    opts = {
      import = {
        vscode = true,
        coc = false,
        nlsp = false,
      },
    },
  },

  {
    "https://github.com/neovim/nvim-lspconfig",
    dependencies = {
      "https://github.com/folke/neoconf.nvim",
      "https://github.com/folke/neodev.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/nvimtools/none-ls.nvim",

      -- Not a hard dependency, but must be loaded before lspconfig loads
      "https://github.com/williamboman/mason-lspconfig.nvim",
    },
    lazy = true,
    event = "User LazyFile",
    config = function()
      ---------------------------
      -- General Configuration --
      ---------------------------
      local cmp_lsp = require("cmp_nvim_lsp")
      local lspconfig = require("lspconfig")
      local null_ls = require("null-ls")
      local util = require("lspconfig.util")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          local format_opts = {
            filter = function(client)
              return client.name ~= "tsserver" and client.name ~= "vtsls"
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
          vim.keymap.set("n", "<Space>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
          vim.keymap.set("n", "<Space>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
          vim.keymap.set("n", "<Space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, keymap_opts)
          vim.keymap.set("n", "<Space>D", vim.lsp.buf.type_definition, keymap_opts)
          vim.keymap.set("n", "<Space>rn", vim.lsp.buf.rename, keymap_opts)
          vim.keymap.set({ "n", "v" }, "<Space>ca", vim.lsp.buf.code_action, keymap_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
          vim.keymap.set("n", "<Space>f", function()
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
      lspconfig.denols.setup({
        capabilities,
        -- By default, the presence of a `.git` directory activates denols on JavaScript and
        -- TypeScript buffers. That means if you're working on a TS/JS file in a non-Deno project,
        -- denols will inappropriately activate.
        --
        -- TODO(ndhoule): Investigate folke/neoconf.nvim as an alternative to setting this globally
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
        single_file_support = false,
      })
      lspconfig.dockerls.setup({ capabilities })
      lspconfig.eslint.setup({
        capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
      lspconfig.html.setup({ capabilities })
      lspconfig.jsonls.setup({
        capabilities,
        on_new_config = function(config)
          -- Lazy load schemastore.nvim
          local schemastore = require("schemastore")

          config.settings.json.schemas = config.settings.json.schemas or {}
          vim.list_extend(config.settings.json.schemas, schemastore.json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
          },
        },
      })
      lspconfig.lua_ls.setup({ capabilities })
      lspconfig.sqlls.setup({ capabilities })
      lspconfig.taplo.setup({ capabilities })
      lspconfig.terraformls.setup({ capabilities })
      lspconfig.vtsls.setup({
        capabilities,
        root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json"),
        single_file_support = false,
      })
      -- lspconfig.tsserver.setup({
      --   capabilities,
      --   flags = {
      --     -- Prevent an issue seemingly specific to tsserver where the client and server become
      --     -- desynced. This leads to stale diagnostics sticking around after they're fixed, usually
      --     -- after you've fixed the last issue in a buffer.
      --     debounce_text_changes = nil,
      --   },
      --   -- By default, the presence of a `.git` directory activates denols on JavaScript and
      --   -- TypeScript buffers. That means if you're working on a TS/JS file in e.g. a Deno project,
      --   -- tsserver will inappropriately activate.
      --   --
      --   -- TODO(ndhoule): Investigate folke/neoconf.nvim as an alternative to setting this globally
      --   root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json"),
      --   single_file_support = false,
      -- })
      lspconfig.vimls.setup({ capabilities })
      lspconfig.yamlls.setup({
        capabilities,
        on_new_config = function(config)
          -- Lazy load schemastore.nvim
          local schemastore = require("schemastore")

          config.settings.yaml.schemas = config.settings.yaml.schemas or {}
          vim.list_extend(config.settings.yaml.schemas, schemastore.yaml.schemas())
        end,
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
          },
        },
      })

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
