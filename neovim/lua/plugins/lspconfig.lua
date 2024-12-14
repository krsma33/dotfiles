return {
  {
    "neovim/nvim-lspconfig",
    init = require("plugins.lspconfig.config_init")(),
    -- opts = {
    --   inlay_hints = { enabled = false },
    --   codelens = { enabled = false },
    --   -- servers = {
    --   --   omnisharp = require("plugins.lspconfig.omnisharp"),
    --   --   csharp_ls = require("plugins.lspconfig.csharp_ls"),
    --   -- },
    -- },
  },
  -- {
  --   "Decodetalkers/csharpls-extended-lsp.nvim",
  --   lazy = true,
  -- },
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = require("plugins.lspconfig.roslyn"),
  },
  {
    "mfussenegger/nvim-jdtls",
    ---@type lspconfig.options.jdtls
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      jdtls = function(opts)
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
        table.insert(opts.cmd, "--jvm-arg=" .. jvmArg)
        return opts
      end,
    },
  },
}
