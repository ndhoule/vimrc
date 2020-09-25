" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

" Built-in tree-sitter APIs are only available on NeoVim 0.5+.
if !has('nvim-0.5')
  finish
endif

"# Configuration

"## Treesitter

" Only replace vim-polyglot with neovim-treesitter for a subset of filetypes. Once treesitter has
" support for more languages (e.g. TSX), this list should be replaced with ensure_installed = "all".
lua <<EOF
  local tree_sitter = require 'nvim-treesitter.configs'

  tree_sitter.setup {
    ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "cpp",
      "css",
      "dart",
      "fennel",
      "go",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "ocaml",
      "ocaml_interface",
      "php",
      "python",
      "regex",
      "rst",
      "ruby",
      "rust",
      "toml",
    },
    highlight = {
      enable = true,
    },
  }
EOF
