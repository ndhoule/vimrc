nnoremap <leader>git :Grepper! -tool git -open -switch<CR>
nnoremap <leader>ag :Grepper! -tool ag -open -switch -grepprg ag $* `git rev-parse --show-toplevel`<CR>
