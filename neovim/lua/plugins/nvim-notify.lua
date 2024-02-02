return {
  "rcarriga/nvim-notify",
  config = function(plugin, opts)
    local notify = require("notify")
    notify.setup({
      background_colour = "#1a1b26",
    })
  end,
}
