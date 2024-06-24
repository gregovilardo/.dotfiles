-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	-- color_scheme = "Kanagawa (Gogh)",
	color_scheme = "Gruvbox dark, hard (base16)",
	font = wezterm.font("JetBrains Mono Nerd Font"),
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		top = 10,
		bottom = 10,
	},
	-- leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "Enter",
			mods = "ALT",
			-- action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "n",
			mods = "ALT",
			-- action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "b",
			mods = "ALT",
			-- action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			key = "k",
			mods = "ALT",
			-- action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
		},
	},
}

-- and finally, return the configuration to wezterm
return config
