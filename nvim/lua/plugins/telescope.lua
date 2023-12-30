return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local find_files = require('telescope.builtin').find_files
    local live_grep = require('telescope.builtin').live_grep
    vim.keymap.set('n', 'ff', find_files)
    vim.keymap.set('n', 'fg', live_grep)
  end
}
