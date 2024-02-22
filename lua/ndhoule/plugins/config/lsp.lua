-- https://langserver.org/
-- https://microsoft.github.io/language-server-protocol/
-- :help lsp
return {
  {
    "https://github.com/folke/neodev.nvim",
    lazy = true,
    opts = {
      plugins = {
        "neotest",
        "nvim-treesitter",
        "plenary.nvim",
        "telescope.nvim",
      },
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
      "https://github.com/williamboman/mason.nvim",
    },
    lazy = false,
    opts = function()
      local root_pattern = require("ndhoule.utils").root_pattern

      return {
        format = {
          timeout_ms = 5000,
        },
        servers = {
          denols = {
            opts = {
              -- By default, the presence of a `.git` directory activates denols for JS/TS buffers;
              -- this will inappropriately activate denols in any git-controlled JS/TS project, which
              -- might be a Node/Bun/etc. project.
              root_dir = root_pattern("deno.json", "deno.jsonc"),
            },
          },

          eslint = {
            opts = {
              on_attach = function(client)
                -- HACK(ndhoule): Neovim >= 0.10 is required to dynamically register and deregister
                -- formatters. (In Neovim 0.10+, the below settings should take care of this.)
                if vim.fn.has("nvim-0.10") == 0 then
                  client.server_capabilities.documentFormattingProvider = true
                  client.server_capabilities.documentRangeFormattingProvider = true
                end
              end,
              settings = {
                workingDirectories = {
                  mode = "auto",
                },
              },
            },
          },

          gopls = {
            opts = {
              on_attach = function(client)
                -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
                if not client.server_capabilities.semanticTokensProvider then
                  local semantic = client.config.capabilities.textDocument.semanticTokens
                  client.server_capabilities.semanticTokensProvider = {
                    full = true,
                    legend = {
                      tokenModifiers = semantic.tokenModifiers,
                      tokenTypes = semantic.tokenTypes,
                    },
                    range = true,
                  }
                end
              end,
              settings = {
                analyses = {
                  fieldalignment = true,
                  unusedwrite = true,
                  useany = true,
                },
                directoryFilters = { "-.git", "-.vscode", "-.vscode-test", "-node_modules" },
                semanticTokens = true,
              },
            },
          },

          golangci_lint_ls = {
            -- TODO(ndhoule): Unfortunately, golangci-lint-langserver doesn't support the
            -- textDocument/formatting LSP method. It would be great to be able to format the
            -- current buffer ad hoc using `vim.lsp.buf.format` like most other langservers
          },

          jsonls = {
            opts = {
              on_new_config = function(config)
                local schemastore = require("schemastore")

                config.settings.json.schemas =
                  vim.tbl_deep_extend("force", config.settings.json.schemas or {}, schemastore.json.schemas())
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
            },
          },

          lua_ls = {
            opts = {
              on_attach = function(client)
                -- HACK(ndhoule): Neovim >= 0.10 is required to dynamically register and deregister
                -- formatters. (In Neovim 0.10+, the below settings should take care of this.)
                if vim.fn.has("nvim-0.10") == 0 then
                  client.server_capabilities.documentFormattingProvider = false
                  client.server_capabilities.documentRangeFormattingProvider = false
                end
              end,
              Lua = {
                format = {
                  enable = false,
                },
              },
            },
          },

          tsserver = {
            opts = {
              on_attach = function(client)
                -- HACK(ndhoule): typescript-tools seemingly doesn't support disabling tsserver's
                -- formatting functionality
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
              -- By default, the presence of a `.git` directory activates tsserver for JS/TS
              -- buffers; this will inappropriately activate tsserver in any git-controlled JS/TS
              -- project, which might be e.g. a Deno project.
              root_dir = root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
              settings = {
                completions = {
                  completeFunctionCalls = true,
                },
                javascript = {
                  format = {
                    enable = false,
                  },
                },
                typescript = {
                  format = {
                    enable = false,
                  },
                },
              },
              single_file_support = false,
            },
          },

          yamlls = {
            opts = {
              capabilities = {
                textDocument = {
                  -- Add support for linewise folding
                  foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true,
                  },
                },
              },
              on_attach = function(client)
                -- HACK(ndhoule): Neovim >= 0.10 is required to dynamically register and deregister formatters
                if vim.fn.has("nvim-0.10") == 0 then
                  client.server_capabilities.documentFormattingProvider = true
                end
              end,
              -- Lazy load schemastore.nvim
              on_new_config = function(config)
                local schemastore = require("schemastore")

                config.settings.yaml.schemas =
                  vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, schemastore.yaml.schemas())
              end,
              settings = {
                redhat = {
                  telemetry = {
                    enabled = false,
                  },
                },
                yaml = {
                  format = {
                    enable = true,
                  },
                  keyOrdering = false,
                  schemaStore = {
                    -- Disable built-in schema store to prefer schemas from schemastore.nvim
                    enable = false,
                    -- Fix for an unguarded length check in yaml-language-server
                    url = "",
                  },
                },
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      ---------------------------
      -- General Configuration --
      ---------------------------
      local cmp_lsp = require("cmp_nvim_lsp")
      local mason_lspconfig = require("mason-lspconfig")
      local null_ls = require("null-ls")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Set up buffer-local key mappings when LSP is available
          local keymap_opts = { buffer = event.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, silent = true })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, silent = true })
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
        end,
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      })

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      mason_lspconfig.setup_handlers({
        function(server_name)
          local server = opts.servers[server_name] or {}
          local base_opts = server.opts or {}

          local server_opts = vim.tbl_deep_extend("force", {
            capabilities = vim.deepcopy(capabilities),
          }, base_opts)
          local setup = server.setup or require("lspconfig")[server_name].setup

          setup(server_opts)
        end,
      })

      null_ls.setup({
        capabilities,
        sources = {
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.yamllint,
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
    config = false,
  },

  {
    "https://github.com/stevearc/conform.nvim",
    version = "*",
    lazy = true,
    event = "BufWritePre",
    cmd = "ConormInfo",
    keys = {
      {
        "<Space>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format the current buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        hcl = function(bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("nomad.hcl$") then
            -- HACK(ndhoule) nomad_fmt adds a trailing newline to the end of the file on each
            -- format, even if one is already present. Use trim_newlines to remove it
            return { "nomad_fmt", "trim_newlines" }
          elseif bufname:match("pkr.hcl$") then
            return { "packer_fmt" }
          elseif bufname:match(".tf$") or bufname:match(".tf.hcl$") then
            return { "terraform_fmt" }
          else
            return {}
          end
        end,
        lua = { "stylua" },
        sh = { "shfmt" },
        sql = { "sql_formatter" },
        terraform = { "terraform_fmt" },
        ["*"] = { "trim_newlines" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local file_pattern_blacklist = { "/node_modules/", "/.git/" }
        for _, pattern in ipairs(file_pattern_blacklist) do
          if bufname:match(pattern) then
            return
          end
        end

        return {
          lsp_fallback = true,
          timeout_ms = 5000,
        }
      end,
      formatters = {
        nomad_fmt = {
          meta = {
            url = "https://developer.hashicorp.com/nomad/docs/commands/fmt",
            description = "The nomad fmt Nomad command is used to format HCL2 configuration files to a canonical format and style.",
          },
          command = "nomad",
          args = { "fmt", "-" },
        },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
  },
}
