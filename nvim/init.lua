-- =============================== SETTINGS ====================================

local options = {
  -- Basic
  number         = true,
  relativenumber = true,
  cursorline     = true,
  mouse          = 'a',
  hlsearch       = true,
  ignorecase     = true,
  smartcase      = true,
  incsearch      = true,
  gdefault       = true,

  -- Display settings
  numberwidth    = 4,
  signcolumn     = "auto",
  scrolloff      = 2,
  showcmd        = true,
  splitbelow     = true,
  splitright     = true,
  statusline     = "%f%m%r%h%w%=%{&ff}%=%l,%v  %p%% ",
  title          = false,

  -- Text Display
  wrap           = false,
  breakindent    = true,
  conceallevel   = 0,
  linebreak      = true,
  shiftwidth     = 4,
  spell          = false,
  autoindent     = true,
  smartindent    = true,
  backspace      = "indent,eol,start",
  expandtab      = true,
  smarttab       = true,
  softtabstop    = 4,
  tabstop        = 4,
  foldenable     = false,
  foldlevel      = 1,
  foldlevelstart = 99,
  foldnestmax    = 10,

  -- Files
  autochdir      = true,
  autoread       = true,
  autowrite      = true,
  clipboard      = { "unnamed", "unnamedplus" },
  completeopt    = { "menu", "menuone", "noselect" },
  undodir        = vim.fn.stdpath("cache") .. "/undo",
  undofile       = true,
  writebackup    = false,
  backup         = false,
  swapfile       = false,
  errorbells     = false,
  timeoutlen     = 500,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- =============================== MAPPINGS ====================================

vim.g.mapleader = " "

local map = function(lhs, rhs, mode, opts)
  mode = mode or "n"
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- to normal mode from insert
map("kj", "<Esc>", "i")

-- start and end of line
map("H", "^", "n")
map("L", "$", "n")

-- move current line / block with Alt-j/k similar to vscode.
map("<A-j>", ":m .+1<CR>==", "n")
map("<A-k>", ":m .-2<CR>==", "n")
map("<A-j>", ":move '>+1<CR>gv-gv", "v")
map("<A-k>", ":move '<-2<CR>gv-gv", "v")

-- save and quit
map("<leader>w", ":w<CR>", "n")
map("<leader>q", ":q<CR>", "n")

-- Nvim tree
map("<leader>e", ":NvimTreeToggle<CR>", "n")

-- =============================== COMMANDS ====================================




-- =============================== PLUGINS  ====================================

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

-- list of plugins
local plugins = {
  -- colorscheme
  { "dotsilas/darcubox-nvim" },
}

-- lazy configuration
require("lazy").setup(plugins)

-- ============================ PLUGINS CONFIG =================================

-- colorscheme: darcubox
require('darcubox').setup {
  options = {
    transparent = true,
    styles = {
      comments = { italic = true },           -- italic
      functions = { bold = true },            -- bold
      keywords = { italic = true },
      types = { italic = true, bold = true }, -- italics and bold
    }
  }
}

vim.cmd "colorscheme darcubox"
