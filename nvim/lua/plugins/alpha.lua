return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                   ",
            "          █ █     █  █     █     █  █           ",
            "          ██     █  █     █     ██           ",
            "          █ █          █     █  █           ",
            "                                                   ",
            "        https://github.com/dotsilas/dotfiles       ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "⌨  > Edit New", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "🔍 > Find files", ":cd $HOME/src/ | Telescope find_files<CR>"),
            dashboard.button("r", "⌛ > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "⚙  > Settings", ":e! $HOME/.config/nvim/lua/<CR>"),
            dashboard.button("H", "✅ > Checkhealth", ":checkhealth<CR>"),
            dashboard.button("q", "✖  > Quit", ":qa<CR>"),
        }
        local fortune = require("alpha.fortune")
        dashboard.section.footer.val = fortune()

        alpha.setup(dashboard.opts)
    end,
}
