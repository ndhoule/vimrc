""
" https://github.com/nvim-treesitter/nvim-treesitter
""

if !has('nvim-0.5')
  finish
endif

" Only replace vim-polyglot with neovim-treesitter for a subset of filetypes. nvim-treesitter is
" still experimental (the neovim treesitter API is subject to change until 0.5 becomes stable) and
" while it's surprisingly stable for alpha software, there are still some circumstances it doesn't
" handle well. (E.g.: It segfaults when editing an empty file. Oops.)
" TODO(ndhoule): as of 73a826, nvim-treesitter supports TypeScript but not TSX. vim-polyglot won't
" let you disable TSX files only (it's TS+TSX or nothing).
let g:polyglot_disabled = ['javascript', 'json']

lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "json", "regex" },
    highlight = {
      enable = true,
    },
  }
EOF
