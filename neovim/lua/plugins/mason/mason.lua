return function(_, opts)
  if type(opts.ensure_installed) == "table" then
    vim.list_extend(opts.ensure_installed, {
      "yamlfmt",
      -- "csharp-language-server",
      "netcoredbg",
    })
  end
end
