"# Configuration for Vista.vim (https://github.com/liuchengxu/vista.vim)

"## Configuration

let g:vista_executive_for = {
      \   'Dockerfile': 'nvim_lsp',
      \   'css': 'nvim_lsp',
      \   'javascript': 'nvim_lsp',
      \   'javascriptreact': 'nvim_lsp',
      \   'typescript': 'nvim_lsp',
      \   'typescriptreact': 'nvim_lsp',
      \   'vim': 'nvim_lsp',
      \ }

"## Keybindings

nmap <silent> <leader><Tab> :Vista<CR>
