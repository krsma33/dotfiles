return {
  "neovim/nvim-lspconfig",
  init = require("plugins.lspconfig.init")(),
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      omnisharp = require("plugins.lspconfig.omnisharp"),
      yamlls = require("plugins.lspconfig.yamlls"),
    },
  },
}
