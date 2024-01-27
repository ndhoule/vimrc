return {
  {
    "https://github.com/folke/lazy.nvim.git",
    version = "10.x",
    lazy = false,
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "https://github.com/williamboman/mason.nvim",
    build = ":MasonUpdate",
    -- lazy = true,
    -- event = "VeryLazy",
    opts = {
      -- TODO(ndhoule): Finish configuring me
      ui = {
        check_outdated_packages_on_open = false,
        border = "rounded",
      },
    },
    config = function(_, opts)
      local mason = require("mason")

      mason.setup(opts)

      require("mason-lspconfig")
      require("mason-nvim-dap")
      require("mason-tool-installer")
    end,
  },

  {
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "https://github.com/williamboman/mason.nvim" },
    lazy = true,
    opts = {
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        -- Linters and formatters
        "gofumpt",
        "golangci-lint", -- golangci-lint-langserver does not include golangci-lint binary
        "hadolint",
        "shellcheck",
        "shfmt",
        "sql-formatter",
        "stylua",

        -- Language servers
        "ansible-language-server",
        "bash-language-server",
        "clangd",
        "css-lsp",
        "cssmodules-language-server",
        "deno",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "golangci-lint-langserver",
        "gopls",
        "graphql-language-service-cli",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "sqls",
        "stylelint-lsp",
        "svelte-language-server",
        "tailwindcss-language-server",
        "taplo",
        "terraform-ls",
        "tflint",
        "vetur-vls",
        "vim-language-server",
        "typescript-language-server",
        "yaml-language-server",

        -- DAP adapters
        "firefox-debug-adapter",
        "js-debug-adapter",
        "go-debug-adapter",
      },
    },
  },

  {
    "https://github.com/williamboman/mason-lspconfig.nvim",
    dependencies = { "https://github.com/williamboman/mason.nvim" },
    lazy = true,
    opts = {},
  },

  {
    "https://github.com/jay-babu/mason-nvim-dap.nvim",
    dependencies = { "https://github.com/williamboman/mason.nvim" },
    lazy = true,
    cmd = {
      "DapInstall",
      "DapUninstall",
    },
    opts = {
      handlers = {},
    },
  },
}
