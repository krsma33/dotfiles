return {
  {
    "mason-org/mason.nvim",
    version = "1.11.0", -- workaround until support for mason v2 comes to lazyvim
    opts = require("plugins.mason.mason"),
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "1.32.0", -- workaround until support for mason v2 comes to lazyvim
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = require("plugins.mason.mason-nvim-dap"),
  },
}
