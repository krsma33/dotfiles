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
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = require("plugins.lspconfig.roslyn"),
  },
  {
    "mfussenegger/nvim-jdtls",
    ---@type lspconfig.options.jdtls
    ---@diagnostic disable: missing-fields
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
