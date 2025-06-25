return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = require("plugins.debug.nvim-dap"),
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = require("plugins.debug.nvim-dap-ui"),
  },
}
