---------------------------
-- General Configuration --
---------------------------

-- Disable built-in plugins

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

vim.o.modelineexpr = true  -- Allow expressions in modelines

-- Enable backup files
vim.o.backup = true
-- Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
-- https://webpack.js.org/guides/development/#adjusting-your-text-editor
vim.o.backupcopy = 'yes'
vim.o.backupdir = vim.fn.stdpath('cache') .. '/backup//'
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
  vim.fn.mkdir(vim.o.backupdir, 'p')
end

-- Enable swapfiles
vim.o.swapfile = true
vim.o.directory = vim.fn.stdpath('cache') .. '/swap//'
if vim.fn.isdirectory(vim.o.directory) == 0 then
  vim.fn.mkdir(vim.o.directory, 'p')
end

-- Enable persistent undofiles
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo//'
if vim.fn.isdirectory(vim.o.undodir) == 0 then
  vim.fn.mkdir(vim.o.undodir, 'p')
end

-- Store netrw files in cache directory
vim.g.netrw_home = vim.fn.stdpath('cache') .. '/nvim'

-- Automatically rebalance splits when window is resized
vim.cmd('autocmd VimResized * :wincmd =')

vim.o.autochdir = true           -- Set cwd to the current buffer's containing directory
vim.o.autowrite = true           -- Save before executing shell commands to prevent working on a stale file
vim.o.clipboard = 'unnamedplus'  -- Use system clipboard
vim.o.foldlevelstart = 100       -- Don't fold on fileopen
vim.o.foldlevelstart = 100       -- Don't fold on fileopen
vim.o.foldmethod = 'indent'      -- Use indentation levels to fold
vim.o.mouse = 'a'                -- Enable mouse in all modes
vim.o.scrolljump = 5             -- Scroll five lines at a time (perf)
vim.o.synmaxcol = 300            -- Limit syntax highlighting to 300 columns wide (perf)

--------
-- UI --
--------

vim.o.termguicolors = true           -- Use 24-bit color
vim.o.title = true                   -- Set terminal title
vim.o.wildmode = 'list:longest'      -- Show wildmenu in tall list
vim.wo.colorcolumn = '100'           -- Show warning column at 100 characters
vim.wo.list = true
vim.wo.listchars = 'tab:→ ,trail:·'  -- Show glyphs in place of special whitespace characters
vim.wo.number = true                 -- Show line number in gutter

-----------------------------
-- Text display/formatting --
-----------------------------

vim.o.expandtab = true   -- <Tab> inserts spaces
vim.o.shiftround = true  -- Round indentation to nearest multiple of `shiftwidth`
vim.o.shiftwidth = 2     -- Spaces to use for autoindent
vim.o.softtabstop = 2    -- <Tab> inserts n spaces
vim.o.tabstop = 2        -- <Tab> inserts n spaces
vim.o.textwidth = 100    -- Automatically wrap long lines

------------
-- Search --
------------

vim.o.hlsearch = true         -- Highlight all search matches
vim.o.ignorecase = true       -- Ignore case when searching
vim.o.smartcase = true        -- Don't ignore case in search when term contains an uppercase char
vim.o.inccommand = 'nosplit'  -- Show substitutions incrementally, as you type them

-----------------
-- Keybindings --
-----------------

vim.g.mapleader = ','

-- Activate : using ;
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- Disable ex mode
vim.api.nvim_set_keymap('n', 'Q', '<ESC>', { noremap = true })

-- Prevent F1 from toggling Vim's help menu
vim.api.nvim_set_keymap('n', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F1>', '<ESC>', { noremap = true })

-- Close windows
vim.api.nvim_set_keymap('n', '<leader>w', ':close<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>W', ':only<cr>', { noremap = true })

-- Split panes
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', { noremap = true })

-- Move down by displayed lines, not actual lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- Remap Q to reformat paragraph text
vim.api.nvim_set_keymap('v', 'Q', 'gq', {})
vim.api.nvim_set_keymap('n', 'Q', 'gqap', {})

-- Move lines
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Clear any text highlighted by hlsearch
vim.api.nvim_set_keymap('n', '<C-L>', ':nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>', { noremap = true, silent = true })

-- Yank the current filename to the clipboard
vim.api.nvim_set_keymap('n', '<Leader>f', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Toggle between regular numbering, relative numbering, no numbering
vim.api.nvim_set_keymap('n', '<F3>', ':exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>', { silent = true })

-- Toggle spell check
vim.api.nvim_set_keymap('n', '<F4>', ':set spell!<CR>', { noremap = true })

-------------
-- Plugins --
-------------

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require("packer").startup({
  function()
    local use = require('packer').use

    use 'wbthomason/packer.nvim'

    -- ## Core behavior

    -- Add a killring
    -- https://github.com/bfredl/nvim-miniyank
    use {
      'bfredl/nvim-miniyank',
      commit = '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.miniyank_filename = vim.fn.stdpath('cache') .. '/miniyank.mpack'
        vim.g.miniyank_maxitems = 30

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', 'p', '<Plug>(miniyank-autoput)', {})
        vim.api.nvim_set_keymap('n', 'P', '<Plug>(miniyank-autoPut)', {})
        vim.api.nvim_set_keymap('n', '<C-P>', '<Plug>(miniyank-cycle)', {})
      end,
    }

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    -- https://github.com/ntpeters/vim-better-whitespace
    use {
      'ntpeters/vim-better-whitespace',
      commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de',
      config = function()
        -- By default, vim-better-whitespace strips extra whitespace on save. This is better handled
        -- by the configured formatter, so disable this behavior.
        vim.g.better_whitespace_enabled = true
        vim.g.strip_whitespace_on_save = false

        -- Highlight EOL whitespace in red
        vim.cmd('highlight ExtraWhitespace ctermbg=1')
      end,
    }

    -- Automatically close word control structures (if/fi, do/end, etc.)
    -- use {'tpope/vim-endwise', commit = '4289889a2622f9bc7c594a6dd79763781f63dfb5'}

    -- Add support for `.` (repeat) for plugins
    -- https://github.com/tpope/vim-repeat
    use {'tpope/vim-repeat', commit = '24afe922e6a05891756ecf331f39a1f6743d3d5a'}

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use {'EinfachToll/DidYouMean', commit = 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'}

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use {
      'mtth/scratch.vim',
      commit = 'adf826b1ac067cdb4168cb6066431cff3a2d37a3',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.scratch_no_mappings = 1

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<Leader>S', ':Scratch<CR>', { noremap = true, silent = true })
      end,
    }

    -- Rename the current buffer on the filesystem
    -- https://github.com/vim-scripts/Rename
    use {'vim-scripts/Rename', tag = '0.3'}

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use {'bronson/vim-visual-star-search', commit = '7c32edb9e3c85d473d9be4dec721a4c9d5d4d69c'}

    -- https://github.com/ironhouzi/starlite-nvim
    use {
      'ironhouzi/starlite-nvim',
      commit = 'bc204069859e4e85a057b92ac61700f3f46c3e41',
      config = function()
        -- Change the default behavior for search commands (*, #). By default, these commands
        -- immediately jump to the next match; remap them so they highlight the current word first
        -- and only jump to the next match on subsequent command.
        --
        -- FIXME(ndhoule): Doesn't work with vim-visual-star-search
        vim.api.nvim_set_keymap('n', '*', ':lua require("starlite").star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'g*', ':lua require("starlite").g_star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '#', ':lua require("starlite").hash()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'g#', ':lua require("starlite").g_hash()<CR>', { noremap = true, silent = true })
      end
    }

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
      'nvim-telescope/telescope.nvim',
      commit = '2c573b9d12f421cec74a215f79b25591fe083352',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
      }
    }

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use {'liuchengxu/vista.vim', commit = 'cb908f21c23d9c9ebce678c8dbc7a0f876384b8c',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.vista_executive_for = {
          Dockerfile      = 'nvim_lsp',
          css             = 'nvim_lsp',
          javascript      = 'nvim_lsp',
          javascriptreact = 'nvim_lsp',
          typescript      = 'nvim_lsp',
          typescriptreact = 'nvim_lsp',
          vim             = 'nvim_lsp',
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<leader><Tab>', ':Vista<CR>', { silent = true })
      end,
    }

    -- File navigation menu
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
      'kyazdani42/nvim-tree.lua',
      commit = '6175d63eaecdc7d80105825f89a6c9864c4dd432',
      requires = {
        'dbakker/vim-projectroot',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.nvim_tree_auto_close = 1
        vim.g.nvim_tree_auto_open = 1
        vim.g.nvim_tree_update_cwd = 1

        -----------------
        -- Keybindings --
        -----------------

        -- Open the current file in the tree relative to the project root.
        vim.api.nvim_set_keymap('n', '<leader>n', ':ProjectRootExe NvimTreeFindFile<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope git_files<CR>', { noremap = true })
      end,
    }

    -- ## Statusline

    -- Customize statusline
    -- https://github.com/itchyny/lightline.vim
    use {
      'itchyny/lightline.vim',
      commit = 'b06d921023cf6536bcbee5754071d122296e8942',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.lightline = {
          active = {
            left =  {{'mode', 'paste'}, {'readonly', 'filename'}},
            right = {{'lineinfo'}, {'percent'}, {'fileformat', 'fileencoding', 'filetype'}},
          },
          component_function = {
            filename = 'LightlineFilename',
          },
        }

        -- Retrieve the current file's path. If the file is within a project (e.g. a git
        -- repository), return a filename relative to that root; otherwise, return the full file
        -- path.
        vim.cmd([[
        function! LightlineFilename()
          let l:filename = expand('%:p')
          if l:filename ==# ''
            return '[No Name]'
          endif

          let l:project_root = projectroot#get()
          if l:project_root !=# ''
            let l:filename = substitute(l:filename, l:project_root . '/', '', '')
          endif

          return l:filename . (&modified ? ' +' : '')
        endfunction
        ]])
      end,
    }

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    -- https://github.com/christoomey/vim-sort-motion
    use {'christoomey/vim-sort-motion', commit = 'c8782be8f7da414c6442b3ba4b6abb0345d392d9'}

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use {'gcmt/wildfire.vim', commit = 'fa91b732fd1c5acd23b7b32d5fbbc884eedafc8d'}

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use {'b3nj5m1n/kommentary', commit = 'fe01018a490813a8d89c09947a7ca23fc0e9e728'}

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use {
      'machakann/vim-sandwich',
      commit = '9e6340affe9f53c11a6975a5f50b9bf48adb692c',
      config = function()
        -- Set up surround.vim-compatible keybindings for vim-sandwich
        vim.cmd('runtime macros/sandwich/keymap/surround.vim')

        require('kommentary.config').configure_language("default", {
          prefer_single_line_comments = true,
        })
      end,
    }

    -- https://github.com/andymass/vim-matchup
    use {'andymass/vim-matchup', commit = '816751e279f1186d10520bad752206d5f91ce173'}

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- 602a78430aee47881f8c57f73ba96fdded9a3ace
    use {'SidOfc/mkdx', commit = '439c518cea989c875eea44ce54a36f7e7dc561d9'}

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use {'tpope/vim-dispatch', commit = '250ea269e206445d10700b299afd3eb993e939ad'}

    use {
      'romainl/vim-qf',
      commit = '65f115c350934517382ae45198a74232a9069c2a',
      setup = function()
        vim.api.nvim_set_keymap('n', '<Leader>ep', '<Plug>(qf_loc_previous)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>en', '<Plug>(qf_loc_next)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>Ep', '<Plug>(qf_qf_previous)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>En', '<Plug>(qf_qf_next)', { silent = true })
      end,
    }

    -- Integrate with linters, fixers, formatters, etc.
    -- https://github.com/dense-analysis/ale
    use {
      'dense-analysis/ale',
      commit = 'd53a085096306c890897385692693ee653aaddce',
      config = function()
        -- Override the default LSP diagnostics handler with a handler that sends diagnostics to
        -- ALE. This lets us configure cycling through lint errors, LSP errors, etc. in a single
        -- place.

        local lsp_diagnostic_clear = vim.lsp.diagnostic.clear
        vim.lsp.diagnostic.clear = function(bufnr, client_id, diagnostic_ns, sign_ns)
          lsp_diagnostic_clear(bufnr, client_id, diagnostic_ns, sign_ns)
          vim.api.nvim_call_function('ale#other_source#ShowResults', {bufnr, 'LSP', {}})
        end

        local ale_diagnostic_severity_map = {
          [vim.lsp.protocol.DiagnosticSeverity.Error] = 'E';
          [vim.lsp.protocol.DiagnosticSeverity.Warning] = 'W';
          [vim.lsp.protocol.DiagnosticSeverity.Information] = 'I';
          [vim.lsp.protocol.DiagnosticSeverity.Hint] = 'H';
        }

        local function on_publish_diagnostics(_, _, params, _, _, _)
          local uri = params.uri
          local bufnr = vim.uri_to_bufnr(uri)
          local diagnostics = params.diagnostics

          if diagnostics == nil then
            return
          end

          local items = {}
          for _, item in ipairs(diagnostics) do
            table.insert(items, {
              code = item.code,
              col = item.range.start.character + 1,
              end_col = item.range['end'].character,
              end_lnum = item.range['end'].line,
              lnum = item.range.start.line + 1,
              nr = item.code,
              text = item.message,
              type = ale_diagnostic_severity_map[item.severity],
              bufnr = bufnr,
            })
          end

          vim.api.nvim_call_function('ale#other_source#ShowResults', {bufnr, 'LSP', items})
        end

        vim.lsp.handlers['textDocument/publishDiagnostics'] = on_publish_diagnostics

        ---------------------------
        -- General Configuration --
        ---------------------------

        -- Decrease delay before running linter after text change
        vim.g.ale_lint_delay = 100

        -- Disable ale's LSP in favor of built-in neovim LSP
        vim.g.ale_disable_lsp = 1

        ----------------------
        -- UI Configuration --
        ----------------------

        -- Show sign column even when there are no errors to prevent text from moving while typing
        vim.cmd('set signcolumn=yes:1')
        vim.g.ale_sign_column_always = true

        vim.g.ale_sign_info = '➤'
        vim.g.ale_sign_warning = '⚠'
        vim.g.ale_sign_error = '✖'

        vim.g.ale_echo_msg_info_str = 'I'
        vim.g.ale_echo_msg_warning_str = 'W'
        vim.g.ale_echo_msg_error_str = 'E'
        vim.g.ale_echo_msg_format = '[%linter%] %s %(code) %[%severity%]'

        --------------------------
        -- Linter Configuration --
        --------------------------

        -- Explicitly configure linters. To override linters on a per-project basis, create a
        -- `.projections.json` file (see projectionist configuration for more details).
        vim.g.ale_linters_explicit = true

        vim.g.ale_linters = {
          go         = {'golint', 'govet'},
          html       = {'tidy'},
          javascript = {'eslint'},
          markdown   = {},
          sh         = {'shellcheck'},
          typescript = {'eslint'},
        }

        -- When available, use eslint_d for faster linting and fixing.
        -- eslint_d delegates to project-local eslint installations.
        if vim.fn.executable('eslint_d') then
          vim.g.ale_javascript_eslint_use_global = true
          vim.g.ale_javascript_eslint_executable = 'eslint_d'
        end

        -----------------------------
        -- Formatter Configuration --
        -----------------------------

        vim.g.ale_fixers = {
          go         = {'gofmt'},
          html       = {'prettier'},
          javascript = {'eslint'},
          markdown   = {'remove_trailing_lines'},
          sh         = {'shfmt'},
          typescript = {'eslint'},
        }

        -- Reset shfmt configuration to defaults. By default, ALE will use your editor's
        -- shiftwidth/tabstob settings as the `-i` flag to shfmt; this means shfmt will format files
        -- depending on a user's personal configuration rather than the project configuration,
        -- diminishing the utility of a standardized formatter.
        --
        -- ALE guards against this being an empty value, so this must be a space.
        vim.g.ale_sh_shfmt_options = ' '
      end,
    }

    -- https://github.com/folke/trouble.nvim
    use {
      'folke/trouble.nvim',
      commit = '51dd9175eb506b026189c70f81823dfa77defe86',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup({
          auto_open = true,
          signs = {
            error = '✖',
            warning = '⚠',
            hint = '➤',
            information = '➤',
            other = '➤'
          },
          use_lsp_diagnostic_signs = false,
        })
      end,
    }

    -- Debugging
    -- https://github.com/puremourning/vimspector
    use {
      'puremourning/vimspector',
      commit = '57ce0992803fcf22c0557550fff45e3fe869f707',
      run = ':VimspectorUpdate',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.vimspector_install_gadgets = {
          'debugger-for-chrome',
          'vscode-node-debug2',
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<F5>', '<Plug>VimspectorContinue', {})
        vim.api.nvim_set_keymap('n', '<S-F5>', '<Plug>VimspectorStop', {})
        vim.api.nvim_set_keymap('n', '<C-S-F5>', '<Plug>VimspectorRestart', {})
        vim.api.nvim_set_keymap('n', '<F6>', '<Plug>VimspectorPause', {})
        vim.api.nvim_set_keymap('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', {})
        vim.api.nvim_set_keymap('n', '<S-F9>', '<Plug>VimspectorAddFunctionBreakpoint', {})
        vim.api.nvim_set_keymap('n', '<F10>', '<Plug>VimspectorStepOver', {})
        vim.api.nvim_set_keymap('n', '<F11>', '<Plug>VimspectorStepInto', {})
        vim.api.nvim_set_keymap('n', '<S-F11>', '<Plug>VimspectorStepOut', {})
      end,
    }

    -- ## VCS

    -- https://github.com/mhinz/vim-signify
    use {'mhinz/vim-signify', commit = '22f05607d4d7406781af56cafc1121152988c6d2'}

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use {
      'tpope/vim-fugitive',
      commit = '8e4a677c7f1554cb1dd34d05a2b068657b42ef0f',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        -- Decrease the time before vim writes the swapfile, which also governs the delay before git gutter
        -- marks are shown
        vim.o.updatetime = 100

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<Leader>gws', ':Gstatus<CR>', {})
        vim.api.nvim_set_keymap('n', '<Leader>gc', ':Gcommit<CR>', {})
        vim.api.nvim_set_keymap('n', '<Leader>gl', ':Glog<CR>', {})
        vim.api.nvim_set_keymap('n', '<Leader>gia', ':Gwrite<CR>', {})
        vim.api.nvim_set_keymap('n', '<Leader>gwd', ':Gsdiff<CR>', {})
        vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gblame<CR>', {})
      end,
    }

    -- Add vim-fugitive GitHub integration
    -- https://github.com/tpope/vim-rhubarb
    use {'tpope/vim-rhubarb', commit = 'b4aad6dc43660db554bba2942026fb9965f1a45e'}

    -- ## Environment

    -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
    -- if executable('direnv')
    --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    --   -- https://github.com/direnv/direnv.vim
    --   use {'direnv/direnv.vim', commit = 'ff37d76da391e1ef299d2f5eb84006cb27a67799'}
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    -- https://github.com/editorconfig/editorconfig-vim
    use {'editorconfig/editorconfig-vim', commit = '3078cd10b28904e57d878c0d0dab42aa0a9fdc89'}

    -- Add support for project configuration files ('projections')
    -- https://github.com/tpope/vim-projectionist
    use {
      'tpope/vim-projectionist',
      commit = '8dda7acb7e24b44ef691ba19b35f585e97e91b30',
      config = function()
        local utils = require("ndhoule_utils")

        ---------------------------
        -- General Configuration --
        ---------------------------

        --
        -- Integrations
        --

        -- ALE

        -- Set project-specific linters and formatters in your `.projections.json`:
        --
        -- ```json
        --
        -- {
        --   "*": {
        --     "formatters": ["eslint"],
        --     "linters": ["eslint", "tsserver"]
        --   }
        -- }
        -- ```

        function _G.projectionist_ale_set_linters()
          local q_linters = vim.fn['projectionist#query']('linters')
          if (#q_linters > 0 and vim.bo.filetype ~= nil) then
            local linters = q_linters[1][2]
            vim.b.ale_linters = {[vim.bo.filetype] = linters}
          end
        end

        function _G.projectionist_ale_set_formatters()
          local q_formatters = vim.fn['projectionist#query']('formatters')
          if (#q_formatters > 0 and vim.bo.filetype ~= nil) then
            local formatters = q_formatters[1][2]
            vim.b.ale_fixers = {[vim.bo.filetype] = formatters}
          end
        end

        utils.nvim_create_augroups({
          AleProjectionistIntegration = {
              {"User", "ProjectionistActivate", "call v:lua.projectionist_ale_set_linters()"},
              {"User", "ProjectionistActivate", "call v:lua.projectionist_ale_set_formatters()"},
          }
        })

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<Leader>aa', ':A<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<Leader>as', ':AS<CR>', { noremap = true })
        vim.api.nvim_set_keymap('n', '<Leader>av', ':AV<CR>', { noremap = true })
      end,
    }

    -- Load project-specific vimrc (.lvimrc) files
    -- https://github.com/embear/vim-localvimrc
    use {'embear/vim-localvimrc', commit = '0206f5f5a8721cc8c5c84ebb8ab2886e9afcd0ac'}

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/Raimondi/delimitMate
    use {'Raimondi/delimitMate', commit = '537a1da0fa5eeb88640425c37e545af933c56e1b'}

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    -- https://github.com/neovim/nvim-lspconfig
    use {
      'neovim/nvim-lspconfig',
      commit = '0eccc1a0ebf909aecfa1ac238d940061162ae84f',
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        local lspconfig = require('lspconfig')

        lspconfig.bashls.setup{}
        lspconfig.cssls.setup{}
        lspconfig.dockerls.setup{}
        lspconfig.html.setup{}
        lspconfig.sqlls.setup{}
        lspconfig.sumneko_lua.setup{cmd = {'lua-language-server'}}
        lspconfig.terraformls.setup{}
        lspconfig.tsserver.setup{}
        lspconfig.vimls.setup{}
        lspconfig.yamlls.setup{}

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
      end
    }

    -- ## Syntax highlighting

    -- Hightlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use {'p00f/nvim-ts-rainbow', commit = '94138b1ba193d81f130dbe9fc1f255f97b7697d5'}

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/chrisbra/Colorizer
    use {
      'chrisbra/Colorizer',
      commit = '826d5691ac7d36589591314621047b1b9d89ed34',
      config = function()
        local utils = require("ndhoule_utils")

        ---------------------------
        -- General Configuration --
        ---------------------------

        -- Colorize's built-in auto-colorization doesn't work consistently
        -- https://github.com/chrisbra/Colorizer/issues/77
        utils.nvim_create_augroups({
          AutoColorize = {
            {
              "BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew",
              "*.css,*.html,*.js,*.jsx,*.sass,*.scss,*.ts,*.tsx,*.tpl",
              "ColorHighlight",
            },
          },
        })
      end
    }

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        local tree_sitter = require('nvim-treesitter.configs')

        ---------------------------
        -- General Configuration --
        ---------------------------

        tree_sitter.setup({
          ensure_installed = 'maintained',
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
          matchup = {
            enable = true,
          },
          rainbow = {
            enable = true,
          },
        })
      end,
    }

    -- https://github.com/hashivim/vim-terraform
    use {'hashivim/vim-terraform', commit = 'f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443'}
    -- https://github.com/kchmck/vim-coffee-script
    use {'kchmck/vim-coffee-script', commit = '28421258a8dde5a50deafbfc19cd9873cacfaa79'}

    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use {
      'hrsh7th/nvim-cmp',
      -- TODO(ndhoule): Set commit SHA for these plugins
      -- commit = '',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local nvim_lsp = require('lspconfig')

        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.o.completeopt = 'menuone,noselect'

        cmp.setup({
          sources = {
            { name = 'buffer' },
            { name = 'nvim_lsp' },
          }
        })

        -- nvim-cmp supports LSP completions; advertise to LSP that we want them
        local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
        local lsp_servers = { 'tsserver' }

        for _, lsp in ipairs(lsp_servers) do
          nvim_lsp[lsp].setup { capabilities = capabilities }
        end
      end,
    }

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use {
      'sainnhe/sonokai',
      commit = 'cb10268587c0f0616242ecb5503e22240a915136',
      config = function()
        vim.g.sonokai_diagnostic_text_highlight = 1

        vim.cmd('colorscheme sonokai')
      end,
    }
  end,
  config = {
    max_jobs = 10,
  },
});
