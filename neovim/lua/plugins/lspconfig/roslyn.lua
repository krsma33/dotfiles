return {
  dotnet_cmd = "dotnet",
  roslyn_version = "4.9.0-3.23604.10",
  on_attach = require("lazyvim.plugins.lsp.keymaps").on_attach,
}
