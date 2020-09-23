"# Configuration

"## Indentation Guides

" Pick indent guide colors manually (the default is generally too noisy, so here we choose more
" muted colors)
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#212121 ctermbg=236
autocmd FileType * IndentGuidesEnable

"## Whitespace

" By default, vim-better-whitespace strips extra whitespace on save. This is better handled by the
" configured formatter, so disable this behavior.
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 0

" Highlight EOL whitespace in red
highlight ExtraWhitespace ctermbg=1
