" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

" Colorize's built-in auto-colorization doesn't work consistently
" https://github.com/chrisbra/Colorizer/issues/77
augroup AutoColorize
  autocmd!
  autocmd
        \ BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew
        \ *.css,*.html,*.js,*.jsx,*.sass,*.scss,*.ts,*.tsx,*.tpl
        \ ColorHighlight
augroup END

"# Configuration

"## Treesitter

if g:ENABLE_TREESITTER
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
        "tsx",
        "typescript",
      },
      highlight = {
        enable = true,
      },
    }
EOF
endif
