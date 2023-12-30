M = {}


M.module = function(mod)
  package.loaded[mod] = nil
  local success, module_or_error = pcall(require, mod)
  if not success then
    print("Error loading module '" .. mod .. "':")
    print(module_or_error)
  end
end


M.directory = function(directory)
  local files = vim.fn.readdir(directory)
  if files then
    for _, file in ipairs(files) do
      if file:match("%.lua$") then
        local mod = directory .. "." .. file:gsub("%.lua$", "")
        M.module(mod)
      end
    end
  end
end


return M
