-- Disable unused built-in plugins
local disabled_plugins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit", -- Required for vim-matchup
  "matchparen", -- Required for vim-matchup
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "optwin",
  "rplugin",
  "rrhelper",
  "spellfile_plugin",
  "synmenu",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in ipairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Limits for large files used to disable functionality
vim.g.filesize_limits = {
  lines = 20000,
  size = 1024 * 127,
}

---------------------------
-- General Configuration --
---------------------------

vim.g.mapleader = ","

vim.opt.modelineexpr = true -- Allow expressions in modelines

-- Enable backup files
vim.opt.backup = true
-- Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
-- https://webpack.js.org/guides/development/#adjusting-your-text-editor
vim.opt.backupcopy = "yes"
-- Don't store backup files in their working directories, store them in the default state directory
vim.opt.backupdir:remove(".")

-- Enable swapfiles
vim.opt.swapfile = true

-- Enable persistent undofiles
vim.opt.undofile = true

-- Store netrw files in cache directory
vim.g.netrw_home = vim.fn.stdpath("state") .. "/nvim"

vim.opt.autochdir = true -- Set cwd to the current buffer's containing directory
vim.opt.autowrite = true -- Save before executing shell commands to prevent working on a stale file
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.scrolljump = 5 -- Scroll five lines at a time (perf)
vim.opt.synmaxcol = 300 -- Limit syntax highlighting to 300 columns wide (perf)
vim.opt.foldlevelstart = 100 -- Don't fold on fileopen
vim.opt.foldlevelstart = 100 -- Don't fold on fileopen
vim.opt.foldmethod = "expr" -- Use Treesitter for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding

--------
-- UI --
--------

vim.opt.termguicolors = true -- Use 24-bit color
vim.opt.title = true -- Set terminal title
vim.opt.wildmode = "list:longest" -- Show wildmenu in tall list
vim.wo.colorcolumn = "100" -- Show warning column at 100 characters
vim.wo.cursorline = true -- Highlight the (horizontal) line the cursor is currently on
vim.wo.list = true
vim.wo.listchars = "tab:→ ,trail:·" -- Show glyphs in place of special whitespace characters
vim.wo.number = true -- Show line number in gutter
vim.wo.signcolumn = "yes"

-- Decrease the time before vim writes the swapfile, which also governs the delay before gutter
-- marks (e.g. VCS, lightbulb) are shown
vim.opt.updatetime = 100

-----------------------------
-- Text display/formatting --
-----------------------------

vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftround = true -- Round indentation to nearest multiple of `shiftwidth`
vim.opt.shiftwidth = 2 -- Spaces to use for autoindent
vim.opt.softtabstop = 2 -- <Tab> inserts n spaces
vim.opt.tabstop = 2 -- <Tab> inserts n spaces
vim.opt.textwidth = 100 -- Automatically wrap long lines

------------
-- Search --
------------

vim.opt.incsearch = true -- Highlight matches while typing
vim.opt.hlsearch = true -- Highlight all search matches
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Don't ignore case in search when term contains an uppercase char
vim.opt.inccommand = "nosplit" -- Show substitutions incrementally, as you type them
