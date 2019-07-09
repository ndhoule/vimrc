"
" https://github.com/ntpeters/vim-better-whitespace
"
" This plugin is intentionally not configured to strip whitespace on save; Ale takes care of that.
"

highlight ExtraWhitespace ctermbg=1

" Don't trim trailing whitespace in Markdown; trailing whitespace is interpreted as a linebreak in
" GitHub-Flavored Markdown. See: https://github.github.com/gfm/#hard-line-breaks
let g:better_whitespace_filetypes_blacklist = ['markdown']
