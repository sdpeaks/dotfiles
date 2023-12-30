return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup({
      unsure_installed = {
        "css",
        "html",
        "javascript",
        "svelte",
        "typescript",
        "tsx",
        "bash",
        "python",
        "go",
        "c_sharp",
        "lua",
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
