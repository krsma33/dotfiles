return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    opts = require("plugins.coding.cmp"),
  },
  {
    "stevearc/conform.nvim",
    opts = require("plugins.coding.conform"),
  },
  {
    "L3MON4D3/LuaSnip",
    keys = require("plugins.coding.luasnip").keys,
  },
}
