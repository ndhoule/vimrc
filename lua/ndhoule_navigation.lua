--
-- Configuration
--

--Fuzzy Searching

vim.g.fzf_layout = {down = '~20%'}

vim.cmd('command! ProjectFiles execute "Files" ProjectRootGuess()')
vim.cmd('command! RelFiles execute "Files" expand("%:p:h")')

-- If available, use `ag` as fzf's backend
if vim.fn.executable('ag') then
  vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
end

vim.cmd('command! -bang -nargs=* Ag call fzf#vim#ag( <q-args>, b:fzf_default_options, <bang>0)')
vim.cmd('command! -bang -nargs=* Agp call fzf#vim#ag(<q-args>, "--hidden", {"dir": ProjectRootGuess()}, <bang>0)')
vim.cmd('command! -bang -nargs=* Agr call fzf#vim#ag( <q-args>, "--hidden", {"dir": fnamemodify(expand(<q-args>), ":p:h")}, <bang>0)')

-- File Tree

-- Show hidden files by default
vim.g.NERDTreeShowHidden = true

--
-- Keybindings
--

-- Open the current file in the tree relative to the project root (requires dbakker/vim-projectroot).
vim.cmd('nnoremap <silent> <Leader>n :ProjectRootExe NERDTreeFind<cr>')

-- Search for files relative to the project root
vim.cmd('map <silent> <leader>t :ProjectFiles<CR>')

-- Search for files relative to the current file
vim.cmd('map <silent> <leader>T :RelFiles<CR>')

-- Search file contents relative to the project root
vim.cmd('map <leader>/ :Agp<CR>')

-- Search file contents relative to the current file
vim.cmd('map <leader>? :Agr<CR>')
