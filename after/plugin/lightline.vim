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
  " TODO(ndhoule): Format relative to project root
  let filename = expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
