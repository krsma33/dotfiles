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
    "nvim-lualine/lualine.nvim",
    opts = require("plugins.ui.lualine"),
  },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    opts = require("plugins.ui.noice"),
  },
  {
    "rcarriga/nvim-notify",
    opts = require("plugins.ui.nvim-notify"),
  },
  {
    "nvim-mini/mini.icons",
    opts = require("plugins.ui.mini-icons"),
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = require("plugins.ui.edgy").opts,
  },
}
