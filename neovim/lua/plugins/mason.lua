return {
  {
    "mason-org/mason.nvim",
    opts = require("plugins.mason.mason"),
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
