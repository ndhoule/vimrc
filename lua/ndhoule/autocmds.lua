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

-- Highlight trailing whitespace
-- TODO(ndhoule): Translate to Lua and add ability to omit file and/or buffer types
vim.cmd([[
let g:toggleHighlightWhitespace = 1
function! ToggleHighlightWhitespace()
  let g:toggleHighlightWhitespace = 1 - g:toggleHighlightWhitespace
  call RefreshHighlightWhitespace()
endfunction

function! RefreshHighlightWhitespace()
  if g:toggleHighlightWhitespace == 1 " normal action, do the hi
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    augroup HighlightWhitespace
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
      autocmd BufWinLeave * call clearmatches()
    augroup END
  else
    " clear whitespace highlighting
    call clearmatches()
    autocmd! HighlightWhitespace BufWinEnter
    autocmd! HighlightWhitespace InsertEnter
    autocmd! HighlightWhitespace InsertLeave
    autocmd! HighlightWhitespace BufWinLeave
  endif
endfunction

autocmd BufWinEnter * call RefreshHighlightWhitespace()
autocmd BufWinLeave * call RefreshHighlightWhitespace()
]])
