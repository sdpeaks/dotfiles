-- exit insert mode
vim.keymap.set("i", "kj", "<ESC>")
-- vim.keymap.set("i", "jk", "<ESC>")
-- vim.keymap.set("i", "kk", "<ESC>")
-- vim.keymap.set("i", "jj", "<ESC>")

-- clear highlight search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better search
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- windows movement
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Go to right window", remap = true })

-- resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- buffers
vim.keymap.set("n", "gp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>c", "<cmd>bd!<cr>", { desc = "Close buffer" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- terminal movement
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")
vim.keymap.set("t", "<C-Left>", "<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-Down>", "<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-Up>", "<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-Right>", "<C-\\><C-N><C-w>l")

-- recent file
-- vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>b#<CR>", { noremap = true, silent = true })
