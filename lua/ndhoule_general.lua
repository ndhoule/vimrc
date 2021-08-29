--
-- Plugin Setup
--

-- TODO(ndhoule): Move me elsewhere
vim.g.scratch_no_mappings = 1
vim.g.ale_disable_lsp = 1

--
-- General Configuration
--

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

--
-- UI
--

vim.o.termguicolors = true           -- Use 24-bit color
vim.o.title = true                   -- Set terminal title
vim.o.wildmode = 'list:longest'      -- Show wildmenu in tall list
vim.wo.colorcolumn = '100'           -- Show warning column at 100 characters
vim.wo.list = true
vim.wo.listchars = 'tab:→ ,trail:·'  -- Show glyphs in place of special whitespace characters
vim.wo.number = true                 -- Show line number in gutter

--
-- Text display/formatting
--

vim.o.expandtab = true   -- <Tab> inserts spaces
vim.o.shiftround = true  -- Round indentation to nearest multiple of `shiftwidth`
vim.o.shiftwidth = 2     -- Spaces to use for autoindent
vim.o.softtabstop = 2    -- <Tab> inserts n spaces
vim.o.tabstop = 2        -- <Tab> inserts n spaces
vim.o.textwidth = 100    -- Automatically wrap long lines

--
-- Search
--

vim.o.hlsearch = true         -- Highlight all search matches
vim.o.ignorecase = true       -- Ignore case when searching
vim.o.smartcase = true        -- Don't ignore case in search when term contains an uppercase char
vim.o.inccommand = 'nosplit'  -- Show substitutions incrementally, as you type them

--
-- Keybindings
--
-- TODO(ndhoule): Is there a better Lua API for key remaps than using vim.cmd?
--

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
