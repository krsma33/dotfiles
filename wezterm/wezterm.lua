-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_cols = 110
config.initial_rows = 35

config.default_prog = { "pwsh" }

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 13

config.default_cursor_style = "SteadyBar"

config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

config.window_frame = {
	font_size = 10,
	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.colors = {

	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#15161E",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#15161E",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#1f212d",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#2a2c3c",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1f212d",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#2a2c3c",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},

	-- The default text color
	foreground = "#B3C6E6",
	-- The default background color
	background = "#15161E",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#A288F7",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#fefff2",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#53AA5E",

	-- the foreground color of selected text
	selection_fg = "#b5b5b5",
	-- the background color of selected text
	selection_bg = "#33467C",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#444444",

	ansi = {
		"#2D283F",
		"#ED2261",
		"#1FA91B",
		"#9ECE6A",
		"#487DF4",
		"#8D35C9",
		"#3BDEED",
		"#9E9EA8",
	},
	brights = {
		"#59516A",
		"#F8729A",
		"#53AA5E",
		"#9ECE6A",
		"#A9BCEC",
		"#AD81C2",
		"#9DE3EB",
		"#A288F7",
	},
}

config.window_background_opacity = 0.9

config.allow_win32_input_mode = false

local active_table_name = ""

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	active_table_name = window:active_key_table()
	if active_table_name == "copy_mode" then
		active_table_name = ""
	elseif active_table_name == "vim" then
		active_table_name = ": Vim mode"
	end
	window:set_right_status(active_table_name or "")
end)

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	return index .. active_table_name .. ": " .. tab.active_pane.title
end)

config.keys = {
	{
		key = "Space",
		mods = "CTRL",
		action = act.DisableDefaultAssignment,
	},
	{
		key = "Space",
		mods = "CTRL|SHIFT",
		action = act.DisableDefaultAssignment,
	},
	{
		key = "F11",
		mods = "",
		action = act.ToggleFullScreen,
	},
	{
		key = "i",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "vim",
			one_shot = false,
			replace_current = true,
		}),
	},
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("PrimarySelection"),
	},
}

config.key_tables = {
	vim = {
		{
			key = "h",
			mods = "CTRL",
			action = act.SendKey({ key = "LeftArrow" }),
		},
		{
			key = "j",
			mods = "CTRL",
			action = act.SendKey({ key = "DownArrow" }),
		},
		{
			key = "k",
			mods = "CTRL",
			action = act.SendKey({ key = "UpArrow" }),
		},
		{
			key = "l",
			mods = "CTRL",
			action = act.SendKey({ key = "RightArrow" }),
		},
		{
			key = "b",
			mods = "CTRL",
			action = act.SendKey({ key = "Home" }),
		},
		{
			key = "e",
			mods = "CTRL",
			action = act.SendKey({ key = "End" }),
		},

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
