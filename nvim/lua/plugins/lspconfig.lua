return {
  {
    "neovim/nvim-lspconfig",
    init = require("plugins.lspconfig.config_init")(),
    opts = function(_, opts)
      -- Use neovim 0.11 virtual text in options.lua instead
      opts.diagnostics.virtual_text = false
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = require("plugins.lspconfig.roslyn"),
  },
}
