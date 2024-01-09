-- Activate : using ;
vim.keymap.set("n", ";", ":", { noremap = true })

-- Disable ex mode
vim.keymap.set("n", "Q", "<ESC>", { noremap = true })

-- Prevent F1 from toggling Vim's help menu
vim.keymap.set("n", "<F1>", "<ESC>", { noremap = true })
vim.keymap.set("i", "<F1>", "<ESC>", { noremap = true })
vim.keymap.set("v", "<F1>", "<ESC>", { noremap = true })

-- Close windows
vim.keymap.set("n", "<leader>w", ":close<CR>", { noremap = true })
vim.keymap.set("n", "<leader>W", ":only<cr>", { noremap = true })

-- Split panes
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { noremap = true })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { noremap = true })

-- Move down by displayed lines, not actual lines
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Remap Q to reformat paragraph text
vim.keymap.set("v", "Q", "gq", {})
vim.keymap.set("n", "Q", "gqap", {})

-- Move lines
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Clear any text highlighted by hlsearch
vim.keymap.set(
  "n",
  "<C-L>",
  ':nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>',
  { noremap = true, silent = true }
)

-- Yank the current filename to the clipboard
vim.keymap.set("n", "<Leader>f", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Toggle between regular numbering, relative numbering, no numbering
vim.keymap.set("n", "<F3>", ':exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>', { noremap = true, silent = true })

-- Toggle spell check
vim.keymap.set("n", "<F4>", ":set spell!<CR>", { noremap = true })

-- Diagnostics
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
