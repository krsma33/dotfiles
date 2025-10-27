return function(_, opts)
  if type(opts.ensure_installed) == "table" then
    vim.list_extend(opts.ensure_installed, {
      "yamlfmt",
      "netcoredbg",
      "roslyn"
    })
  end
  opts.registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry", -- roslyn and rzls (if I need razor support at some point)
  }
end
