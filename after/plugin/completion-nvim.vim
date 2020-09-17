""
" https://github.com/nvim-lua/completion-nvim
""

if has('nvim-0.5')
  finish
endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

autocmd BufEnter * lua require'completion'.on_attach()
