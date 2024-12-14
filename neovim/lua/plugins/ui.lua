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
    opts = require("plugins.ui.edgy").opts,
  },
  {
    "goolord/alpha-nvim",
    opts = require("plugins.ui.alpha"),
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
    "echasnovski/mini.icons",
    opts = require("plugins.ui.mini-icons"),
  },
  -- {
  --   "declancm/cinnamon.nvim",
  --   event = "VimEnter",
  --   config = true,
  --   init = function()
  --     local cinnamon = require("cinnamon")
  --     -- Centered scrolling:
  --     vim.keymap.set("n", "<C-U>", function()
  --       cinnamon.scroll("<C-U>zz")
  --     end)
  --     vim.keymap.set("n", "<C-D>", function()
  --       cinnamon.scroll("<C-D>zz")
  --     end)
  --   end,
  -- },
}
