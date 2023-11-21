local function map(lhs, rhs, mode, opts)
    local options = { noremap = true, silent = true }
    mode = mode or "n"

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

-- autopairs
map("(", "()<Esc>i", "i")
map("{", "{}<Esc>i", "i")
map("[", "[]<Esc>i", "i")
map('"', '""<Esc>i', "i")
map("'", "''<Esc>i", "i")

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
