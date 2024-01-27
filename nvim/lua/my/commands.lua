-- Use absolute line numbers during insert mode only
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  desc = "Display absolute line number in Insert mode",
  callback = function(opts)
    if vim.wo.number then
      vim.wo.relativenumber = opts.event == "InsertLeave"
    end
  end,
})

-- Use absolute numbers on unfocused windows
vim.api.nvim_create_autocmd({ "WinLeave", "WinEnter" }, {
	desc = "Display absolute line number on inactive windows",
	callback = function(opts)
		if vim.wo.number then
			vim.wo.relativenumber = opts.event == "WinEnter"
		end
	end,
})

-- Don't show any numbers inside terminals
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})

-- Filetype specific indenting
vim.api.nvim_create_autocmd("FileType", {
	desc = "Display absolute line number on inactive windows",
	pattern = "python",
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
	end,
})
