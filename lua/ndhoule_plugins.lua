vim.cmd [[packadd packer.nvim]]

return require("packer").startup({
  function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Add functions for finding the current project's root directory path
    use {'dbakker/vim-projectroot', commit = '68787126ebbbe50e120e497ff63696b22f636840'}

    -- ## Core behavior

    -- Add a killring
    use {'bfredl/nvim-miniyank', commit = '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'}

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    use {'ntpeters/vim-better-whitespace', commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de'}

    -- Automatically close word control structures (if/fi, do/end, etc.)
    -- use {'tpope/vim-endwise', commit = '4289889a2622f9bc7c594a6dd79763781f63dfb5'}

    -- Add support for `.` (repeat) for plugins
    use {'tpope/vim-repeat', commit = '24afe922e6a05891756ecf331f39a1f6743d3d5a'}

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    use {'EinfachToll/DidYouMean', commit = 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'}

    -- Open a scratch buffer (clone of emacs functionality)
    use {'mtth/scratch.vim', commit = 'adf826b1ac067cdb4168cb6066431cff3a2d37a3'}

    -- Rename the current buffer on the filesystem
    use {'vim-scripts/Rename', tag = '0.3'}

    -- ## Search

    -- Make * and # work on visual selections
    use {'bronson/vim-visual-star-search', commit = 'e48c3fe596230e38f5a0e5313455e835c14aeb6a'}

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    use {
      'junegunn/fzf.vim',
      commit = '707f5b6269337ea5c19fc4054cd2574939f817f5',
      requires = {
        {
          'junegunn/fzf',
          commit = '7acdaf0b4335a6c089bce5b73ff23aeb3b9d9c92',
          run = './install --bin'
        }
      }
    }

    -- Menu for navigating ctags, LSP symbols, etc.
    use {'liuchengxu/vista.vim', commit = 'd709462958f2167008c9653a9cbc9de1067bfa2d'}

    -- File navigation menu
    use {'preservim/nerdtree', commit = '81f3eaba295b3fceb2d032db57e5eae99ae480f8'}

    -- ## Statusline

    -- Customize statusline
    use {'itchyny/lightline.vim', commit = 'b06d921023cf6536bcbee5754071d122296e8942'}

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    use {'christoomey/vim-sort-motion', commit = 'c8782be8f7da414c6442b3ba4b6abb0345d392d9'}

    -- Add motions for expanding a visual cursor within a group
    use {'gcmt/wildfire.vim', commit = 'fa91b732fd1c5acd23b7b32d5fbbc884eedafc8d'}

    -- Add motions for commenting out blocks of code
    use {'b3nj5m1n/kommentary', commit = 'f0b6d75df0a263fc849b0860dc8a27f4bed743db'}

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    use {'machakann/vim-sandwich', commit = '9e6340affe9f53c11a6975a5f50b9bf48adb692c'}
    use {'andymass/vim-matchup', commit = '39e39b1338eba27945af3bd9c663865ec1099c2e'}

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    use {'SidOfc/mkdx', commit = '602a78430aee47881f8c57f73ba96fdded9a3ace'}

    -- ## Job execution

    -- Run jobs asynchronously in the background
    use {'tpope/vim-dispatch', commit = 'fe6a34322829e466a7e8ce710a6ac5eabddff9fd'}

    -- Integrate with linters, fixers, formatters, etc.
    use {'dense-analysis/ale', commit = '1b08791228f5aca4545a3fba6699b29a003028fe'}

    -- Debugging
    use {
      'puremourning/vimspector',
      commit = '78bec87f4ed058dfad6f8c33f487719db10f1bd3',
      run = ':VimspectorUpdate'
    }

    -- ## VCS

    use {'mhinz/vim-signify', commit = '22f05607d4d7406781af56cafc1121152988c6d2'}

    -- Add vim commands for Git operations
    use {'tpope/vim-fugitive', commit = 'be9ff95f27d12b7bd46ab5d36f7149cb0864c329'}

    -- Add vim-fugitive GitHub integration
    use {'tpope/vim-rhubarb', commit = '2590324d7fdaf0c6311fad4ee2a2878acaaec42d'}

    -- ## Environment

    -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
    -- if executable('direnv')
    --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    --   use {'direnv/direnv.vim', commit = 'ff37d76da391e1ef299d2f5eb84006cb27a67799'}
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    use {'editorconfig/editorconfig-vim', commit = 'f305bc77faef4b418aee65682d7d147f64cfd5a9'}

    -- Add support for project configuration files ('projections')
    use {'tpope/vim-projectionist', commit = '8dda7acb7e24b44ef691ba19b35f585e97e91b30'}

    -- Load project-specific vimrc (.lvimrc) files
    use {'embear/vim-localvimrc', commit = '0206f5f5a8721cc8c5c84ebb8ab2886e9afcd0ac'}

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    use {'Raimondi/delimitMate', commit = '537a1da0fa5eeb88640425c37e545af933c56e1b'}

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    use {
      'neovim/nvim-lspconfig',
      commit = 'f81570d1288fd974098e0f311f728469ca919155',
    }

    -- ## Syntax highlighting

    -- Hightlight pairs of characters with different colors
    use {'p00f/nvim-ts-rainbow', commit = 'faecf6c5b848fc2b3ee51d29b4db609abe90f239'}

    -- Highlight color names and codes in the same color that they represent
    use {'chrisbra/Colorizer', commit = '826d5691ac7d36589591314621047b1b9d89ed34'}

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use {'hashivim/vim-terraform', commit = '37590260914178e04b46d1248e444e718da519c6'}
    use {'kchmck/vim-coffee-script', commit = '28421258a8dde5a50deafbfc19cd9873cacfaa79'}

    -- ## Completion

    use {
      'nvim-lua/completion-nvim',
      commit = 'd62fff879b29fa1ce915887a75305af0fff57d32'
    }
    use {
      'steelsojka/completion-buffers',
      commit = 'c36871b2a44b59761387f4972c617b44dcec5e75',
    }
    use {
      'nvim-treesitter/completion-treesitter',
      commit = '45c9b2faff4785539a0d0c655440c2465fed985a',
    }

    -- ## Theming

    use {'sainnhe/sonokai', commit = '5c1fc0452387cae323692e3345238a780a942056'}
  end,
  config = {
    max_jobs = 10,
  },
});
