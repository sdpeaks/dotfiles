-- indentation go
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.tabstop = 4 -- 1 tab = 4 spaces
    vim.bo.shiftwidth = 4 -- indentation width
    vim.bo.softtabstop = 4 -- number of spaces in tab when editing
    vim.bo.expandtab = false -- use true tabs
  end,
})

-- remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- quit help
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true, silent = true })
  end,
})

-- no line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- wrap and break lines for text files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "html", "xml" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- save on focus lost
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})

-- checktime: reload files when they change on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime",
})

-- run python file in a new terminal window on right with <leader>r
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_set_keymap("n", "<leader>r", ":vsplit | terminal python3 %<CR>", { noremap = true, silent = true })
  end,
})

-- enter to search automatically in oil.nvim
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*oil://*",
--   callback = function()
--     vim.api.nvim_feedkeys("/", "n", false)
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, false, true), "n", false)
--     vim.api.nvim_feedkeys("/", "n", false)
--     vim.api.nvim_set_keymap('c', 'kj', '<ESC>', { noremap = true, silent = true })
--   end,
-- })
--
