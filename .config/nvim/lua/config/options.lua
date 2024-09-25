vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldcolumn = "1"
vim.opt.foldenable = false
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 0
vim.opt.shortmess:append("I")
vim.opt.fillchars = {
  fold = " ",
  foldopen = "", -- •
  foldclose = "",
  foldsep = " ",
}

vim.opt.statuscolumn = "%s%=%{v:virtnum == 0 ? (v:relnum == 0 ? v:lnum : v:relnum) : ''} %C "
-- vim.o.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} %C "
