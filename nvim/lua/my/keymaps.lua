-- shortcuts
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- buffers
vim.keymap.set({ "n" }, "<leader>bb", ":bprev<CR>")
vim.keymap.set({ "n" }, "<leader>bn", ":bnext<CR>")

-- comands
vim.keymap.set("n", "<leader>.", ":Alpha<CR>")
