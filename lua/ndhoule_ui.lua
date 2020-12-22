--
-- Indentation Guides
--

vim.g.indent_guides_exclude_filetypes = {'fzf', 'help', 'nerdtree', 'packer'}

-- Pick indent guide colors manually (the default is generally too noisy, so here we choose more
-- muted colors)
vim.g.indent_guides_auto_colors = false
vim.cmd('autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven guibg=#212121 ctermbg=236')
vim.cmd('autocmd FileType * IndentGuidesEnable')

--
-- Whitespace
--

-- By default, vim-better-whitespace strips extra whitespace on save. This is better handled by the
-- configured formatter, so disable this behavior.
vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = false

-- Highlight EOL whitespace in red
vim.cmd('highlight ExtraWhitespace ctermbg=1')
