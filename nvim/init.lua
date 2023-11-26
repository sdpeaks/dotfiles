--==============================================================================
-- S E T T I N G S
--==============================================================================

-- backup
vim.opt.writebackup    = false
vim.opt.backup         = false
vim.opt.swapfile       = false

-- text diplay
vim.opt.wrap           = false
vim.opt.breakindent    = true
vim.opt.conceallevel   = 0
vim.opt.linebreak      = true
vim.opt.shiftwidth     = 4
vim.opt.spell          = false
-- vim.opt.showbreak	= "⤷ " -----

-- text formating and editing
vim.opt.autoindent     = true
vim.opt.smartindent    = true
vim.opt.backspace      = "indent,eol,start"
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.softtabstop    = 4
vim.opt.tabstop        = 4

-- folding
vim.opt.foldenable     = false
vim.opt.foldlevel      = 1
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax    = 10
-- vim.opt.foldexpr	-- nvim_treesitter#foldexpr()
-- vim.opt.foldmethod	-- expression treesitter

-- editor
vim.opt.cmdheight      = 1
vim.opt.cursorline     = true
vim.opt.history        = 1000
vim.opt.laststatus     = 3
vim.opt.mouse          = 'a'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.numberwidth    = 4
vim.opt.signcolumn     = "auto"
vim.opt.scrolloff      = 2
vim.opt.showcmd        = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.statusline     = "%f%m%r%h%w%=%{&ff}%=%l,%v  %p%% "
vim.opt.title          = false
-- vim.opt.cursorlineopt	
-- vim.opt.cmdwinheight	
-- vim.opt.cursorcolumn	

-- files
vim.opt.autochdir      = true
vim.opt.autoread       = true
vim.opt.autowrite      = true
vim.opt.clipboard      = { "unnamed", "unnamedplus" }
vim.opt.completeopt    = { "menu", "menuone", "noselect" }
vim.opt.undodir        = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile       = true
-- vim.opt.completeslash	
-- vim.opt.confirm	

-- searching
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.incsearch      = true
vim.opt.gdefault       = true -- Apply substitutions globally
-- vim.opt.lazyredraw	

-- error bells
vim.opt.errorbells     = false
vim.opt.timeoutlen     = 500

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

require("lazy").setup({

    -- colorscheme
    {"dotsilas/darcubox-nvim"},
})

--==============================================================================
-- P L U G I N    C O N F I G U R A T I O N
--==============================================================================

-- colorscheme
vim.cmd("colorscheme darcubox")





