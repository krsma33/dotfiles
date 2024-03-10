return {
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    init = require("plugins.lspconfig.init")(),
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- omnisharp = require("plugins.lspconfig.omnisharp"),
        csharp_ls = require("plugins.lspconfig.csharp_ls"),
        yamlls = require("plugins.lspconfig.yamlls"),
      },
    },
  },
}
