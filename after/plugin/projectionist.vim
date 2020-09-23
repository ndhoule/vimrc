" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Integrations

"## ALE

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

augroup AleProjectionistIntegration
  autocmd!
  autocmd User ProjectionistActivate call s:set_fixers()
  autocmd User ProjectionistActivate call s:set_linters()
augroup END

"# Keybindings

nnoremap <Leader>aa :A<CR>
nnoremap <Leader>as :AS<CR>
nnoremap <Leader>av :AV<CR>
