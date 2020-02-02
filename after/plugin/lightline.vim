let g:lightline = {
      \   'active': {
      \     'left':  [['mode', 'paste'],
      \               ['readonly', 'filename']],
      \     'right': [['lineinfo'],
      \               ['percent'],
      \               ['fileformat', 'fileencoding', 'filetype']]
      \   },
      \   'component_function': {
      \     'filename': 'LightlineFilename',
      \   },
      \ }

function! LightlineFilename()
  let l:filename = expand('%:p')
  if l:filename ==# ''
    return '[No Name]'
  endif

  " If possible, truncate the filename so it's relative to the project root
  let l:project_root = projectroot#get()
  if l:project_root !=# ''
    let l:filename = substitute(l:filename, l:project_root . '/', '', '')
  endif

  return l:filename . (&modified ? ' +' : '')
endfunction
