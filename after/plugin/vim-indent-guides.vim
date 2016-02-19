""
" Config
""

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#212121 ctermbg=236
autocmd FileType * IndentGuidesEnable
