""
" vim-plug
"
" https://github.com/junegunn/vim-plug
""

let s:plug_vim_path = g:DOTVIM_PATH . '/autoload/plug.vim'
let s:plugins_path = g:DOTVIM_PATH . '/vendor'

" Install vim-plug if not present
if empty(glob(s:plug_vim_path))
  execute "silent !curl -fLo " . s:plug_vim_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync
endif

" Load vim-plug
call plug#begin(s:plugins_path)

""
" Plugins
""

" Core behavior
Plug 'tpope/vim-sensible'

Plug 'bfredl/nvim-miniyank'            " Add a killring
Plug 'dietsche/vim-lastplace'          " Reopen files in the same location
Plug 'ntpeters/vim-better-whitespace'  " Highlight trailing whitespace, with support for blacklisting filetypes
Plug 'tpope/vim-endwise'               " Automatically close word control structures (if/fi, do/end, etc.)
Plug 'tpope/vim-repeat'                " Add support for `.` (repeat) for plugins

" Project navigation
" TODO(ndhoule): Document fzf installation
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'  " Fuzzy file finder and file contents searcher
Plug 'majutsushi/tagbar'                             " Menu for navigating ctags

" UI
Plug 'itchyny/lightline.vim'  " Customize statusline

" New core commands
Plug 'EinfachToll/DidYouMean'  " Suggest alternatives when opening a misspelled file (e.g. `index.j`)
Plug 'mtth/scratch.vim'        " Open a scratch buffer (clone of emacs functionality)
Plug 'vim-scripts/Rename'      " Rename a file

" Motions
Plug 'christoomey/vim-sort-motion'  " Add motions for sorting within a line or range of lines
Plug 'gcmt/wildfire.vim'            " Add motions for expanding a visual cursor within a group
" TODO(ndhoule): start using or remove (alt: https://github.com/junegunn/vim-easy-align)
Plug 'godlygeek/tabular'            " Align text
Plug 'tomtom/tcomment_vim'          " Add motions for commenting out blocks of code
Plug 'tpope/vim-surround'           " Add mappings for working on text within pairs of characters (e.g. quotes)

" Linting/autofixing
Plug 'w0rp/ale'  " Integrate with linters, fixers, formatters, etc.

" Documentation
Plug 'ndhoule/investigate.vim'  " Open documentation at point (using Dash, browser, shell command, etc.)

" Git
Plug 'airblade/vim-gitgutter'  " Show Git diff in sign column and add mappings for working with hunks
Plug 'tpope/vim-fugitive'      " Add vim commands for Git operations
Plug 'tpope/vim-rhubarb'       " Add GitHub integration to fugitive

" Environment
Plug 'direnv/direnv.vim'  " Source direnv files, keeping vim environment/subshells in sync with host shell env

" Project settings
Plug 'editorconfig/editorconfig-vim'  " Add integration for .editorconfig files
Plug 'tpope/vim-projectionist'        " Add support for project configuration files ('projections')

" Text editing
Plug 'Raimondi/delimitMate'  " Insert matching pairs of characters in insert mode (e.g. (), [], '')

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/
function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    " Install compiled LanguageClient-neovim binary
    !./install.sh
    " Update neovim remote plugin manifest
    UpdateRemotePlugins
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'tag': '0.1.120',
      \ 'do': function('InstallLanguageClientDeps'),
      \ }

" Syntax highlighting
Plug 'luochen1990/rainbow'              " Hightlight pairs of characters with different colors
Plug 'nathanaelkane/vim-indent-guides'  " Change background color to highlight indentation levels
Plug 'sheerun/vim-polyglot'             " Install syntax files (and language plugins) for most languages

" Completion
Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'  " Autocompletion engine
Plug 'ncm2/ncm2-bufword'                   " ncm2 plugin for completing words present in current buffer
Plug 'ncm2/ncm2-path'                      " ncm2 plugin for completing file paths
Plug 'ncm2/ncm2-tmux'                      " ncm2 plugin for completing words present in tmux buffers

" Cross-platform support
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'  " Improve vim + iTerm2 + tmux interop
endif

" theming
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

" utility libraries
Plug 'dbakker/vim-projectroot'  " Add functions for finding the current project's root directory path

" Finalize loading vim-plug
call plug#end()
