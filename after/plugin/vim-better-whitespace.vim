"
" https://github.com/ntpeters/vim-better-whitespace
"

" Don't trim trailing whitespace in Markdown; trailing whitespace is a linebreak
" in GitHub-Flavored Markdown
let g:better_whitespace_filetypes_blacklist = ['markdown']

highlight ExtraWhitespace ctermbg=1
