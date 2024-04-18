local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.on("update-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = name:gsub("_", " "):upper()
    name = name .. " "
  else
    name = "LOCK "
  end
  window:set_right_status(name or "")
end)

-- -----------------------------------------------------------------------------
-- Appearence
-- -----------------------------------------------------------------------------

-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("DroidSansM Nerd Font Mono", { weight = "Regular" })
-- config.font = wezterm.font("DejaVuSansM Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.line_height = 1
config.cell_width = 1
config.font_size = 11
config.color_scheme = "duckbones"
-- config.color_scheme = "duckbones"
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Dissonance (Gogh)'
config.initial_rows = 30
config.initial_cols = 120

-- tabs
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 25

config.window_background_gradient = {
  colors = {
    "hsla(30, 11%, 11%, 1)",
    "hsla(200, 18%, 7%, 1)",
  },
  orientation = {
    Radial = {
      cx = 0.75,
      cy = 0.75,
      radius = 1.25,
    },
  },
}

config.colors = {
  tab_bar = {
    background = "hsla(200, 18%, 7%, 0.0)",
    active_tab = {
      bg_color = "hsla(200, 18%, 7%, 0.7)",
      fg_color = "#c0c0c0",
      intensity = "Bold", -- "Half", "Bold"
      underline = "None", -- Specify whether you want "None", "Single" or "Double" underline for
      italic = false,
    },

    inactive_tab = {
      bg_color = "hsla(200, 18%, 7%, 0.3)",
      fg_color = "hsla(0, 0%, 20%)",
      intensity = "Half",
    },

    inactive_tab_hover = {
      bg_color = "hsla(200, 18%, 7%, 0.6)",
      fg_color = "hsla(0, 0%, 50%, 1)",
      italic = true,
    },

    new_tab = {
      bg_color = "hsla(200, 18%, 7%, 0.3)",
      fg_color = "hsla(200, 18%, 28%, 0.7)",
    },

    new_tab_hover = {
      bg_color = "hsla(200, 18%, 15%, 0.8)",
      fg_color = "hsla(200, 18%, 28%, 0.100)",
      intensity = "Bold", -- "Half", "Bold"
    },
  },
}

-- config.use_resize_increments = false
config.window_padding = {
  left = 3,
  right = 3,
  top = 3,
  bottom = 3,
}

config.window_frame = {
  border_left_width = 0,
  border_right_width = 0,
  border_bottom_height = 0,
  border_top_height = 0,
  border_left_color = "black",
  border_right_color = "black",
  border_bottom_color = "black",
  border_top_color = "black",
}

config.window_background_opacity = 0.9

config.disable_default_key_bindings = false
-- local binds = require("keybinds")

-- config.keys = binds.keys
-- config.key_tables = binds.key_tables

return config
