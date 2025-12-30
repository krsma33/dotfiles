return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = require("plugins.lsp.roslyn"),
  },
  {
    "neovim/nvim-lspconfig",
    opts = require("plugins.lsp.lspconfig").opts,
  },
}
