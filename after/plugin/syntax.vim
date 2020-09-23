" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

" Built-in tree-sitter APIs are only available on NeoVim 0.5+.
if !has('nvim-0.5')
  finish
endif

"# Configuration

"## Treesitter

" Only replace vim-polyglot with neovim-treesitter for a subset of filetypes. nvim-treesitter is
" still experimental (the neovim treesitter API is subject to change until 0.5 becomes stable) and
" while it's surprisingly stable for alpha software, there are still some circumstances it doesn't
" handle well. (E.g.: It segfaults when editing an empty file. Oops.)
" TODO(ndhoule): as of 73a826, nvim-treesitter supports TypeScript but not TSX. vim-polyglot won't
" let you disable TSX files only (it's TS+TSX or nothing).
let g:polyglot_disabled = ['javascript', 'json']

lua <<EOF
  local tree_sitter = require 'nvim-treesitter.configs'

  tree_sitter.setup {
    ensure_installed = { "javascript", "json", "regex" },
    highlight = {
      enable = true,
    },
  }
EOF
