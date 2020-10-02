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
        \   'rev': 'e2ae1b249cf2d5258b552cfd682c7c0911981e9b',
        \   'do': {-> system('./install --bin')},
        \ })
  call minpac#add('junegunn/fzf.vim', {'rev': '3348aef05d02828cd8b071ab29476af2029ea3d3'})

  " Menu for navigating ctags, LSP symbols, etc.
  call minpac#add('liuchengxu/vista.vim', {'rev': '7f97d30914daea5b542a90eed747d5bd00afbb19'})

  " File navigation menu
  call minpac#add('preservim/nerdtree', {'rev': '577ddc73f0a1d2fd6166ed3268ab8536111037e0'})

  "## Statusline

  " Customize statusline
  call minpac#add('itchyny/lightline.vim', {'rev': '1b412cf3af3dad79ee5807e6b151b8ac6aa4e2fc'})

  "## Motions

  " Add motions for sorting within a line or range of lines
  call minpac#add('christoomey/vim-sort-motion', {'rev': '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5'})

  " Add motions for expanding a visual cursor within a group
  call minpac#add('gcmt/wildfire.vim', {'rev': 'e2baded7162260e05d2527f5bca9fca81f0bc8f2'})

  " Add motions for commenting out blocks of code
  call minpac#add('tomtom/tcomment_vim', {'rev': '25bdb50a6c5934d4ac9313cef0d7d2168d84803b'})

  " Add mappings for working on text within pairs of characters (e.g. quotes)
  call minpac#add('tpope/vim-surround', {'rev': 'f51a26d3710629d031806305b6c8727189cd1935'})

  "## Text editing

  " Extras for Markdown editing, including TOC generation
  call minpac#add('SidOfc/mkdx', {'rev': 'fdc00bbe21e7de0208e2ee1ea6254525aa324bb4'})

  "## Job execution

  " Run jobs asynchronously in the background
  call minpac#add('tpope/vim-dispatch', {'rev': 'fe6a34322829e466a7e8ce710a6ac5eabddff9fd'})

  " Integrate with linters, fixers, formatters, etc.
  call minpac#add('dense-analysis/ale', {'rev': 'b91c6c2edd20794ad5637b561ed4c678647a76e5'})
  if has('nvim-0.5')
    call minpac#add('ndhoule/diagnostic-nvim', {'rev': 'feat/ale-lint-source-support'})
  endif

  "## Git integration

  " Show Git diff in sign column
  call minpac#add('airblade/vim-gitgutter', {'rev': '8005f71aabef13f5872b3ef4802f36503a16c451'})

  " Add vim commands for Git operations
  call minpac#add('tpope/vim-fugitive', {'rev': '9d62c677378f5ac5abaa8229eb49aaf133fba3fa'})

  " Add vim-fugitive GitHub integration
  call minpac#add('tpope/vim-rhubarb', {'rev': 'c509c7eedeea641f5b0bdae708581ff610fbff5b'})

  "## Environment

  " FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
  " if executable('direnv')
  "   " Source direnv files, keeping vim environment/subshells in sync with host shell env
  "   call minpac#add('direnv/direnv.vim', {'rev': '5e75084465ad37dd0a4d4b1198b5ffa8978ae4e1'})
  " endif

  "## Project settings

  " Add integration for .editorconfig files
  call minpac#add('editorconfig/editorconfig-vim', {'rev': '0a3c1d8082e38a5ebadcba7bb3a608d88a9ff044'})

  " Add support for project configuration files ('projections')
  call minpac#add('tpope/vim-projectionist', {'rev': '1d95458273a8ecdb678e65db918c045f9bb7e220'})

  " Load project-specific vimrc (.lvimrc) files
  call minpac#add('embear/vim-localvimrc', {'rev': 'ac6444afb5fd11e3f7750f696a0c6b8b0b6ec116'})

  "## Text editing

  " Insert matching pairs of characters in insert mode (e.g. (), [], '')
  call minpac#add('Raimondi/delimitMate', {'rev': '16687aec24d803bc76cae2d7bfe2b73b1cdda4ef'})

  "## Language Server Protocol

  " - http://langserver.org/
  " - https://microsoft.github.io/language-server-protocol/
  " - :help lsp
  if has('nvim-0.5')
    " TODO(ndhoule): Pin to version when plugin stabilizes
    call minpac#add('neovim/nvim-lspconfig', {'rev': '60133c47e0fd82556d7ca092546ebfa8d047466e'})
  endif

  "## Syntax highlighting

  " Hightlight pairs of characters with different colors
  call minpac#add('luochen1990/rainbow', {'rev': '4d15633cdaf61602e1d9fd216a77fc02e0881b2d'})

  " Change background color to highlight indentation levels
  call minpac#add('nathanaelkane/vim-indent-guides', {'rev': '54d889a63716ee2f1818aa2ec5082db47147147b'})

  if has('nvim-0.5')
    call minpac#add('nvim-treesitter/nvim-treesitter', {'rev': '5debe931333b20fe2b352dd92c03ded837e3df4b'})
    " Install syntax for languages not yet supported by treesitter
    call minpac#add('plasticboy/vim-markdown', {'rev': '8e5d86f7b85234d3d1b4207dceebc43a768ed5d4'})
  else
    call minpac#add('sheerun/vim-polyglot', {'rev': '8f5134aef8c4162235892d87407275f447e54e40'})
  endif

  "## Completion

  if has('nvim-0.5')
    " TODO(ndhoule): Investigate the nvim-treesitter/completion-treesitter completion source
    call minpac#add('nvim-lua/completion-nvim', {'rev': '52ccd7c344dca90b62de4ea997c4aa328ce7f020'})
  endif

  "## Theming

  call minpac#add('sainnhe/sonokai', {'rev': '4de4b058e6b2df8e39dea2400b17de1af9ea4d4e'})

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
