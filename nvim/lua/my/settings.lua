-- globals
vim.g.mapleader = " "

-- Basic
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.mouse          = 'a'
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.incsearch      = true
vim.opt.gdefault       = true
vim.opt.numberwidth    = 4
vim.opt.signcolumn     = "auto"
vim.opt.scrolloff      = 2
vim.opt.showcmd        = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.statusline     = "%f%m%r%h%w%=%{&ff}%=%l,%v  %p%% "
vim.opt.title          = false
vim.opt.whichwrap      = "b,h,l,s,<,>,[,],~"

-- Display
vim.opt.wrap           = false
vim.opt.breakindent    = true
vim.opt.conceallevel   = 0
vim.opt.linebreak      = true
vim.opt.shiftwidth     = 4
vim.opt.spell          = false
vim.opt.autoindent     = true
vim.opt.smartindent    = true
vim.opt.backspace      = "indent,eol,start"
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.softtabstop    = 4
vim.opt.tabstop        = 4
vim.opt.foldenable     = false
vim.opt.foldlevel      = 1
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax    = 10

-- Files
vim.opt.autochdir      = true
vim.opt.autoread       = true
vim.opt.autowrite      = true
vim.opt.clipboard      = { "unnamed", "unnamedplus" }
vim.opt.completeopt    = { "menu", "menuone", "noselect" }
vim.opt.undodir        = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile       = true
vim.opt.writebackup    = false
vim.opt.backup         = false
vim.opt.swapfile       = false
vim.opt.errorbells     = false
