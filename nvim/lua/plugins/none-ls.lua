return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.formatting.stylua,

				-- javascript
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.prettier,

				-- go
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.goimports_reviser,

				-- python
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.formatting.black,
			},
		})

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
	end,
}
