" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Integrations

"## ALE

" Set project-specific linters and formatters in your `.projections.json`:
"
" ```json
"
" {
"   "*": {
"     "formatters": ["eslint"],
"     "linters": ["eslint", "tsserver"]
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
endfunction

function! s:set_formatters() abort
  let l:q_formatters = projectionist#query('formatters')
  if len(l:q_formatters) > 0 && &filetype != ''
    let l:formatters = l:q_formatters[0][1]
    let b:ale_fixers = {&filetype: l:formatters}
  endif
endfunction

augroup AleProjectionistIntegration
  autocmd!
  autocmd User ProjectionistActivate call s:set_formatters()
  autocmd User ProjectionistActivate call s:set_linters()
augroup END

"# Keybindings

nnoremap <Leader>aa :A<CR>
nnoremap <Leader>as :AS<CR>
nnoremap <Leader>av :AV<CR>
