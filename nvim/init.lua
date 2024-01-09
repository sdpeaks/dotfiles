local load = require("utils.load").module

load("my.settings")
load("my.plugins")
load("my.keymaps")
load("my.commands")
-- load("colors.darcubox")

pcall(vim.cmd.colorscheme, "darcubox")
