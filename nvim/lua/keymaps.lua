-- shortcuts
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- buffers
vim.keymap.set({ "n" }, "<leader>bb", ":bprev<CR>")
vim.keymap.set({ "n" }, "<leader>bn", ":bnext<CR>")

-- comands
vim.keymap.set("n", "<leader>.", ":Alpha<CR>")

-- windows movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-S-l>", "<C-w>L")
vim.keymap.set("n", "<C-S-h>", "<C-w>H")
vim.keymap.set("n", "<C-S-j>", "<C-w>J")
vim.keymap.set("n", "<C-S-k>", "<C-w>K")
