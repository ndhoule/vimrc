--
-- Configuration
--

vim.g.lightline = {
  active = {
    left =  {{'mode', 'paste'}, {'readonly', 'filename'}},
    right = {{'lineinfo'}, {'percent'}, {'fileformat', 'fileencoding', 'filetype'}},
  },
  component_function = {
    filename = 'LightlineFilename',
  },
}

-- Retrieve the current file's path. If the file is within a project (e.g. a git repository), return
-- a filename relative to that root; otherwise, return the full file path.
vim.cmd([[
function! LightlineFilename()
  let l:filename = expand('%:p')
  if l:filename ==# ''
    return '[No Name]'
  endif

  let l:project_root = projectroot#get()
  if l:project_root !=# ''
    let l:filename = substitute(l:filename, l:project_root . '/', '', '')
  endif

  return l:filename . (&modified ? ' +' : '')
endfunction
]])
