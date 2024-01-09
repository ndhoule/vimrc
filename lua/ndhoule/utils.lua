local M = {}

M.throttle = function(fn, ms)
  local timer = vim.loop.new_timer()
  local running = false
  return function(...)
    if not running then
      timer:start(ms, 0, function()
        running = false
      end)
      running = true
      pcall(vim.schedule_wrap(fn), select(1, ...))
    end
  end
end

-- Force Treesitter to re-parse the current buffer.
M.treesitter_parse = function()
  local ts_parsers = require("nvim-treesitter.parsers")

  local lang = ts_parsers.ft_to_lang(vim.bo.filetype)
  local parser = ts_parsers.get_parser(vim.fn.bufnr(), lang)
  if parser then
    return parser:parse()
  else
    return false
  end
end

return M
