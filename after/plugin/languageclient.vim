function SetLSPShortcuts()
  nnoremap <silent> gd    :echoerr 'Unhandled method textDocument/declaration'<CR>
  nnoremap <silent> <c-]> :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> K     :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gD    :call LanguageClient#textDocument_implementation()<CR>
  nnoremap <silent> <c-k> :call LanguageClient#textDocument_signatureHelp()<CR>
  nnoremap <silent> 1gD   :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <silent> gr    :call LanguageClient#textDocument_references()<CR>
endfunction

function ConfigureLSP()
  " Required for operations modifying multiple buffers like rename
  set hidden

  " Always display the signcolumn to prevent jumping when signs are drawn
  set signcolumn=yes

  let g:LanguageClient_changeThrottle = 0.50
  let g:LanguageClient_hoverPreview = 'Always'

  " Disable diagnostics (e.g. linter errors, compiler errors) support; handle this through ALE
  let g:LanguageClient_diagnosticsEnable = 0

  let g:LanguageClient_rootMarkers = {
        \ 'javascript': ['.flowconfig', 'package.json'],
        \ 'javascriptreact': ['.flowconfig', 'package.json'],
        \ }

  let g:LanguageClient_serverCommands = {
        \ 'css':             ['css-languageserver', '--stdio'],
        \ 'dockerfile':      ['docker-langserver', '--stdio'],
        \ 'javascript':      ['flow', 'lsp'],
        \ 'javascriptreact': ['flow', 'lsp'],
        \ 'json':            ['json-languageserver', '--stdio'],
        \ 'less':            ['css-languageserver', '--stdio'],
        \ 'sass':            ['css-languageserver', '--stdio'],
        \ 'typescript':      ['typescript-language-server', '--stdio'],
        \ 'typescriptreact': ['typescript-language-server', '--stdio'],
        \ 'vim':             ['vim-language-server', '--stdio'],
        \ }
endfunction

if !has('nvim-0.5')
  call ConfigureLSP()

  augroup LSP
    autocmd!
    autocmd FileType css,dockerfile,javascript,javascriptreact,json,less,sass,typescript,typescriptreact,vim call SetLSPShortcuts()
  augroup END
endif
