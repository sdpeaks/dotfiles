--==============================================================================
-- S E T T I N G S
--==============================================================================

vim.opt.autochdir      = true
vim.opt.autoindent     = true
vim.opt.autoread       = true
vim.opt.autowrite      = true
vim.opt.backspace      = "indent,eol,start"
vim.opt.writebackup    = false
vim.opt.backup         = false
vim.opt.swapfile       = false
vim.opt.breakindent    = true
vim.opt.clipboard      = { "unnamed", "unnamedplus" }
vim.opt.cmdheight      = 1
-- vim.opt.cmdwinheight	
vim.opt.completeopt    = { "menu", "menuone", "noselect" }
-- vim.opt.completeslash	
-- vim.opt.concealcursor	
vim.opt.conceallevel   = 0
-- vim.opt.confirm	
-- vim.opt.cursorcolumn	
vim.opt.cursorline     = true
-- vim.opt.cursorlineopt	
vim.opt.errorbells     = false
vim.opt.expandtab      = true
vim.opt.foldenable     = false
-- vim.opt.foldexpr	-- nvim_treesitter#foldexpr()
vim.opt.foldlevel      = 1
vim.opt.foldlevelstart = 99
-- vim.opt.foldmethod	-- expression treesitter
vim.opt.foldnestmax    = 10
vim.opt.gdefault       = true -- Apply substitutions globally
vim.opt.hlsearch       = true
vim.opt.history        = 1000
vim.opt.ignorecase     = true
vim.opt.incsearch      = true
vim.opt.laststatus     = 3
-- vim.opt.lazyredraw	
vim.opt.linebreak	= true
vim.opt.mouse          = 'a'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.numberwidth    = 4
vim.opt.signcolumn     = "auto"
vim.opt.scrolloff      = 2
vim.opt.shiftwidth     = 4
-- vim.opt.showbreak	= "⤷ " -----
vim.opt.showcmd        = true
vim.opt.smartcase      = true
vim.opt.smartindent    = true
vim.opt.smarttab       = true
vim.opt.softtabstop    = 4
vim.opt.spell          = false
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.statusline     = "%f%m%r%h%w%=%{&ff}%=%l,%v  %p%% "
vim.opt.tabstop        = 4
vim.opt.timeoutlen     = 500
vim.opt.title          = false
vim.opt.undodir	= vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile	= true
vim.opt.wrap = false


--==============================================================================
-- K E Y M A P
--==============================================================================

--==============================================================================
-- A U T O C O M A N D S
--==============================================================================

-- indentations:
-- js: 2
-- py: 4
-- lua: 4
-- rust: 4

--==============================================================================
-- P L U G I N    I N S T A L L A T I O N
--==============================================================================

--==============================================================================
-- P L U G I N    C O N F I G U R A T I O N
--==============================================================================
