local map = require("utils.map").map

-- shortcuts
map("kj", "<Esc>", "i")
map('<leader>q', ':q!<CR>')
map('<leader>w', ':w<CR>')

-- neo-tree
map('<leader>e', ':Neotree filesystem reveal right<CR>')
