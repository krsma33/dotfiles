return {
  "rcarriga/nvim-dap-ui",
  opts = {
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.25,
          },
          {
            id = "breakpoints",
            size = 0.25,
          },
          {
            id = "stacks",
            size = 0.25,
          },
          {
            id = "watches",
            size = 0.25,
          },
        },
        position = "left",
        size = 80,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.55,
          },
          {
            id = "console",
            size = 0.45,
          },
        },
        position = "bottom",
        size = 0.25,
      },
    },
  },
}
