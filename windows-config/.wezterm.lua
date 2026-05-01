-- ~/.wezterm.lua
local wezterm = require("wezterm")

return {
	window_background_opacity = 0.95,
	--color_scheme = "Afterglow",
	--color_scheme = "Andromeda",
	--color_scheme = "Apprentice (base16)",
	color_scheme = "Aura (Gogh)",
	--color_scheme = 'Ayu Mirage',
	--color_scheme = "Atelierheath (dark) (terminal.sexy)",
	--color_scheme = "Atelierlakeside (dark) (terminal.sexy)",
	default_prog = { "C:/Program Files (x86)/PowerShell/7/pwsh.exe" }, -- PowerShell 7
	default_cwd = wezterm.home_dir .. "/dev",
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{
			key = "e",
			mods = "ALT",
			action = wezterm.action.SplitHorizontal({
				args = { "yazi" },
			}),
		},

		{
			key = "h",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
	},
}
