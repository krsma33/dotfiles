-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { 'pwsh' }

config.enable_tab_bar = false

config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
config.font_size = 13

config.default_cursor_style = 'SteadyBar'

config.colors = {
  -- The default text color
  foreground = '#B3C6E6',
  -- The default background color
  background = '#15161E',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#A288F7',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = '#fefff2',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#53AA5E',

  -- the foreground color of selected text
  selection_fg = '#b5b5b5',
  -- the background color of selected text
  selection_bg = '#33467C',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    '#2D283F',
    '#ED2261',
    '#1FA91B',
    '#9ECE6A',
    '#487DF4',
    '#8D35C9',
    '#3BDEED',
    '#9E9EA8',
  },
  brights = {
    '#59516A',
    '#F8729A',
    '#53AA5E',
    '#9ECE6A',
    '#A9BCEC',
    '#AD81C2',
    '#9DE3EB',
    '#A288F7',
  },

}

config.window_background_opacity = 0.97

config.allow_win32_input_mode = false

config.keys = {
  {
    key = 'Space',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment
  },
  {
    key = 'Space',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment
  },
  {
    key = 'F11',
    mods = '',
    action = wezterm.action.ToggleFullScreen
  },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom("PrimarySelection"),
  },
}

return config
