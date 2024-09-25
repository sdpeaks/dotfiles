return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  config = function()
    local lspconfig = require("lspconfig")

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_buf_set_keymap

      -- go to
      keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
      keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

      -- code actions
      keymap(bufnr, "n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    end
  end,
}
