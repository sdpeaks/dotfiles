M = {}

local wezterm = require("wezterm")

-- keymap modes
--    - lock
--      - change to lock
--      - change to normal
--    - normal
--      - all pane, tab and windows
--      - scroll
--      - select
--      - quick select
--      - hyperlinks

M.keys = {
	-- ---------------------------------------------------------------------------
	-- MODES
	-- ---------------------------------------------------------------------------

	{
		key = ":",
		mods = "ALT|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},

	{
		key = "s",
		mods = "ALT",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActiveKeepFocus",
			show_pane_ids = true,
		}),
	},

	{
		key = "m",
		mods = "ALT",
		action = wezterm.action.PaneSelect({
			mode = "MoveToNewTab",
		}),
	},

	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	{ key = "{", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "}", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },

	{
		key = "T",
		mods = "ALT",
		action = wezterm.action.ShowTabNavigator,
	},

	{
		key = "u",
		mods = "ALT",
		action = wezterm.action.ActivateKeyTable({
			name = "lock",
			one_shot = false,
		}),
	},

	{
		key = "p",
		mods = "ALT",
		action = wezterm.action.ActivateKeyTable({
			name = "pane",
			one_shot = false,
		}),
	},

	-- resize
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	-- ---------------------------------------------------------------------------
	-- PANELS                                                                   --
	-- ---------------------------------------------------------------------------

	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "f",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},
}

M.key_tables = {

	lock = {
		{ key = "u", mods = "ALT", action = "PopKeyTable" },
	},

	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "r", mods = "ALT", action = "PopKeyTable" },
	},

	pane = {
		{
			-- create
			key = "o",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				-- domain = 'CurrentPaneDomain',
				direction = "Down",
			}),
		},
		{
			key = "O",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				-- domain = 'CurrentPaneDomain',
				direction = "Up",
			}),
		},
		{
			key = "a",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				-- domain = 'CurrentPaneDomain',
				direction = "Right",
			}),
		},
		{
			key = "i",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				-- domain = 'CurrentPaneDomain',
				direction = "Left",
			}),
		},
	},
}

return M
