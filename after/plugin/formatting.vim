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
      \   'go': ['gofmt'],
      \   'html': ['prettier'],
      \   'javascript': ['eslint'],
      \   'markdown': ['remove_trailing_lines'],
      \   'sh': ['shfmt'],
      \   'typescript': ['eslint'],
      \ }

" Reset shfmt configuration to defaults. By default, ALE will use your editor's shiftwidth/tabstob
" settings as the `-i` flag to shfmt; this means shfmt will format files depending on a user's
" _personal_ configuration (rather than a shared configuration), which eliminates the purpose of a
" standardized formatter.
"
" ALE checks if this is an empty value (which includes an empty string), so this must be a space.
let g:ale_sh_shfmt_options = ' '
