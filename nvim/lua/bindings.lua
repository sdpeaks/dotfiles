local utils = require "lua.utils"
local map = utils.map

vim.g.mapleader = " "

map("<leader>w", ":w<cr>")
map("<leader>q", ":q<cr>")
map("kj", [[<esc>:lua vim.g.select_mode = true<cr>]], { "i", "c" })
