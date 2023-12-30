M = {}


function M.map(lhs, rhs, mode, opts)
  local options = vim.tbl_extend("force", {
    noremap = true,
    silent = true
  }, opts or {})

  vim.keymap.set(mode or "n", lhs, rhs, options)
end


return M
