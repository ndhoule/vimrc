""
" https://github.com/w0rp/ale
""

"
" Keybindings
"

nmap <silent> <Leader>ef <Plug>(ale_fix)
nmap <silent> <Leader>en <Plug>(ale_next_wrap)
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)

"
" Styling
"

" Info line

let g:ale_echo_msg_format = '[%linter%] %s (%code%) [%severity%]'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

" Gutter (signs)

" Don't hide sign column when there are no lint errors (prevents text from jumping visually)
let g:ale_sign_column_always = 1

let g:ale_sign_info = '➤'
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✖'

" ALE signs default to different, ugly colors. Make them less bright and more uniform
highlight link ALEInfoSign todo
highlight link ALEWarningSign todo
highlight link ALEErrorSign todo

"
" Linter configuration
"

" TODO(ndhoule): Consider disabling all linters by default and enabling them explicitly

" Decrease delay before running linter after text change
let g:ale_lint_delay = 100

" Use eslint_d for faster linting and fixing; it delegates to project-local eslint installations.
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1

"
" Fixers/formatters configuration
"

" Enable file fixers (default off)
let g:ale_fix_on_save = 1

" Fix trailing whitespace on save.
"
" Omit Markdown buffers, where trailing whitespace is sometimes used to insert line breaks.
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'markdown': [],
      \}

"
" Projectionist integration
"

" Set project-specific linters and fixers in your `.projections.json`:
"
" ```json
"
" {
"   "*": {
"     "fixers": ["eslint"],
"     "linters": ["eslint", "tsserver"],
"     "linter_options": {
"       "eslint": "--resolve-plugins-relative-to='node_modules/@ndhoule/eslint-config'"
"     }
"   }
" }
" ```
augroup ale_projectionist_integration
  autocmd!
  autocmd User ProjectionistActivate call s:set_fixers()
  autocmd User ProjectionistActivate call s:set_linters()
augroup END

function! s:set_linters() abort
  let l:q_linters = projectionist#query('linters')
  " TODO(ndhoule): Support unsetting linters via empty list `[]` or `null`
  if len(l:q_linters) > 0 && &filetype != ''
    let l:linters = l:q_linters[0][1]
    let b:ale_linters = {&filetype: l:linters}
  endif

  let l:q_linter_options = projectionist#query('linter_options')
  if len(l:q_linter_options) > 0 && &filetype != ''
    let l:linter_options = l:q_linter_options[0][1]
    for [linter, options] in items(l:linter_options)
      let b:ale_javascript_{linter}_options = options
    endfor
  endif
endfunction

function! s:set_fixers() abort
  let l:q_fixers = projectionist#query('fixers')
  if len(l:q_fixers) > 0 && &filetype != ''
    let l:fixers = l:q_fixers[0][1]
    let b:ale_fixers = {&filetype: l:fixers}
  endif
endfunction
