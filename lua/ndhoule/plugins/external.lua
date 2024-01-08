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
    build = ":MasonUpdate",
    lazy = false, -- TODO(ndhoule): Consider loading lazily
    opts = {
      -- TODO(ndhoule): Install packages

      -- TODO(ndhoule): Configure me
      ui = {
        check_outdated_packages_on_open = false,
        border = "rounded",
      },
    },
  },

  {
    "https://github.com/williamboman/mason-lspconfig.nvim",
    dependencies = {
      "https://github.com/neovim/nvim-lspconfig",
      "https://github.com/williamboman/mason.nvim",
    },
    lazy = false, -- TODO(ndhoule): Consider loading lazily?
    opts = {
      -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      ensure_installed = {
        "ansiblels",
        "bashls",
        "clangd",
        "cssls",
        "cssmodules_ls",
        "denols",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "sqls",
        "stylelint_lsp",
        "svelte",
        "tailwindcss",
        "taplo",
        "terraformls",
        "tflint",
        "tsserver", -- TODO(ndhoule): Try out "vtsls",
        "vimls",
        "vuels",
        "yamlls",
      },
      automatic_installation = true,
    },
  },
}
