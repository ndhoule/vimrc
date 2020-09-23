" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Keybindings

nmap <silent> <leader><Tab> :Vista<CR>

"# Configuration

let g:vista_executive_for = {
      \   'Dockerfile': 'nvim_lsp',
      \   'css': 'nvim_lsp',
      \   'javascript': 'nvim_lsp',
      \   'javascriptreact': 'nvim_lsp',
      \   'typescript': 'nvim_lsp',
      \   'typescriptreact': 'nvim_lsp',
      \   'vim': 'nvim_lsp',
      \ }
