return {
  formatters_by_ft = {
    yaml = { "yamlfmt" },
  },
  formatters = {
    yamlfmt = {
      prepend_args = {
        "-formatter",
        "indentless_arrays=true",
      },
    },
  },
}
