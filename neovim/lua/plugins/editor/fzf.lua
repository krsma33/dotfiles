return function (_, opts)
  local config = require("fzf-lua.config")
  config.defaults.keymap.builtin["<M-p>"] = "toggle-preview"
  opts.preview_opts = "hidden"
end
