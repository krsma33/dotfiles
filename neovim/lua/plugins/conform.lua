return {
  "stevearc/conform.nvim",
  opts = {
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
  },
}
