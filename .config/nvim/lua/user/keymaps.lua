-- open file explorer
-- vim.keymap.set("n", "<leader>e", "<cmd>25Lex<cr>", {desc = "File Explorer"})

-- lazygit
vim.keymap.set("n", "<leader>tg", ":LazyGit<cr>")

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
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<TAB>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>c", "<cmd>bd!<cr>", { desc = "Close buffer" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- fast line selection
vim.keymap.set("n", "vv", "V")
