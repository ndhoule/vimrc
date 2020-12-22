--
-- Keybindings
--

vim.cmd('map <Leader>gws :Gstatus<CR>')
vim.cmd('map <Leader>gc :Gcommit<CR>')
vim.cmd('map <Leader>gl :Glog<CR>')
vim.cmd('map <Leader>gia :Gwrite<CR>')
vim.cmd('map <Leader>gwd :Gsdiff<CR>')
vim.cmd('map <Leader>gb :Gblame<CR>')

--
-- Configuration
--

-- Decrease the time before vim writes the swapfile, which also governs the delay before git gutter
-- marks are shown
vim.o.updatetime = 100
