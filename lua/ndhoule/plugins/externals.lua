return {
  {
    "https://github.com/folke/lazy.nvim",
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
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    build = ":MasonUpdate",
    lazy = false,
    opts = {
      -- TODO(ndhoule): Finish configuring me
      ui = {
        check_outdated_packages_on_open = false,
        border = "rounded",
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "https://github.com/jay-babu/mason-nvim-dap.nvim",
      "https://github.com/williamboman/mason-lspconfig.nvim",
      "https://github.com/williamboman/mason.nvim",
    },
    lazy = true,
    opts = {
      -- https://mason-registry.dev/registry/list
      ensure_installed = {
        -- Linters and formatters
        -- TODO(ndhoule): Install more linters/formatters here
        "hadolint",
        "shellcheck",
        "sql-formatter",
        "stylua",

        -- Language servers
        -- TODO(ndhoule): Try out "vtsls" in place of "tsserver"
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
        "typescript-language-server",
        "vetur-vls",
        "vim-language-server",
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
