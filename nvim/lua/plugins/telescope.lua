local map = require("utils.map").map

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local find_files = require('telescope.builtin').find_files
    local live_grep = require('telescope.builtin').live_grep
    map('ff', find_files)
    map('fg', live_grep)

  end
}
