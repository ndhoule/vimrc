augroup ndhoule_color
  autocmd!
augroup END

"
" Config.
"

set background=dark
colorscheme base16-default

"
" Highlight trailing whitespace.
"

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed

" Highlight on file load
autocmd BufRead * match ExtraWhitespace /\s\+$/

" Highlight after leaving insert mode
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
