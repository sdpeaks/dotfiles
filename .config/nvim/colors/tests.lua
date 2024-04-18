vim.cmd.hi("clear")

-- background
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ffffff" })

-- syntax
vim.api.nvim_set_hl(0, "Comment", { fg = "#404040" })
vim.api.nvim_set_hl(0, "Constant", { fg = "#52a240" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffd072" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#dd4e21" })
vim.api.nvim_set_hl(0, "PreProc", { fg = "#fb982e" })
vim.api.nvim_set_hl(0, "Type", { fg = "#008080" })
vim.api.nvim_set_hl(0, "Special", { fg = "#ffffff" })
