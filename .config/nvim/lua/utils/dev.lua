local M = {}

local function expand_if_exists(dir)
  local expanded_dir = vim.fn.expand(dir)
  if vim.fn.isdirectory(expanded_dir) == 1 then
    return expanded_dir
  else
    return nil
  end
end

function M.load(paths)
  if type(paths) == "string" then
    paths = { paths }
  end

  for _, path in ipairs(paths) do
    local plugin_path = expand_if_exists(path)
    if plugin_path then
      vim.opt.runtimepath:prepend(plugin_path)
    else
      vim.api.nvim_err_writeln("Dir not found: " .. path)
    end
  end
end

return M
