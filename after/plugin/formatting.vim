" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Keybindings

nmap <silent> <Leader>ef <Plug>(ale_fix)

"# Configuration

" Fix the current buffer on save
let g:ale_fix_on_save = 1

" Fix trailing whitespace on save.
"
" Some flavors of Markdown (e.g. GitHub-Flavored Markdown) use multiple spaces at EOL to insert a
" line break.
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'markdown': ['remove_trailing_lines'],
      \ }
