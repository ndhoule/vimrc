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

vim.o.modelineexpr = true -- Allow expressions in modelines

-- Enable backup files
vim.o.backup = true
-- Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
-- https://webpack.js.org/guides/development/#adjusting-your-text-editor
vim.o.backupcopy = "yes"
vim.o.backupdir = vim.fn.stdpath("cache") .. "/backup//"
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
  vim.fn.mkdir(vim.o.backupdir, "p")
end

-- Enable swapfiles
vim.o.swapfile = true
vim.o.directory = vim.fn.stdpath("cache") .. "/swap//"
if vim.fn.isdirectory(vim.o.directory) == 0 then
  vim.fn.mkdir(vim.o.directory, "p")
end

-- Enable persistent undofiles
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo//"
if vim.fn.isdirectory(vim.o.undodir) == 0 then
  vim.fn.mkdir(vim.o.undodir, "p")
end

-- Store netrw files in cache directory
vim.g.netrw_home = vim.fn.stdpath("cache") .. "/nvim"

-- Automatically rebalance splits when window is resized
vim.cmd("autocmd VimResized * :wincmd =")

vim.o.autochdir = true -- Set cwd to the current buffer's containing directory
vim.o.autowrite = true -- Save before executing shell commands to prevent working on a stale file
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.foldlevelstart = 100 -- Don't fold on fileopen
vim.o.foldlevelstart = 100 -- Don't fold on fileopen
vim.o.foldmethod = "indent" -- Use indentation levels to fold
vim.o.mouse = "a" -- Enable mouse in all modes
vim.o.scrolljump = 5 -- Scroll five lines at a time (perf)
vim.o.synmaxcol = 300 -- Limit syntax highlighting to 300 columns wide (perf)

--------
-- UI --
--------

vim.o.termguicolors = true -- Use 24-bit color
vim.o.title = true -- Set terminal title
vim.o.wildmode = "list:longest" -- Show wildmenu in tall list
vim.wo.colorcolumn = "100" -- Show warning column at 100 characters
vim.wo.cursorline = true -- Highlight the (horizontal) line the cursor is currently on
vim.wo.list = true
vim.wo.listchars = "tab:→ ,trail:·" -- Show glyphs in place of special whitespace characters
vim.wo.number = true -- Show line number in gutter

-----------------------------
-- Text display/formatting --
-----------------------------

vim.o.expandtab = true -- <Tab> inserts spaces
vim.o.shiftround = true -- Round indentation to nearest multiple of `shiftwidth`
vim.o.shiftwidth = 2 -- Spaces to use for autoindent
vim.o.softtabstop = 2 -- <Tab> inserts n spaces
vim.o.tabstop = 2 -- <Tab> inserts n spaces
vim.o.textwidth = 100 -- Automatically wrap long lines

------------
-- Search --
------------

vim.o.hlsearch = true -- Highlight all search matches
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Don't ignore case in search when term contains an uppercase char
vim.o.inccommand = "nosplit" -- Show substitutions incrementally, as you type them

-----------------
-- Keybindings --
-----------------

vim.g.mapleader = ","

-- Activate : using ;
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- Disable ex mode
vim.api.nvim_set_keymap("n", "Q", "<ESC>", { noremap = true })

-- Prevent F1 from toggling Vim's help menu
vim.api.nvim_set_keymap("n", "<F1>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F1>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "<F1>", "<ESC>", { noremap = true })

-- Close windows
vim.api.nvim_set_keymap("n", "<leader>w", ":close<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>W", ":only<cr>", { noremap = true })

-- Split panes
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true })

-- Move down by displayed lines, not actual lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

-- Remap Q to reformat paragraph text
vim.api.nvim_set_keymap("v", "Q", "gq", {})
vim.api.nvim_set_keymap("n", "Q", "gqap", {})

-- Move lines
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Clear any text highlighted by hlsearch
vim.api.nvim_set_keymap(
  "n",
  "<C-L>",
  ':nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>',
  { noremap = true, silent = true }
)

-- Yank the current filename to the clipboard
vim.api.nvim_set_keymap("n", "<Leader>f", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Toggle between regular numbering, relative numbering, no numbering
vim.api.nvim_set_keymap("n", "<F3>", ':exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>', { silent = true })

-- Toggle spell check
vim.api.nvim_set_keymap("n", "<F4>", ":set spell!<CR>", { noremap = true })

-------------
-- Plugins --
-------------

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup({
  function()
    local use = require("packer").use

    use("wbthomason/packer.nvim")

    -- ## Core behavior

    -- Add a killring
    -- https://github.com/bfredl/nvim-miniyank
    use({
      "bfredl/nvim-miniyank",
      commit = "2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.miniyank_filename = vim.fn.stdpath("cache") .. "/miniyank.mpack"
        vim.g.miniyank_maxitems = 30

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "p", "<Plug>(miniyank-autoput)", {})
        vim.api.nvim_set_keymap("n", "P", "<Plug>(miniyank-autoPut)", {})
        vim.api.nvim_set_keymap("n", "<C-P>", "<Plug>(miniyank-cycle)", {})
      end,
    })

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    -- https://github.com/ntpeters/vim-better-whitespace
    use({
      "ntpeters/vim-better-whitespace",
      commit = "c5afbe91d29c5e3be81d5125ddcdc276fd1f1322",
      config = function()
        -- By default, vim-better-whitespace strips extra whitespace on save. This is better handled
        -- by the configured formatter, so disable this behavior.
        vim.g.better_whitespace_enabled = true
        vim.g.strip_whitespace_on_save = false

        -- Highlight EOL whitespace in red
        vim.cmd("highlight ExtraWhitespace ctermbg=1")
      end,
    })

    -- Add support for `.` (repeat) for plugins
    -- https://github.com/tpope/vim-repeat
    use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use({ "EinfachToll/DidYouMean", commit = "a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e" })

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use({
      "mtth/scratch.vim",
      commit = "adf826b1ac067cdb4168cb6066431cff3a2d37a3",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.scratch_no_mappings = 1

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>S", ":Scratch<CR>", { noremap = true, silent = true })
      end,
    })

    -- Rename the current buffer on the filesystem
    -- https://github.com/vim-scripts/Rename
    use({ "vim-scripts/Rename", tag = "0.3" })

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use({ "bronson/vim-visual-star-search", commit = "7c32edb9e3c85d473d9be4dec721a4c9d5d4d69c" })

    -- https://github.com/ironhouzi/starlite-nvim
    use({
      "ironhouzi/starlite-nvim",
      commit = "bc204069859e4e85a057b92ac61700f3f46c3e41",
      config = function()
        -- Change the default behavior for search commands (*, #). By default, these commands
        -- immediately jump to the next match; remap them so they highlight the current word first
        -- and only jump to the next match on subsequent command.
        --
        -- FIXME(ndhoule): Doesn't work with vim-visual-star-search
        vim.api.nvim_set_keymap("n", "*", ':lua require("starlite").star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g*", ':lua require("starlite").g_star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "#", ':lua require("starlite").hash()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g#", ':lua require("starlite").g_hash()<CR>', { noremap = true, silent = true })
      end,
    })

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use({
      "nvim-telescope/telescope.nvim",
      commit = "02a02f7bcdfb1f207de6649c00701ee1fe13a420",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope git_files<CR>", { noremap = true })
      end,
    })

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use({
      "liuchengxu/vista.vim",
      commit = "587b6b2de244491c3fbe118ebe6739a90f3c91b2",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        vim.g.vista_disable_statusline = 0

        vim.g.vista_executive_for = {
          bash = "nvim_lsp",
          css = "nvim_lsp",
          dockerfile = "nvim_lsp",
          graphql = "nvim_lsp",
          html = "nvim_lsp",
          javascript = "nvim_lsp",
          javascriptreact = "nvim_lsp",
          json = "nvim_lsp",
          lua = "nvim_lsp",
          markdown = "toc",
          pandoc = "markdown",
          sql = "nvim_lsp",
          terraform = "nvim_lsp",
          typescript = "nvim_lsp",
          typescriptreact = "nvim_lsp",
          vim = "nvim_lsp",
          vimwiki = "markdown",
          yaml = "nvim_lsp",
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<leader><Tab>", ":Vista<CR>", { silent = true })
      end,
    })

    -- File navigation menu
    -- https://github.com/kyazdani42/nvim-tree.lua
    use({
      "kyazdani42/nvim-tree.lua",
      commit = "7f5a49f7c4699bb57635a36869f5149af491e761",
      requires = {
        "dbakker/vim-projectroot",
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        local nvim_tree = require("nvim-tree")

        ---------------------------
        -- General Configuration --
        ---------------------------

        nvim_tree.setup({
          auto_close = true,
          auto_open = true,
          update_cwd = true,
        })

        -----------------
        -- Keybindings --
        -----------------

        -- Open the current file in the tree relative to the project root.
        vim.api.nvim_set_keymap("n", "<leader>n", ":ProjectRootExe NvimTreeFindFile<CR>", { noremap = true })
      end,
    })

    -- ## Statusline

    -- Customize statusline
    -- https://github.com/itchyny/lightline.vim
    use({
      "itchyny/lightline.vim",
      commit = "b06d921023cf6536bcbee5754071d122296e8942",
      requires = "dbakker/vim-projectroot",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

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

        vim.g.lightline = {
          active = {
            left = { { "mode", "paste" }, { "readonly", "filename" } },
            right = { { "lineinfo" }, { "percent" }, { "fileformat", "fileencoding", "filetype" } },
          },
          component_function = {
            filename = "LightlineFilename",
          },
        }
      end,
    })

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    -- https://github.com/christoomey/vim-sort-motion
    use({ "christoomey/vim-sort-motion", commit = "c8782be8f7da414c6442b3ba4b6abb0345d392d9" })

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use({ "gcmt/wildfire.vim", commit = "fa91b732fd1c5acd23b7b32d5fbbc884eedafc8d" })

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use({ "b3nj5m1n/kommentary", commit = "8f1cd74ad28de7d7c4fda5d8e8557ff240904b42" })

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use({
      "machakann/vim-sandwich",
      commit = "4cd1ea8db6aa43af8e1996422e2010c49d3a5998",
      config = function()
        -- Set up surround.vim-compatible keybindings for vim-sandwich
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")

        require("kommentary.config").configure_language("default", {
          prefer_single_line_comments = true,
        })
      end,
    })

    -- https://github.com/andymass/vim-matchup
    use({ "andymass/vim-matchup", commit = "42c91ec8cc69f47c384c9b9e0aa12918da2e313c" })

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- https://github.com/SidOfc/mkdx
    use({ "SidOfc/mkdx", commit = "439c518cea989c875eea44ce54a36f7e7dc561d9" })

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use({ "tpope/vim-dispatch", commit = "a99a671aff87f77da9ac3461e589393b5ecfcd88" })

    -- https://github.com/folke/trouble.nvim
    use({
      "folke/trouble.nvim",
      commit = "756f09de113a775ab16ba6d26c090616b40a999d",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          auto_open = true,
          mode = "lsp_document_diagnostics",
          signs = {
            error = "✖",
            warning = "⚠",
            hint = "➤",
            information = "➤",
            other = "➤",
          },
        })

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap(
          "n",
          "<Leader>ep",
          '<cmd>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
          { silent = true }
        )
        vim.api.nvim_set_keymap(
          "n",
          "<Leader>en",
          '<cmd>lua require("trouble").next({ skip_groups = true, jump = true })<CR>',
          { silent = true }
        )
      end,
    })

    -- Debugging
    -- https://github.com/puremourning/vimspector
    use({
      "puremourning/vimspector",
      commit = "b12e2d67df9d1b9e0046b90d635d655450bdb6ed",
      run = ":VimspectorUpdate",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.vimspector_install_gadgets = {
          "debugger-for-chrome",
          "vscode-node-debug2",
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<F5>", "<Plug>VimspectorContinue", {})
        vim.api.nvim_set_keymap("n", "<S-F5>", "<Plug>VimspectorStop", {})
        vim.api.nvim_set_keymap("n", "<C-S-F5>", "<Plug>VimspectorRestart", {})
        vim.api.nvim_set_keymap("n", "<F6>", "<Plug>VimspectorPause", {})
        vim.api.nvim_set_keymap("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", {})
        vim.api.nvim_set_keymap("n", "<S-F9>", "<Plug>VimspectorAddFunctionBreakpoint", {})
        vim.api.nvim_set_keymap("n", "<F10>", "<Plug>VimspectorStepOver", {})
        vim.api.nvim_set_keymap("n", "<F11>", "<Plug>VimspectorStepInto", {})
        vim.api.nvim_set_keymap("n", "<S-F11>", "<Plug>VimspectorStepOut", {})
      end,
    })

    -- ## VCS

    -- https://github.com/mhinz/vim-signify
    use({ "mhinz/vim-signify", commit = "22f05607d4d7406781af56cafc1121152988c6d2" })

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use({
      "tpope/vim-fugitive",
      commit = "174fd6a39b7e162ca707c87582d1b7979fba95f4",
      requires = {
        -- https://github.com/tpope/vim-rhubarb
        { "tpope/vim-rhubarb", commit = "977b3ccbad1f7e5370354ae409fb2ea4a7ce2058" },
      },
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

        vim.api.nvim_set_keymap("n", "<Leader>gws", ":Git status<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gc", ":Git commit<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gl", ":Git log<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gia", ":Gwrite<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gwd", ":Git diff<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", {})
      end,
    })

    -- https://github.com/pwntester/octo.nvim
    use({
      "pwntester/octo.nvim",
      commit = "848990b8d7f7f28293cfb5a1ad19abf66e27f08a",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
      },
      disable = vim.fn.executable("gh") == 0,
      config = function()
        require("octo").setup()
      end,
    })

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
    use({ "editorconfig/editorconfig-vim", commit = "3078cd10b28904e57d878c0d0dab42aa0a9fdc89" })

    -- Add support for project configuration files ('projections')
    -- https://github.com/tpope/vim-projectionist
    use({
      "tpope/vim-projectionist",
      commit = "438b58aab54624e554d71063a69ba3d1e1bfbc2f",
      config = function()
        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>aa", ":A<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>as", ":AS<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>av", ":AV<CR>", { noremap = true })
      end,
    })

    -- Load project-specific vimrc (.lvimrc) files
    -- https://github.com/embear/vim-localvimrc
    use({ "embear/vim-localvimrc", commit = "e7acc32cdc1b70db0d42856ecde9ccf362720bd5" })

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/windwp/nvim-autopairs
    use({
      "windwp/nvim-autopairs",
      commit = "e6b1870cd2e319f467f99188f99b1c3efc5824d2",
      after = "nvim-treesitter",
      config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
          check_ts = true,
          ts_config = {
            javascript = { "string", "template_string" },
            javascriptreact = { "string", "template_string" },
            lua = { "string" },
            typescript = { "string", "template_string" },
            typescriptreact = { "string", "template_string" },
          },
        })
      end,
    })

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    -- https://github.com/neovim/nvim-lspconfig
    use({
      "neovim/nvim-lspconfig",
      commit = "cb037a0c075171d1084c55f3e59e923e71b2abca",
      requires = { "jose-elias-alvarez/null-ls.nvim", "hrsh7th/cmp-nvim-lsp", "jose-elias-alvarez/nvim-lsp-ts-utils" },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")

        -- nvim-cmp supports LSP completions; advertise to LSP that we want them
        local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

        local on_attach = function(client, bufnr)
          if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 3500)")
          end

          -----------------
          -- Keybindings --
          -----------------

          if client.resolved_capabilities.document_formatting then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<space>f",
              "<cmd>lua vim.lsp.buf.formatting()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.resolved_capabilities.find_references then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gr",
              "<cmd>lua vim.lsp.buf.references()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.resolved_capabilities.goto_definition then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { noremap = true, silent = true }
            )
          end

          if client.resolved_capabilities.hover then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "K",
              "<cmd>lua vim.lsp.buf.hover()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.resolved_capabilities.rename then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<space>rn",
              "<cmd>lua vim.lsp.buf.rename()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.resolved_capabilities.signature_help then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<C-k>",
              "<cmd>lua vim.lsp.buf.signature_help()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Conditionally assign these keybindings
          vim.api.nvim_set_keymap(
            "n",
            "<space>D",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "<space>q",
            "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "gD",
            "<cmd>lua vim.lsp.buf.declaration()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "gi",
            "<cmd>lua vim.lsp.buf.implementation()<CR>",
            { noremap = true, silent = true }
          )
        end

        lspconfig.bashls.setup({ on_attach = on_attach })

        lspconfig.cssls.setup({ on_attach = on_attach })

        lspconfig.dockerls.setup({ on_attach = on_attach })

        lspconfig.eslint.setup({
          on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.html.setup({ on_attach = on_attach })

        lspconfig.sqlls.setup({ on_attach = on_attach })

        lspconfig.sumneko_lua.setup({ cmd = { "lua-language-server" }, on_attach = on_attach })

        lspconfig.terraformls.setup({ on_attach = on_attach })

        lspconfig.tsserver.setup({
          capabilities,
          on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.vimls.setup({ on_attach = on_attach })

        lspconfig.yamlls.setup({ on_attach = on_attach })

        local null_ls = require("null-ls")

        null_ls.config({
          sources = {
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.write_good,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),
            null_ls.builtins.formatting.stylua,
          },
        })

        lspconfig["null-ls"].setup({ on_attach = on_attach })
      end,
    })

    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use({
      "jose-elias-alvarez/null-ls.nvim",
      commit = "c9c9cf7a47d216f22fd43aa835823926f6ff25d8",
    })

    -- ## Syntax highlighting

    -- Highlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use({ "p00f/nvim-ts-rainbow", commit = "2943a62d787e8b0ffa4dfc685036b262335889d3" })

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
      "norcalli/nvim-colorizer.lua",
      commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
      config = function()
        require("colorizer").setup({ "*" }, {
          mode = "background",
          css = true,
        })
      end,
    })

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      commit = "fe4e4aa286ba14e949948ef6e826d69c63048cdb",
      run = ":TSUpdate",
      config = function()
        local tree_sitter = require("nvim-treesitter.configs")

        ---------------------------
        -- General Configuration --
        ---------------------------

        tree_sitter.setup({
          ensure_installed = "maintained",

          autopairs = {
            enable = true,
          },
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
    })

    -- https://github.com/hashivim/vim-terraform
    use({ "hashivim/vim-terraform", commit = "f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443" })
    -- https://github.com/kchmck/vim-coffee-script
    use({ "kchmck/vim-coffee-script", commit = "28421258a8dde5a50deafbfc19cd9873cacfaa79" })

    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use({
      "hrsh7th/nvim-cmp",
      commit = "669803b9ffb31b3963afb4f05c1622fc48ab65cb",
      requires = {
        -- https://github.com/hrsh7th/cmp-buffer
        { "hrsh7th/cmp-buffer", commit = "5dde5430757696be4169ad409210cf5088554ed6" },
        -- https://github.com/hrsh7th/cmp-vsnip
        { "hrsh7th/vim-vsnip", commit = "9ac8044206d32bea4dba34e77b6a3b7b87f65df6" },
      },
      config = function()
        local cmp = require("cmp")

        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.o.completeopt = "menuone,noselect"

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = {
            { name = "buffer" },
            { name = "nvim_lsp" },
          },
        })
      end,
    })

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use({
      "sainnhe/sonokai",
      commit = "995c6d30ac2846c8230488246057c1ad1aa0b908",
      config = function()
        vim.g.sonokai_diagnostic_text_highlight = 1

        vim.cmd("colorscheme sonokai")
      end,
    })
  end,
  config = {
    max_jobs = 10,
  },
})
