--
-- Feature Flags
--

vim.g.ENABLE_COMPLETION_NVIM = vim.env.ENABLE_COMPLETION ~= "0"
vim.g.ENABLE_LSP = vim.env.ENABLE_NATIVE_LSP ~= "0"
vim.g.ENABLE_TREESITTER = vim.env.ENABLE_TREESITTER == "1"

--
-- Plugin Setup
--

-- TODO(ndhoule): Move me elsewhere
vim.g.scratch_no_mappings = 1
vim.g.rainbow_active = 1
vim.g.ale_disable_lsp = 1

--
-- General Configuration
--

vim.o.modelineexpr = true  -- Allow expressions in modelines

-- Enable backup files
vim.o.backup = true
-- Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
-- https://webpack.js.org/guides/development/#adjusting-your-text-editor
vim.o.backupcopy = 'yes'
vim.o.backupdir = vim.fn.stdpath('cache') .. '/backup//'
if not vim.fn.isdirectory(vim.o.backupdir) then
  vim.fn.mkdir(vim.o.backupdir, 'p')
end

-- Enable swapfiles
vim.o.swapfile = true
vim.o.directory = vim.fn.stdpath('cache') .. '/swap//'
if not vim.fn.isdirectory(vim.o.directory) then
  vim.fn.mkdir(vim.o.directory, 'p')
end

-- Enable persistent undofiles
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo//'
if not vim.fn.isdirectory(vim.o.undodir) then
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
vim.cmd('nnoremap ; :')

-- Disable ex mode
vim.cmd('nnoremap Q <ESC>')

-- Prevent F1 from toggling Vim's help menu
vim.cmd('nnoremap <F1> <ESC>')
vim.cmd('inoremap <F1> <ESC>')
vim.cmd('vnoremap <F1> <ESC>')

-- Close windows
vim.cmd('noremap <leader>w :close<CR>')
vim.cmd('noremap <leader>W :only<CR>')

-- Split panes
vim.cmd('nnoremap <Leader>vs :vsplit<CR>')
vim.cmd('nnoremap <Leader>hs :split<CR>')

-- Move down by displayed lines, not actual lines
vim.cmd('nnoremap j gj')
vim.cmd('nnoremap k gk')

-- Remap Q to reformat paragraph text
vim.cmd('vmap Q gq')
vim.cmd('nmap Q gqap')

-- Move lines
vim.cmd('inoremap <A-j> <Esc>:m .+1<CR>==gi')
vim.cmd('nnoremap <A-j> :m .+1<CR>==')
vim.cmd('vnoremap <A-j> :m \'>+1<CR>gv=gv')
vim.cmd('nnoremap <A-k> :m .-2<CR>==')
vim.cmd('inoremap <A-k> <Esc>:m .-2<CR>==gi')
vim.cmd('vnoremap <A-k> :m \'<-2<CR>gv=gv')

-- Clear any text highlighted by hlsearch
vim.cmd('nnoremap <silent> <C-L> :nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>')

-- Yank the current filename to the clipboard
vim.cmd('noremap <silent> <Leader>f :let @+=expand("%:p")<CR>')

-- Toggle between regular numbering, relative numbering, no numbering
vim.cmd('nmap <silent> <F3> :exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>')

-- Toggle spell check
vim.cmd('nnoremap <F4> :set spell!<CR>')
