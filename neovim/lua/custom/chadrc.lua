local M = {}

M.ui = {
  theme = "oxocarbon",
  transparency = true,
  statusline = {
    theme = "default",
    separator_style = "default",
    overriden_modules = function(modules)
      require("custom.statusline").override_statusline(modules)
    end,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
