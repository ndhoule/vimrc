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
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
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
    use({ "tpope/vim-repeat" })

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use({ "EinfachToll/DidYouMean" })

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use({
      "mtth/scratch.vim",
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
    use({ "vim-scripts/Rename" })

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use({ "bronson/vim-visual-star-search" })

    -- https://github.com/ironhouzi/starlite-nvim
    use({
      "ironhouzi/starlite-nvim",
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
      branch = "0.1.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope git_files<CR>", { noremap = true })
      end,
    })

    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use({
      "liuchengxu/vista.vim",
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
    -- https://github.com/SidOfc/carbon.nvim
    use({
      "SidOfc/carbon.nvim",
      config = function()
        require("carbon").setup({
          auto_open = true,
        })

        vim.api.nvim_set_keymap("n", "<leader>n", ":Lexplore<CR>", { noremap = true })
      end,
    })

    -- https://github.com/folke/zen-mode.nvim
    use({
      "folke/zen-mode.nvim",
      config = function()
        vim.api.nvim_set_keymap("n", "<Leader>gz", '<cmd>lua require("zen-mode").toggle()<CR>', { silent = true })
      end,
    })

    -- ## Statusline

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
      "nvim-lualine/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("lualine").setup({
          theme = "jellybeans",
        })
      end,
    })

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    -- https://github.com/christoomey/vim-sort-motion
    use({ "christoomey/vim-sort-motion" })

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use({ "gcmt/wildfire.vim" })

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use({ "b3nj5m1n/kommentary" })

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use({
      "machakann/vim-sandwich",
      config = function()
        -- Set up surround.vim-compatible keybindings for vim-sandwich
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")

        require("kommentary.config").configure_language("default", {
          prefer_single_line_comments = true,
        })
      end,
    })

    -- https://github.com/andymass/vim-matchup
    use({ "andymass/vim-matchup" })

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- https://github.com/SidOfc/mkdx
    use({ "SidOfc/mkdx" })

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use({ "tpope/vim-dispatch" })

    -- https://github.com/folke/trouble.nvim
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          auto_open = true,
          auto_preview = false,
          mode = "document_diagnostics",
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
      run = ":VimspectorUpdate",
      config = function()
        -- TODO(ndhoule): Vimspector warned about this once; do I need to set this?
        -- let g:vimspector_base_dir='/home/ndhoule/.local/share/nvim/site/pack/packer/start/vimspector'

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
    use({ "mhinz/vim-signify" })

    use({
      "tanvirtin/vgit.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use({
      "tpope/vim-fugitive",
      requires = {
        -- https://github.com/tpope/vim-rhubarb
        { "tpope/vim-rhubarb" },
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
    --   use({ "direnv/direnv.vim" })
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    -- https://github.com/editorconfig/editorconfig-vim
    use({ "editorconfig/editorconfig-vim" })

    -- Add support for project configuration files ('projections')
    -- https://github.com/tpope/vim-projectionist
    use({
      "tpope/vim-projectionist",
      config = function()
        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>aa", ":A<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>as", ":AS<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>av", ":AV<CR>", { noremap = true })
      end,
    })

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/windwp/nvim-autopairs
    use({
      "windwp/nvim-autopairs",
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
      requires = { "jose-elias-alvarez/null-ls.nvim", "hrsh7th/cmp-nvim-lsp" },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")

        -- nvim-cmp supports LSP completions; advertise to LSP that we want them
        local capabilities = cmp_lsp.default_capabilities()

        local on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
              augroup format
                autocmd!
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true, timeout_ms = 10000 })
              augroup END
            ]])
          end

          -----------------
          -- Keybindings --
          -----------------

          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<space>f",
              "<cmd>lua vim.lsp.buf.format({ async = true, timeout_ms = 10000 })<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.referencesProvider then
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
          if client.server_capabilities.definitionProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { noremap = true, silent = true }
            )
          end

          if client.server_capabilities.hoverProvider then
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
          if client.server_capabilities.renameProvider then
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
          if client.server_capabilities.signatureHelpProvider then
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

        lspconfig.bashls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.cssls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.dockerls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.eslint.setup({
          capabilities,
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.html.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.sqlls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.sumneko_lua.setup({
          capabilities,
          cmd = { "lua-language-server" },
          on_attach = on_attach,
        })

        lspconfig.terraformls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.tsserver.setup({
          capabilities,
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.vimls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.yamlls.setup({
          capabilities,
          on_attach = on_attach,
        })

        local null_ls = require("null-ls")

        null_ls.setup({
          capabilities,
          on_attach = on_attach,
          sources = {
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.write_good,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),
            null_ls.builtins.formatting.stylua,
          },
        })
      end,
    })

    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- ## Syntax highlighting

    -- Highlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use({ "p00f/nvim-ts-rainbow" })

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
      "norcalli/nvim-colorizer.lua",
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
      run = ":TSUpdate",
      config = function()
        local tree_sitter = require("nvim-treesitter.configs")

        ---------------------------
        -- General Configuration --
        ---------------------------

        tree_sitter.setup({
          ensure_installed = "all",

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
    use({ "hashivim/vim-terraform" })
    -- https://github.com/kchmck/vim-coffee-script
    use({ "kchmck/vim-coffee-script" })

    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        -- https://github.com/hrsh7th/cmp-buffer
        { "hrsh7th/cmp-buffer" },
        -- https://github.com/hrsh7th/cmp-vsnip
        {
          "hrsh7th/cmp-vsnip",
          requires = {
            -- https://github.com/hrsh7th/vim-vsnip
            { "hrsh7th/vim-vsnip" },
          },
        },
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
            { name = "vsnip" },
          },
          view = {
            entries = "native",
          },
        })
      end,
    })

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use({
      "sainnhe/sonokai",
      config = function()
        vim.g.sonokai_diagnostic_text_highlight = 1

        vim.cmd("colorscheme sonokai")
      end,
    })
  end,
  config = {
    max_jobs = 10,
    snapshot = "versions.json",
    snapshot_path = vim.fn.stdpath("config"),
  },
})
