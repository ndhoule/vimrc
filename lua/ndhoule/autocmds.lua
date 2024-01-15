vim.api.nvim_create_autocmd("VimResized", {
  desc = "Automatically rebalance splits when the window is resized",
  pattern = "*",
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("BufReadPre", {
  desc = "Set a boolean (g:large_buf) indicating if the buffer exceeds the limits set in g:filesize_limits.",
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

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePost" }, {
  desc = "Trigger an event (User LazyFile) when a non-empty buffer is opened",
  group = vim.api.nvim_create_augroup("file_user_events", { clear = true }),
  callback = function(args)
    local current_file = vim.fn.resolve(vim.fn.expand("%"))
    if not (current_file == "" or vim.api.nvim_get_option_value("buftype", { buf = args.buf }) == "nofile") then
      vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
    end
  end,
})
