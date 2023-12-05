local path = require("utils.path")

return {
  { "Issafalcon/neotest-dotnet" },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mason.nvim",
    },
    opts = function()
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
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-dotnet"] = {
          -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
          -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
          --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
          discovery_root = "solution",
        },
      },
    },
  },
}
