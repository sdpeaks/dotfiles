M = {}

-- mapping function
function M.map(lhs, rhs, mode, opts)
  local options = vim.tbl_extend("force", {
    noremap = true,
    silent = true
  }, opts or {})

  vim.keymap.set(mode or "n", lhs, rhs, options)
end

-- plugin manager
function M.plugin_manager()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

return M
