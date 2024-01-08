return {
  -- TODO(ndhoule): Needs attention or removal, pretty much never used
  -- Menu for navigating ctags, LSP symbols, etc.
  {
    "https://github.com/liuchengxu/vista.vim",
    lazy = true,
    keys = {
      { "<leader><Tab>", ":Vista<CR>", silent = true },
    },
    init = function()
      vim.g.vista_disable_statusline = 0

      vim.g.vista_executive_for = {
        bash = "nvim_lsp",
        css = "nvim_lsp",
        dockerfile = "nvim_lsp",
        graphql = "nvim_lsp",
        html = "nvim_lsp",
        javascript = "nvim_lsp",
        javascriptreact = "nvim_lsp",
        json = "nvim_lsp",
        lua = "nvim_lsp",
        markdown = "toc",
        pandoc = "markdown",
        sql = "nvim_lsp",
        terraform = "nvim_lsp",
        typescript = "nvim_lsp",
        typescriptreact = "nvim_lsp",
        vim = "nvim_lsp",
        vimwiki = "markdown",
        yaml = "nvim_lsp",
      }
    end,
  },
}
