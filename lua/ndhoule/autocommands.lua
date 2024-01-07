-- Automatically rebalance splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically rebalance splits when window is resized",
  pattern = "*",
  command = "wincmd ="
})

vim.api.nvim_create_autocmd("BufReadPre", {
  desc =
  "Set a boolean (g:large_buf) that indicates whether the buffer exceeds the file limits set in g:filesize_limits.",
  callback = function(args)
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))

    if ok and stats and stats.size then
      vim.b[args.buf].is_buf_large = stats.size > vim.g.filesize_limits.size
    else
      vim.b[args.buf].is_buf_large = vim.api.nvim_buf_line_count(args.buf) > vim.g.filesize_limits.lines
    end
  end,
  group = vim.api.nvim_create_augroup("large_buf", { clear = true }),
})
