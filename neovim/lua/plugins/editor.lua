return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = require("plugins.editor.neotree"),
  },
  {

    "folke/flash.nvim",
    opts = require("plugins.editor.flash"),
  },
  {
    "echasnovski/mini.bufremove",
    keys = require("plugins.editor.mini-bufremove").keys,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require("plugins.editor.telescope"),
  },
}
