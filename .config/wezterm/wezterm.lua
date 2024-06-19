local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

local config = wezterm.config_builder()

config.color_scheme = "Dracula"

config.default_prog = { "/home/theopomies/.cargo/bin/zellij" }

config.font_size = 16.0
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.window_decorations = "NONE"

config.macos_window_background_blur = 30

config.window_padding = {
	top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
