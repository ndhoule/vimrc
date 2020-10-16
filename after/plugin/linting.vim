" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Configuration

" Explicitly configure all linters. To override linters on a per-project basis, create a
" `.projections.json` file (see `./projectionist.vim` for more details).
let g:ale_linters_explicit = 1

let g:ale_linters = {
      \   'go': ['golint', 'govet'],
      \   'html': ['tidy'],
      \   'javascript': ['eslint'],
      \   'markdown': [],
      \   'sh': ['shellcheck'],
      \   'typescript': ['eslint'],
      \ }

" Decrease delay before running linter after text change
let g:ale_lint_delay = 100

" When available, use eslint_d for faster linting and fixing. (eslint_d delegates to project-local
" eslint installations.)
if executable('eslint_d')
  let g:ale_javascript_eslint_executable = 'eslint_d'
  let g:ale_javascript_eslint_use_global = 1
endif

"# Styling

"## Error Format

let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s %(code) %[%severity%]'

"## Sign Column

" Don't hide sign column when there are no lint errors (prevents text from jumping visually)
let g:ale_sign_column_always = 1

let g:ale_sign_info = '➤'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'

" ALE signs default to different, ugly colors. Make them less bright and more consistent
highlight link ALEInfoSign todo
highlight link ALEWarningSign todo
highlight link ALEErrorSign todo

"# Keybindings

nmap <silent> <Leader>en <Plug>(ale_next_wrap)
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
