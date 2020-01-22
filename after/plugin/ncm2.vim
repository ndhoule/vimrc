"
" https://github.com/ncm2/ncm2
"

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()

set completeopt=noinsert,menuone,noselect
set shortmess+=c

let g:ncm2#complete_length = [[1,3],[7,2]]

if !has('nvim-0.5')
  let g:LanguageClient_ready = 0

  augroup Ncm2LSPIntegration
    autocmd!
    autocmd User LanguageClientStarted let g:LanguageClient_ready = 1
    autocmd User LanguageClientStopped let g:LanguageClient_ready = 0
    autocmd User Ncm2Plugin call ncm2#register_source({
          \ 'name' : 'omni_LanguageClient-neovim',
          \ 'priority': 9,
          \ 'ready': g:LanguageClient_ready,
          \ 'scope': keys(g:LanguageClient_serverCommands),
          \ 'mark': 'LC',
          \ 'on_complete': ['ncm2#on_complete#omni', 'LanguageClient#complete'],
          \ })
  augroup END
endif

" TODO(ndhoule): Look into programmatically populating filetypes
if has('nvim-0.5')
  augroup Ncm2LSPIntegration
    autocmd!
    autocmd User Ncm2Plugin call ncm2#register_source({
          \ 'name' : 'omni_nvim-lsp',
          \ 'priority': 9,
          \ 'scope': [
          \   "Dockerfile",
          \   "css",
          \   "dockerfile",
          \   "javascript",
          \   "javascript.jsx",
          \   "javascriptreact",
          \   "less",
          \   "scss",
          \   "typescript",
          \   "typescript.tsx",
          \   "typescriptreact",
          \   "vim",
          \ ],
          \ 'mark': 'LC',
          \ 'on_complete': ['ncm2#on_complete#lsp'],
          \ })
  augroup END
endif
