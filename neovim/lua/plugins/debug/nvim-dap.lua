local path = require("utils.path")

return function()
  local dap = require("dap")
  if not dap.adapters["netcoredbg"] then
    if path.is_windows then
      local mason_registry = require("mason-registry")
      local netcoredbg = mason_registry.get_package("netcoredbg")
      local netcoredbg_path = path.combine(netcoredbg:get_install_path(), "netcoredbg", "netcoredbg.exe")
      require("dap").adapters.netcoredbg = {
        type = "executable",
        command = netcoredbg_path,
        args = { "--interpreter=vscode" },
        options = {
          detached = false,
        },
      }
    else
      require("dap").adapters.netcoredbg = {
        type = "executable",
        command = vim.fn.exepath("netcoredbg"),
        args = { "--interpreter=vscode" },
      }
    end
  end
  for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
    if not dap.configurations[lang] then
      dap.configurations[lang] = {
        {
          type = "netcoredbg",
          name = "Launch file",
          request = "launch",
          ---@diagnostic disable-next-line: redundant-parameter
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. path.path_separator, "file")
          end,
          cwd = "${workspaceFolder}",
        },
      }
    end
  end
end
