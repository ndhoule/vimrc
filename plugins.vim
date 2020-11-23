" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

if &compatible
  set nocompatible
endif

function! PackInit() abort
  "# Minpac setup

  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "# Plugins

  "## Libraries

  " Add functions for finding the current project's root directory path
  call minpac#add('dbakker/vim-projectroot', {'rev': '68787126ebbbe50e120e497ff63696b22f636840'})

  "## Core behavior

  " Use a common set of vim defaults
  call minpac#add('tpope/vim-sensible')

  " Add a killring
  call minpac#add('bfredl/nvim-miniyank', {'rev': '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'})

  " Highlight trailing whitespace, with support for blacklisting filetypes
  call minpac#add('ntpeters/vim-better-whitespace', {'rev': '8cf4b2175dd61416c2fe7d3234324a6c59d678de'})

  " Automatically close word control structures (if/fi, do/end, etc.)
  call minpac#add('tpope/vim-endwise', {'rev': '97180a73ad26e1dcc1eebe8de201f7189eb08344'})

  " Add support for `.` (repeat) for plugins
  call minpac#add('tpope/vim-repeat', {'rev': 'c947ad2b6a16983724a0153bdf7f66d7a80a32ca'})

  "## New core commands

  " Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
  call minpac#add('EinfachToll/DidYouMean', {'rev': 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'})

  " Open a scratch buffer (clone of emacs functionality)
  call minpac#add('mtth/scratch.vim', {'rev': '6df617ebc0695bd9839a4fe365a08df13d24bc05'})

  " Rename the current buffer on the filesystem
  call minpac#add('vim-scripts/Rename', {'rev': '0.3'})

  "## Search

  " Make * and # work on visual selections
  call minpac#add('bronson/vim-visual-star-search', {'rev': 'e48c3fe596230e38f5a0e5313455e835c14aeb6a'})

  "## Project navigation

  " Fuzzy file finder and file contents searcher
  call minpac#add('junegunn/fzf', {
        \   'rev': '7acdaf0b4335a6c089bce5b73ff23aeb3b9d9c92',
        \   'do': {-> system('./install --bin')},
        \ })
  call minpac#add('junegunn/fzf.vim', {'rev': '53b3aea0da5e3581e224c958dbc13558cbe5daee'})

  " Menu for navigating ctags, LSP symbols, etc.
  call minpac#add('liuchengxu/vista.vim', {'rev': 'd77828b043d980b99e386840d57629f6499e9995'})

  " File navigation menu
  call minpac#add('preservim/nerdtree', {'rev': '14af89743ac1c31ff9bb43682025eda50333a7d5'})

  "## Statusline

  " Customize statusline
  call minpac#add('itchyny/lightline.vim', {'rev': '709b2d8dc88fa622d6c076f34b05b58fcccf393f'})

  "## Motions

  " Add motions for sorting within a line or range of lines
  call minpac#add('christoomey/vim-sort-motion', {'rev': '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5'})

  " Add motions for expanding a visual cursor within a group
  call minpac#add('gcmt/wildfire.vim', {'rev': 'e2baded7162260e05d2527f5bca9fca81f0bc8f2'})

  " Add motions for commenting out blocks of code
  call minpac#add('tomtom/tcomment_vim', {'rev': '2037d05870e10e03b2e157a09ae007c179efd253'})

  " Add mappings for working on text within pairs of characters (e.g. quotes)
  call minpac#add('tpope/vim-surround', {'rev': 'f51a26d3710629d031806305b6c8727189cd1935'})

  "## Text editing

  " Extras for Markdown editing, including TOC generation
  call minpac#add('SidOfc/mkdx', {'rev': '43f602ee353e46171e846a3010f0125b12eab6b4'})

  "## Job execution

  " Run jobs asynchronously in the background
  call minpac#add('tpope/vim-dispatch', {'rev': 'fe6a34322829e466a7e8ce710a6ac5eabddff9fd'})

  " Integrate with linters, fixers, formatters, etc.
  call minpac#add('dense-analysis/ale', {'rev': '681a6e371d02cce9c2414c19f5deeae61aa321fa'})
  if g:ENABLE_LSP
    " TODO(ndhoule): Migrate to built-in diagnostics: https://github.com/nvim-lua/diagnostic-nvim/issues/73
    call minpac#add('ndhoule/diagnostic-nvim', {'rev': 'feat/ale-lint-source-support'})
  endif

  " Debugging
  call minpac#add('puremourning/vimspector', {'rev': '78bec87f4ed058dfad6f8c33f487719db10f1bd3', 'do': 'VimspectorUpdate'})

  "## VCS

  call minpac#add('mhinz/vim-signify', {'rev': '98c693f7a1a91b73d9232d868765b4d20af892fe'})

  " Add vim commands for Git operations
  call minpac#add('tpope/vim-fugitive', {'rev': '660d2ba2b60026a9069ee005562ddad6a67f9fb0'})

  " Add vim-fugitive GitHub integration
  call minpac#add('tpope/vim-rhubarb', {'rev': 'c509c7eedeea641f5b0bdae708581ff610fbff5b'})

  "## Environment

  " FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
  " if executable('direnv')
  "   " Source direnv files, keeping vim environment/subshells in sync with host shell env
  "   call minpac#add('direnv/direnv.vim', {'rev': 'ff37d76da391e1ef299d2f5eb84006cb27a67799'})
  " endif

  "## Project settings

  " Add integration for .editorconfig files
  call minpac#add('editorconfig/editorconfig-vim', {'rev': '047c4b455b9d56adee63a52d6d7cdf5bb6521d53'})

  " Add support for project configuration files ('projections')
  call minpac#add('tpope/vim-projectionist', {'rev': '0c6967d3a8c3bd3d3b42013531c3f12c843aff80'})

  " Load project-specific vimrc (.lvimrc) files
  call minpac#add('embear/vim-localvimrc', {'rev': 'ac6444afb5fd11e3f7750f696a0c6b8b0b6ec116'})

  "## Text editing

  " Insert matching pairs of characters in insert mode (e.g. (), [], '')
  call minpac#add('Raimondi/delimitMate', {'rev': '16687aec24d803bc76cae2d7bfe2b73b1cdda4ef'})

  "## Language Server Protocol

  " - http://langserver.org/
  " - https://microsoft.github.io/language-server-protocol/
  " - :help lsp
  if g:ENABLE_LSP
    call minpac#add('neovim/nvim-lspconfig', {'rev': '4f19567fb76438d39ed196ae5b4e06b749e75e16'})
  endif

  "## Syntax highlighting

  " Hightlight pairs of characters with different colors
  call minpac#add('luochen1990/rainbow', {'rev': '4d15633cdaf61602e1d9fd216a77fc02e0881b2d'})

  " Change background color to highlight indentation levels
  call minpac#add('nathanaelkane/vim-indent-guides', {'rev': '54d889a63716ee2f1818aa2ec5082db47147147b'})

  " Highlight color names and codes in the same color that they represent
  call minpac#add('chrisbra/Colorizer', {'rev': '879e6c69c0c02c4ef0f08b3955c60de16efd8fb8'})

  if g:ENABLE_TREESITTER
    call minpac#add('nvim-treesitter/nvim-treesitter')
    " Install syntax for languages not yet supported by treesitter
    call minpac#add('hashivim/vim-terraform', {'rev': 'a6be9fea8757f6672397cadfb2784230914130c6'})
    call minpac#add('plasticboy/vim-markdown', {'rev': '8e5d86f7b85234d3d1b4207dceebc43a768ed5d4'})
  else
    call minpac#add('sheerun/vim-polyglot', {'rev': 'v4.16.0'})
  endif

  "## Completion

  if g:ENABLE_COMPLETION_NVIM
    call minpac#add('nvim-lua/completion-nvim', {'rev': '52ccd7c344dca90b62de4ea997c4aa328ce7f020'})
    call minpac#add('steelsojka/completion-buffers', {'rev': '441a58b77c04409e8ccb35fd4970598ae551462f'})
    if g:ENABLE_TREESITTER
      call minpac#add('nvim-treesitter/completion-treesitter')
    endif
  endif

  "## Theming

  call minpac#add('sainnhe/sonokai', {'rev': '51e7ee8b13f9c2e4eae33f8d745eaa1f320b0ae6'})

  "## Cross-platform support

  if g:host_os == 'Darwin'
    " Improve vim + iTerm2 + tmux interop
    call minpac#add('sjl/vitality.vim', {'rev': '0f693bff572689ad52b781c012dad4926cd924f6'})
  endif
endfunction

" Define user commands for interacting with plugins. Each of these loads minpac and reloads the
" vimrc (running the guarded section below)
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus source $MYVIMRC | call PackInit() | call minpac#status()
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
