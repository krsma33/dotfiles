local dap = require "dap"
local mason_registry = require "mason-registry"

-- .NET
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
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "\\bin\\Debug\\", "file")
    end,
  },
}

-- Rust
local codelldb = mason_registry.get_package "codelldb"
local codelldb_path = codelldb:get_install_path() .. "\\extension\\adapter\\codelldb.exe"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
  },
  detached = false,
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\target\\debug\\", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
