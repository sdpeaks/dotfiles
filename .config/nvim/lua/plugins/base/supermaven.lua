return {
  "supermaven-inc/supermaven-nvim",
	event = "insertEnter",
  config = function()
    require("supermaven-nvim").setup({})
  end,
}
