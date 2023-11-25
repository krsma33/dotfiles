local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local mason_registry = require "mason-registry"
local codelldb = mason_registry.get_package "codelldb"
local codelldb_path = codelldb:get_install_path() .. "\\extension\\adapter\\codelldb.exe"
local liblldb_path = codelldb:get_install_path() .. "\\extension\\lldb\\bin\\liblldb.dll"

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}

return options
