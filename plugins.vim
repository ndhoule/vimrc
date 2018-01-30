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

" TODOs:
" - Re-enable 'heavenshell/vim-jsdoc'?
" - rainbow not working very well
" - add more completion plugins
" - add jump to def keyboard shortcuts
" - investigate html plugins (vim-ragtag, emmet, etc.)
" - look into paredit
" - look into numbers.vim
" - add sideways.vim or vim-swap
" - markdown previewer plugin
" - Look into deoplete plugins
" - deoplete plugin sorting/ranking
" - If fzf is not installed globally, install it or log a warning
" - Locate fzf dynamically for use on e.g. Linux?

" Utilities

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'bfredl/nvim-miniyank'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'guns/xterm-color-table.vim'
Plug 'haya14busa/incsearch.vim'
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Rename'
Plug 'w0rp/ale'

" Language Server Protocol
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/

" TODO(ndhoule): Should run :UpdateRemotePlugins
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

" TODO(ndhoule): Install language clients locally?
"
" - https://github.com/sourcegraph/javascript-typescript-langserver
" - https://github.com/flowtype/flow-language-server
" - https://github.com/rcjsuen/dockerfile-language-server-nodejs
" - https://github.com/vscode-langservers/vscode-css-languageserver-bin
" - https://github.com/vscode-langservers/vscode-json-languageserver-bin
"
" - yarn global add \
"   javascript-typescript-langserver \
"   flow-language-server \
"   dockerfile-language-server-nodejs \
"   vscode-json-languageserver-bin
"
" TODO(ndhoule)): Try out:
" - https://github.com/vscode-langservers/vscode-html-languageserver-bin
"

" Filetypes

Plug 'sheerun/vim-polyglot', { 'do:': 'gometalinter --install --update' }

" Completion

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'

" OS-Specific
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" Themes
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

call plug#end()
