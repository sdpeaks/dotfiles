-- globals
vim.g.mapleader = " "

---- STATUS LINE ---------------------------------------------------------------

vim.opt.statusline = " %f %=%= %l:%v  %p%% "

--------------------------------------------------------------------------------

-- Basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "auto"
vim.opt.scrolloff = 2
vim.opt.showcmd = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3
-- vim.opt.statusline     = " %f%m%r%h%w%=%=%l,%v  %p%% "
vim.opt.title = false
vim.opt.whichwrap = "b,h,l,s,<,>,[,],~"
vim.opt.timeoutlen = 350

-- Display
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.conceallevel = 0
vim.opt.linebreak = true
vim.opt.shiftwidth = 2
vim.opt.spell = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.g.markdown_recommended_style = 0 -- markdown tabs like global config

-- Files
vim.opt.autochdir = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.errorbells = false


--- REFERENCE ------------------------------------------------------------------
-- vim.g.loaded_matchparen = 1

-- local options = {
--   -- Have persistent undo per buffer, writes undo files
--   undofile = true,
--   -- Creates swap file with unsaved buffer changes. Can help against inadvertedly modifying the same buffer in multiple windows. Can help with restoring changes after crash. For me swap file warnings waste my time and I want to be able to open the same file in multiple buffers.
--   swapfile = false,
--   -- Make backup file prior to saving. 
--   writebackup = false,
--   -- Do not remove backup file after successful save (only used when writebackup is on).
--   backup = false,
--   -- Hide buffers with unsaved changes instead of closing them, used by toggleterm to preserve state.
--   hidden = true,

--   -- Allow the mouse to be used
--   mouse = "a",

--   -- Operations which would normally use the unnamed registry use the system clipboard (*) instead.
--   clipboard = "unnamedplus",

--   -- Popup menu height.
--   pumheight = 10,
--   -- Use the same menu when one or more options, don't select any option by default.
--   completeopt = { "menuone", "noselect" },

--   -- Timout sequenced key mappings.
--   timeout = true,
--   -- Time to wait until timeout (only used when timeout is on). WhichKey disables timout and shows panel after this time instead.
--   timeoutlen = 1000,
--   -- Time both until cursor hold from key down and until completion when nothing is typed.
--   updatetime = 100,

--   -- highlight the current line.
--   cursorline = true,

--   -- Show partial sequential command. WhichKey panel also shows this.
--   showcmd = false,
--   -- I think this shows the mode on the last line in cmd. I show mode with plugins like lualine instead.
--   showmode = false,
--   -- Use '2' to always show tabline. I think this line is used by bufferline to show buffers and tabs.
--   showtabline = 2,
--   -- Show position of cursor. This job can also be handled by plugins like Lualine.
--   ruler = false,
--   -- How to handle some kind of conceal syntax. Don't know more. Supposedly good to turn off so that `` is visible in markdown files.
--   conceallevel = 0,

--   -- set numbered lines
--   number = true,
--   -- set relative numbered lines.
--   relativenumber = true,
--   -- Set number column width to 2.
--   numberwidth = 2,
--   -- Always show the sign column, otherwise it would shift the text each time.
--   signcolumn = "yes",

--   -- Tab inputs are expanded to spaces.
--   expandtab = true,
--   -- The number of spaces inserted for each indentation/tab input.
--   shiftwidth = 2,
--   -- A line starting with a tab will appear indented this many characters.
--   tabstop = 2,

--   -- By default new windows are created above.
--   splitbelow = true,
--   -- By default new windows are created to the left.
--   splitright = true,

--   -- Minumum visible lines above/under cursor.
--   scrolloff = 8,
--   -- Minimum visible lines left/right of cursor.
--   sidescrolloff = 8,

--   -- Use tree sitter for folding (I haven't looked at why LunarVim doesn't do this by default)
--   -- foldmethod = "expr",
--   -- expr = "nvim_treesitter#foldexpr()",
--   -- Start with folds open.
--   foldenable = false,
--   -- Max fold levels, I think 2 should be enough.
--   foldnestmax = 2,

--   -- Ignore case in search patterns
--   ignorecase = true,
--   -- Ignore case only if only lower case is used (only used when ignorecase is on)
--   smartcase = true,
--   -- highlight all matches on previous search pattern
--   hlsearch = true,

--   -- Display long lines without wrapping
--   wrap = false,
--   -- Wrapped lines continue with the same indent
--   breakindent = true,

--   -- Use "gui" colors instead of "cterm" colors in TUI. Requries terminal compatible with some ISO, most terminals are.
--   termguicolors = true,

--   -- The encoding written to a file.
--   fileencoding = "utf-8",
-- }

-- for k, v in pairs(options) do
--   vim.opt[k] = v
-- end

-- -- Apparently used to get rid of some redundant messages
-- vim.opt.shortmess:append "c"
-- -- Get rid of intro message when starting vim. Something is causing it to flicker and dissapear anyway and I don't need it.
-- vim.opt.shortmess:append "I"

-- -- This left/right cursor keys to move to the previous/next line after reacking first/last character of line.
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
