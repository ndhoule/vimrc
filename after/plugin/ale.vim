"
" https://github.com/w0rp/ale
"

nmap <silent> <Leader>ef <Plug>(ale_fix)
nmap <silent> <Leader>en <Plug>(ale_next_wrap)
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_completion_enabled = 0

let g:ale_sign_column_always = 1

" Use eslint_d for faster linting and fixing; it delegates to project-local eslint installations.
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1

" Linting

" Set project-specific linters via vim-projectionist `.projections.json`:
"
" ```json
"
" {
"   "*": {
"     "linters": ["eslint", "tsserver"]
"   }
" }
" ```
augroup projectionist_set_linter
  autocmd!
  autocmd User ProjectionistActivate call s:set_linters()
augroup END

function! s:set_linters() abort
  let l:linters = projectionist#query('linters')
  " TODO(ndhoule): Support unsetting linters via empty list `[]` or `null`
  if len(l:linters) > 0
    if &filetype != ''
      " XXX(ndhoule): On dot-separated filetypes (e.g. javascript.jsx), ALE will apply all parent
      " filetype linters to this buffer. So if you're editing a javascript.jsx buffer and override all
      " linters via `b:ale_linters = {'javascript.jsx' = []}`, ALE will still leave all `javascript`
      " linters enabled. This sucks! So set the linter on the parent filetype.
      let l:filetypes = split(&filetype, "\\.")
      let l:filetype = filetypes[0]

      let b:ale_linters = {filetype: l:linters[0][1]}
    endif
  endif
endfunction

" Fixing/formatting

let g:ale_fix_on_save = 1

augroup projectionist_set_formatter
  autocmd!
  autocmd User ProjectionistActivate call s:set_fixers()
augroup END

function! s:set_fixers() abort
  let l:fixers = projectionist#query('fixers')
  if len(l:fixers) > 0 && &filetype != ''
    let l:filetypes = split(&filetype, "\\.")
    let l:filetype = filetypes[0]

    let b:ale_fixers = {filetype: l:fixers[0][1]}
  endif
endfunction
