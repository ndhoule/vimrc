""
" vim-plug
"
" https://github.com/junegunn/vim-plug
""

let s:plug_vim_path = g:DOTVIM_PATH . '/autoload/plug.vim'
let s:plugins_path = g:DOTVIM_PATH . '/vendor'

" Install vim-plug if nonexistent
if empty(glob(s:plug_vim_path))
  execute "silent !curl -fLo " . s:plug_vim_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync
endif

" Load vim-plug
call plug#begin(s:plugins_path)

""
" Plugins
""

" Utilities

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'benmills/vimux'
Plug 'bfredl/nvim-miniyank'
Plug 'christoomey/vim-sort-motion'
Plug 'dietsche/vim-lastplace'
Plug 'direnv/direnv.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'guns/xterm-color-table.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'kana/vim-fakeclip'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mtth/scratch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ndhoule/investigate.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Rename'
Plug 'w0rp/ale'

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/

function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
    UpdateRemotePlugins
  endif

  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    " https://www.npmjs.com/package/dockerfile-language-server-nodejs
    !npm -g install dockerfile-language-server-nodejs@0.0.18
    " https://www.npmjs.com/package/flow-language-server
    !npm -g install flow-language-server@0.6.0
    " https://www.npmjs.com/package/typescript-language-server
    !npm -g install typescript-language-server@0.2.0
    " https://www.npmjs.com/package/vscode-css-languageserver-bin
    !npm -g install vscode-css-languageserver-bin@1.4.0
    " https://www.npmjs.com/package/vscode-json-languageserver-bin
    !npm -g install vscode-json-languageserver-bin@1.0.1
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'tag': '0.1.120', 'do': function('InstallLanguageClientDeps') }

" Filetypes

Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot', { 'do:': 'gometalinter --install --update' }

" Completion

Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'

" OS

if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" Themes
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details

Plug 'chriskempson/base16-vim'

" Finalize loading vim-plug
call plug#end()
