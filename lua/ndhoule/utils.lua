local M = {}

M.load_module_file = function(module)
  -- placeholder for final return value
  local found_file = nil

  -- convert the module path to a file path (example user.init -> user/init.lua)
  local module_path = vim.fn.stdpath("config") .. "/lua/" .. module:gsub("%.", "/") .. ".lua"
  -- check if there is a readable file, if so, set it as found
  if vim.fn.filereadable(module_path) == 1 then
    found_file = module_path
  end

  -- if we found a readable lua file, try to load it
  local out = nil
  if found_file then
    -- try to load the file
    local status_ok, loaded_module = pcall(require, module)
    if status_ok then
      -- if successful at loading, set the return variable
      out = loaded_module
    else
      -- if unsuccessful, throw an error
      vim.api.nvim_err_writeln("Error loading file: " .. found_file .. "\n\n" .. loaded_module)
    end
  end

  -- return the loaded module or nil if no file found
  return out
end

return M
