"
" https://github.com/ntpeters/vim-better-whitespace
"

highlight ExtraWhitespace ctermbg=1

" Strip whitespace when saving files.
let g:strip_whitespace_on_save=1

" Disable the default whitespace-strip confirmation on save.
let g:strip_whitespace_confirm=0

" Don't strip whitespace on *huge* files to avoid choking Vim.
let g:strip_max_file_size=10000

" Don't trim trailing whitespace in Markdown; trailing whitespace is interpreted as a linebreak in
" GitHub-Flavored Markdown. See: https://github.github.com/gfm/#hard-line-breaks
let g:better_whitespace_filetypes_blacklist = ['markdown']
