-- =============================== SETTINGS ====================================

local opts = {
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
  numberwidth    = 4,
  signcolumn     = "auto",
  scrolloff      = 2,
  showcmd        = true,
  splitbelow     = true,
  splitright     = true,
  statusline     = "%f%m%r%h%w%=%{&ff}%=%l,%v  %p%% ",
  title          = false,
  whichwrap      = "b,h,l,s,<,>,[,],~",

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
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

-- =============================== MAPPINGS ====================================

vim.g.mapleader = " "

local function maps(mappings)
  for _, mapping in ipairs(mappings) do
    local lhs, rhs, mode, opts = unpack(mapping)

    local options = vim.tbl_extend("force", {
      noremap = true,
      silent = true
    }, opts or {})

    vim.keymap.set(mode or "n", lhs, rhs, options)
  end
end

maps({

  -- save and quit
  { "<leader>w", ":w<CR>" },
  { "<leader>q", ":q<CR>" },

  -- exit insert/command mode
  { "kj",        [[<Esc>:lua vim.g.select_mode = true<CR>]], { "i", "c" } },

})




-- ============================= AUTOCOMMANDS ==================================




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
  { "catppuccin/nvim",       name = "catppuccin" },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

}

-- lazy configuration
require("lazy").setup(plugins)

-- ============================ PLUGINS CONFIG =================================

-- colorscheme: darcubox
require('darcubox').setup {
  options = {
    transparent = true,
    styles = {
      comments = { italic = true },
      functions = { bold = true },
      keywords = { italic = true },
      types = { italic = true, bold = true },
    }
  }
}

vim.cmd "colorscheme catppuccin"

-- whick-key setup variables
local wk = require("which-key")
wk.register()
