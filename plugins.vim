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


" core behavior
Plug 'tpope/vim-sensible'

Plug 'bfredl/nvim-miniyank'
Plug 'dietsche/vim-lastplace'
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace' " TODO(ndhoule): still necessary?
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'


" navigation
Plug 'majutsushi/tagbar'

" ui
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

" new core commands
Plug 'EinfachToll/DidYouMean'
Plug 'mtth/scratch.vim'
Plug 'vim-scripts/Rename'

" motions
Plug 'christoomey/vim-sort-motion'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular' " TODO(ndhoule): start using or remove (alt: https://github.com/junegunn/vim-easy-align)
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" shell/jobs
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

" linting / fixing
Plug 'w0rp/ale'

" documentation
Plug 'ndhoule/investigate.vim' " TODO(ndhoule): start or remove

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" environment
Plug 'direnv/direnv.vim'

" project settings
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'

" unsorted
Plug 'Raimondi/delimitMate'

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/

function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
    UpdateRemotePlugins
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'tag': '0.1.120', 'do': function('InstallLanguageClientDeps') }

" syntax highlighting
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'

" completion
Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'

" cross-platform support
Plug 'kana/vim-fakeclip'

if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" theming
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

" utility libraries
Plug 'dbakker/vim-projectroot'

" Finalize loading vim-plug
call plug#end()
