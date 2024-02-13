local path = require("utils.path")

return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    automatic_installation = true,

    handlers = {
      function(config)
        -- all sources with no handler get passed here
        -- Keep original functionality
        require("mason-nvim-dap").default_setup(config)
      end,
      coreclr = function(config)
        local mason_registry = require("mason-registry")
        local netcoredbg = mason_registry.get_package("netcoredbg")
        local netcoredbg_path = path.combine(netcoredbg:get_install_path(), "netcoredbg", "netcoredbg.exe")
        config.adapters = {
          type = "executable",
          command = netcoredbg_path,
          args = { "--interpreter=vscode" },
          options = {
            detached = false,
          },
        }
        require("mason-nvim-dap").default_setup(config)
      end,
    },

    ensure_installed = {
      "coreclr",
    },
  },
}
