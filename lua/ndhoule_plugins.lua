vim.cmd [[packadd packer.nvim]]

return require("packer").startup({
  function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Add functions for finding the current project's root directory path
    use {'dbakker/vim-projectroot', commit = '68787126ebbbe50e120e497ff63696b22f636840'}

    -- ## Core behavior

    -- Use a common set of vim defaults
    use 'tpope/vim-sensible'

    -- Add a killring
    use {'bfredl/nvim-miniyank', commit = '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'}

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    use {'ntpeters/vim-better-whitespace', commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de'}

    -- Automatically close word control structures (if/fi, do/end, etc.)
    use {'tpope/vim-endwise', commit = '97180a73ad26e1dcc1eebe8de201f7189eb08344'}

    -- Add support for `.` (repeat) for plugins
    use {'tpope/vim-repeat', commit = '24afe922e6a05891756ecf331f39a1f6743d3d5a'}

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    use {'EinfachToll/DidYouMean', commit = 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'}

    -- Open a scratch buffer (clone of emacs functionality)
    use {'mtth/scratch.vim', commit = 'b3f643bfdefb83b47f0ecc03d815f4a564c5e687'}

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
    use {'liuchengxu/vista.vim', commit = '4387164845165634a06941b17c2b4f398cffd193'}

    -- File navigation menu
    use {'preservim/nerdtree', commit = '1b19089917cc3e0a81d3294fead2424c419d545c'}

    -- ## Statusline

    -- Customize statusline
    use {'itchyny/lightline.vim', commit = '8e013f32f524157bf14ccaa87d97be3d3a7201e2'}

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    use {'christoomey/vim-sort-motion', commit = '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5'}

    -- Add motions for expanding a visual cursor within a group
    use {'gcmt/wildfire.vim', commit = 'e2baded7162260e05d2527f5bca9fca81f0bc8f2'}

    -- Add motions for commenting out blocks of code
    use {'b3nj5m1n/kommentary', commit = '5adfea5864b11f8d43b07162b0d80c6d64d0d056'}

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    use {'machakann/vim-sandwich', commit = '9e6340affe9f53c11a6975a5f50b9bf48adb692c'}

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    use {'SidOfc/mkdx', commit = '602a78430aee47881f8c57f73ba96fdded9a3ace'}

    -- ## Job execution

    -- Run jobs asynchronously in the background
    use {'tpope/vim-dispatch', commit = 'fe6a34322829e466a7e8ce710a6ac5eabddff9fd'}

    -- Integrate with linters, fixers, formatters, etc.
    use {'dense-analysis/ale', commit = '388cf3374312b05122151bc68691bf09a69ff840'}

    -- Debugging
    use {
      'puremourning/vimspector',
      commit = '78bec87f4ed058dfad6f8c33f487719db10f1bd3',
      run = ':VimspectorUpdate'
    }

    -- ## VCS

    use {'mhinz/vim-signify', commit = 'b2a0450e23c63b75bbeabf4f0c28f9b4b2480689'}

    -- Add vim commands for Git operations
    use {'tpope/vim-fugitive', commit = '8cf0cf5bfb2b858faecf4e0f6c1b8d0948805e5e'}

    -- Add vim-fugitive GitHub integration
    use {'tpope/vim-rhubarb', commit = 'd865e427d067af57d85cf2b7d2bc1912eb84d0bf'}

    -- ## Environment

    -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
    -- if executable('direnv')
    --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    --   use {'direnv/direnv.vim', commit = 'ff37d76da391e1ef299d2f5eb84006cb27a67799'}
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    use {'editorconfig/editorconfig-vim', commit = '047c4b455b9d56adee63a52d6d7cdf5bb6521d53'}

    -- Add support for project configuration files ('projections')
    use {'tpope/vim-projectionist', commit = '348e070867d02bd471df486bfbe25e2e2ce13061'}

    -- Load project-specific vimrc (.lvimrc) files
    use {'embear/vim-localvimrc', commit = 'ac6444afb5fd11e3f7750f696a0c6b8b0b6ec116'}

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    use {'Raimondi/delimitMate', commit = '537a1da0fa5eeb88640425c37e545af933c56e1b'}

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    use {
      'neovim/nvim-lspconfig',
      commit = '041dfd7fb648d24c80cb8829dda2469f66f88490',
      disable = not vim.g.ENABLE_LSP
    }

    -- ## Syntax highlighting

    -- Hightlight pairs of characters with different colors
    use {'p00f/nvim-ts-rainbow', commit = 'd463320156e7e3d85a98aca1f5292422fd3b5b12'}

    -- Change background color to highlight indentation levels
    use {'nathanaelkane/vim-indent-guides', commit = '54d889a63716ee2f1818aa2ec5082db47147147b'}

    -- Highlight color names and codes in the same color that they represent
    use {'chrisbra/Colorizer', commit = '826d5691ac7d36589591314621047b1b9d89ed34'}

    use {
      'nvim-treesitter/nvim-treesitter',
      disable = not vim.g.ENABLE_TREESITTER,
      run = ':TSUpdate'
    }
    use {'sheerun/vim-polyglot', tag = 'v4.17.0'}

    -- ## Completion

    use {
      'nvim-lua/completion-nvim',
      commit = 'fc9b2fd2d47bea6a8954de1b1b19f2330545b354'
    }
    use {
      'steelsojka/completion-buffers',
      commit = 'c36871b2a44b59761387f4972c617b44dcec5e75',
      disable = not vim.g.ENABLE_COMPLETION_NVIM
    }
    use {
      'nvim-treesitter/completion-treesitter',
      commit = '45c9b2faff4785539a0d0c655440c2465fed985a',
      disable = not vim.g.ENABLE_TREESITTER and not vim.g.ENABLE_COMPLETION_NVIM
    }

    -- ## Theming

    use {'sainnhe/sonokai', commit = '80523e137cd6df42c2875db3db92576f00c91377'}
  end,
  config = {
    max_jobs = 10,
  },
});
