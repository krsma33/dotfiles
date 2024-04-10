-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
local path_separator = package.config:sub(1, 1)
local is_linux = path_separator == "/"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_cols = 110
config.initial_rows = 35

config.ssh_domains = wezterm.default_ssh_domains()

if is_linux then
	config.default_prog = { "zsh" }
else
	config.default_prog = { "pwsh" }
	table.insert(config.ssh_domains, {
		name = "SSH:wsl-arch",
		remote_address = "localhost:2222",
		username = "krsma",
		ssh_option = {
			identityfile = wezterm.home_dir .. path_separator .. ".ssh" .. path_separator .. "id_rsa",
		},
		multiplexing = "None",
		default_prog = { "zsh" },
	})
	config.default_domain = "SSH:wsl-arch"
end

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

	-- The default text color
	foreground = "#e1e4dc",
	-- The default background color
	background = "#2e2c2f",

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
		"#2e2c2f", -- black
		"#9D4B53", -- red
		"#729B79", -- green
		"#436E64", -- yellow
		"#5292C6", -- blue
		"#8C6AA8", -- magenta
		"#326F73", -- cyan
		"#e1e4dc", -- white
	},
	brights = {
		"#403F42", -- black
		"#CD6169", -- red
		"#98CCA4", -- green
		"#609B8C", -- yellow
		"#76ACE6", -- blue
		"#B798E6", -- magenta
		"#3B8187", -- cyan
		"#FCFFF6", -- white
	},
}

config.window_background_opacity = 0.95
config.window_background_image = wezterm.config_dir
	.. path_separator
	.. "background"
	.. path_separator
	.. "abstr-blur-darker.png"

config.allow_win32_input_mode = false

local active_table_name = ""

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, _)
	active_table_name = window:active_key_table()
	if active_table_name == "copy_mode" then
		active_table_name = ""
	elseif active_table_name == "vim" then
		active_table_name = ": Vim mode"
	end
	window:set_right_status(active_table_name or "")
end)

wezterm.on("format-window-title", function(tab, _, tabs, _, _)
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
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("PrimarySelection"),
	},
}

return config
