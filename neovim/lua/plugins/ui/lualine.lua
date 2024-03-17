local Util = require("lazyvim.util")

return function(_, opts)
  local icons = require("lazyvim.config").icons

  opts.options = {
    theme = "leaf-custom",
    component_separators = { left = "", right = "" },
  }

  opts.sections.lualine_b = {
    { "branch" },
    Util.lualine.root_dir(),
    {
      "diagnostics",
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
      },
    },
    { Util.lualine.pretty_path() },
    { "encoding", separator = "", padding = { left = 1, right = 0 } },
    "fileformat",
  }

  opts.sections.lualine_c = {
    { "%=", separator = "" },
    { "filetype", icon_only = true },
  }
end
