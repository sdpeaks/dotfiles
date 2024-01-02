return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "pyright",
          "gopls",
          "omnisharp",
          "html",
          "cssls",
          "lua_ls",
          "marksman",
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.omnisharp.setup({})
      lspconfig.marksman.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})

      -- keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end

  }
}
