return function (_, opts)
  local config = require("fzf-lua.config")
  config.defaults.keymap.builtin["<M-p>"] = "toggle-preview"
  opts.winopts.preview.hidden = true
  opts.winopts.preview.horizontal = "right:50%"
end
