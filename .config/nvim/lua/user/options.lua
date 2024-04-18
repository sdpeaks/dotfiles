--
--  globals
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.markdown_recommended_style = 0 -- Set markdown tabs like global config
vim.o.termguicolors = true

-- Netrw
vim.g.netrw_banner = 0

--
-- options
--
local option = {
  number = true,
  relativenumber = true,
  clipboard = "unnamedplus",
  completeopt = "menuone,noinsert,noselect",
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  scrolloff = 5,
  shiftwidth = 2,
  showmatch = true,
  signcolumn = "yes",
  foldcolumn = "1",
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  wrap = false,
  updatetime = 250,
  timeoutlen = 500,
  foldenable = false,
  laststatus = 3,
  showtabline = 2,
}

for k, v in pairs(option) do
  vim.o[k] = v
end
