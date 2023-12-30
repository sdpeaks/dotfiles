local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local filter = '--filter=blob:none'
  local repo = 'https://github.com/folke/lazy.nvim.git'
  local branch = '--branch=stable'
  vim.fn.system({ "git", "clone", filter, repo, branch, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
