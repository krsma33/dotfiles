return {
  {
    "snacks.nvim",
    opts = require("plugins.editor.snacks").opts,
  },
  {

    "folke/flash.nvim",
    opts = require("plugins.editor.flash"),
  },
  {
    "echasnovski/mini.bufremove",
    keys = require("plugins.editor.mini-bufremove").keys,
  },
}
