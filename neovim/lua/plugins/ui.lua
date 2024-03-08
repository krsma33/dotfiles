return {
  {
    "folke/tokyonight.nvim",
    opts = require("plugins.ui.tokyonight"),
  },
  {
    "catppuccin",
    opts = require("plugins.ui.catppuccin"),
  },
  {
    "daschw/leaf.nvim",
    opts = require("plugins.ui.leaf"),
  },
  {
    "LazyVim/LazyVim",
    opts = require("plugins.ui.lazyvim"),
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = require("plugins.ui.edgy").keys,
    opts = require("plugins.ui.edgy").opts,
  }
}
