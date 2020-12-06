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
      ensure_installed = "maintained",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }

    -- Highlighting in treesitter overrides the highlighting performed by the
    -- `rainbow` plugin; disable bracket/delimiter highlighting, letting rainbow
    -- handle it instead
    vim.treesitter.highlighter.hl_map.error = nil
    vim.treesitter.highlighter.hl_map["punctuation.delimiter"] = "Delimiter"
    vim.treesitter.highlighter.hl_map["punctuation.bracket"] = nil
EOF
endif
