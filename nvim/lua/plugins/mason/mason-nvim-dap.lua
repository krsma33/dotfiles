local path = require("utils.path")

return {
  automatic_installation = true,
  ensure_installed = {
    "coreclr",
  },
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      -- Keep original functionality
      require("mason-nvim-dap").default_setup(config)
    end,
    coreclr = function(config)
      if path.is_windows then
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
      end
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}
