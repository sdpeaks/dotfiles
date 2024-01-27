-- shortcuts
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- ramap defaults
-- vim.keymap.set("n", "<C-j>", ":join<CR>")

-- buffers
vim.keymap.set({ "n" }, "<S-j>", ":bprev<CR>")
vim.keymap.set({ "n" }, "<S-k>", ":bnext<CR>")
vim.keymap.set({ "n" }, "<leader>c", ":bd<CR>")

-- comands
vim.keymap.set("n", "<leader>.", ":Alpha<CR>")

-- windows movement
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- start and end of line
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- treesitter
vim.keymap.set("n", "<C-e>",
  function()
    local result = vim.treesitter.get_captures_at_cursor(0)
    print(vim.inspect(result))
  end
)
