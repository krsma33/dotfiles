local dap = require "dap"
local mason_registry = require "mason-registry"
local netcoredbg = mason_registry.get_package "netcoredbg"
local netcoredbg_path = netcoredbg:get_install_path() .. "\\netcoredbg\\netcoredbg.exe"

dap.adapters.coreclr = {
  type = "executable",
  command = netcoredbg_path,
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "\\bin\\Debug\\", "file")
    end,
  },
}
