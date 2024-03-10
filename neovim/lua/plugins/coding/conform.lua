return {
  formatters_by_ft = {
    yaml = { "yamlfmt" },
    cs = { "csharpier" },
  },
  formatters = {
    yamlfmt = {
      prepend_args = {
        "-formatter",
        "indentless_arrays=true",
      },
    },
    csharpier = {
      command = "dotnet-csharpier",
      args = { "--write-stdout" },
    },
  },
}
